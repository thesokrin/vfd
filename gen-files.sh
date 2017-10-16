#!/bin/bash
shopt -s expand_aliases
rootDir=$(pwd)
oldIFS=$IFS

function errCatch() {
	err=$1; echo "Error $err. Exiting..."; exit $err
}

echo "Initial checks..."
if [[ ! -e ./atlas ]]; then
	echo "Atlas directory is being populated..."
	#sleep 10
	git clone git@github.com:grindrllc/atlas.git || errCatch $?
	echo "Done!"
else
	cd atlas
	git checkout master && git pull || git reset --hard && git pull || errCatch $?
	cd $rootDir
	echo "Atlas directory is ready!"
fi

# either just run this with no arguments and it will ask what's needed to spin up anything or you can fill out a vars file.
# if you missed anything then it will ask for clarification...then using MAGIC it will generate the files for the resource and spin it up

# will write a better "roundabout" function here
function deriveVars() {
	# echo -n " - Refreshing variables... - "
	if [[ "$account_id" || "$account_description" ]]; then account="$(cat account.map | grep $account | cut -d',' -f1)"; fi
	if [[ "$account" ]]; then account_description="$(cat account.map | grep $account | cut -d',' -f2)"; fi
	if [[ "$account" ]]; then account_id="$(cat account.map | grep $account | cut -d',' -f3)"; fi
	if [[ "$environment_fancy" || "$environment_description" ]]; then environment="$(cat environment.map | grep $environment | cut -d',' -f1)"; fi
	if [[ "$environment" ]]; then environment_fancy="$(cat environment.map | grep $environment | cut -d',' -f2)"; fi
	if [[ "$environment" ]]; then environment_description="$(cat environment.map | grep $environment | cut -d',' -f3)"; fi

	if [[ "$fancyname" ]]; then name=$(echo $fancyname | perl -pe 'y/[A-Z]/[a-z]/' | sed 's/[^a-zA-Z0-9]//g'); else echo "Fancy Name (required for magic): "; read fancyname; fi
}

function sourceFile() {
	filename=$1
	if [[ -e "$filename" ]]; then
		echo "Reading $filename..."
		source $filename
		deriveVars
		return 0;
	else
		return 1;
	fi;
}

function checkVar() {
	deriveVars
	varchk=$1
	#echo F $fancyname f $var
	#echo v $varchk V ${!varchk}
	while [[ x${!varchk} == "x" ]]; do
		echo -n "Enter value for ${varchk}: "; read ${varchk}
	done
	if [[ x${!varchk} == 'xnull' ]]; then
		echo "Setting variable to blank!"
		unset ${varchk}
	fi
	# Shake it once, that's fine. Shake it twice, that's okay. Shake it 3 times...
	deriveVars;deriveVars

	if [[ -e "${varchk}.map" ]]; then
		while ! grep ${!varchk} ${varchk}.map >/dev/null; do
			echo "Option '${!varchk}' is invalid. Possible valid options are: "
			cat ${varchk}.map
			echo -n "Enter new value: "; read ${varchk}
			# Shake it once, that's fine. Shake it twice, that's okay. Shake it 3 times...
			deriveVars;deriveVars
		done
	fi
	if [[ $optionsFile ]]; then echo "$varchk=\"${!varchk}\"" | tee -a $optionsFile
	else echo "\"${!varchk}\""; fi
}

while getopts "n:d:e:l:a:hvo:r:p:" opt; do
  case $opt in
		n)
			echo "fancy name: $OPTARG" >&2
			fancyname=$OPTARG
      ;;
		d)
			echo "description: $OPTARG" >&2
			description=$OPTARG
    ;;
		e)
			echo "environment: $OPTARG" >&2
			environment=$OPTARG
    ;;
		l)
			echo "layer: $OPTARG" >&2
			layer=$OPTARG
    ;;
		a)
			echo "account: $OPTARG" >&2
			account=$OPTARG
    ;;
		o)
			echo "Write options to: $OPTARG" >&2
			optionsFile=$OPTARG; echo -n ''> $optionsFile || errCatch $?
    ;;
		p)
			echo "Policy file: $OPTARG" >&2
			policyFile=$OPTARG
    ;;
		r)
			echo "Read options from: $OPTARG" >&2
			sourceFile=$OPTARG; source $sourceFile || errCatch $?
    ;;
		h)
			echo "-n fancyname -d description -e environment -l layer -a account -o optionsfile -r read from this options file";
			exit 0
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

echo ""

# futurey sourcey cleanupy stuffs
sourceFile "config.defaults" || echo "Defaults file config.defaults was NOT found. "#default variables on a per-creator basis
sourceFile "core.defaults" || echo "core file core.defaults was NOT found. "#default variables on a per-creator basis

# set variables. we're down to 5 inputs required at runtime. yaa!
#fname=$1
#name = $(echo $fancyname | sed 's/'s/\(.*\)/\L\1/'| sed 's/[^a-zA-Z0-9]//g'); fi
if [[ $sourceFile ]]; then sourceFile $sourceFile; fi

if [[ ! $fancyname ]]; then echo "Fancy Name (required for magic): "; read fancyname; fi

if [[ ! $name ]]; then
	name=$(echo $fancyname | perl -pe 'y/[A-Z]/[a-z]/' | sed 's/[^a-zA-Z0-9]//g')
fi
sourceFile "${name}.options" || echo "Options file for $name not found." #file full of everything needed to spin up anything ever that isn't included in the defaults

if [[ $sourceFile ]]; then sourceFile $sourceFile; fi

# auto-determined values (there's no such thing as MAGIC)
# do a little logic (break a sweat with that elbow grease)
deriveVars

# prepare git
cd $rootDir/atlas || exit 1
if ! git branch -l | grep "feature/$name"; then
	git branch "feature/$name" &&	git checkout "feature/$name"
else
	git checkout "feature/$name" && git branch --set-upstream-to=origin/feature/$name feature/$name && git pull
fi
cd $rootDir

#exit 0

# make it so it will auto-gen the resources files around the module-required definitions auto-gen'd from grepping/sed'ing the module
# files. possibly future, interactive-repair during checks. no need to edit,save,plan... . just edit, plan, improvise, done
# check if module exists. if it doesn't then make directory structure and prepare to ask moduley questions

# eventually flip through an array of modules listed (do modules require anything extra?)
# if moduledir doesn't exist then ask_modules=1
function checkModule() {
	if [[ -e "atlas/modules/$module/" ]]; then
		echo "Module "$module" exists!"
		ask_modules='0'
	else
		echo "Module "$module" not found!"
		module=''
	fi
}
# if remote state isn't defined then use the atlas remote state - in future you can specify multiple remote states,
# each assigned to it's short name

# make echo not return a newline automatically
alias echo='echo -e -n'

if [[ $sourceFile ]]; then sourceFile $sourceFile; fi
deriveVars

echo "\n"
echo "---Variables---\n"

IFS=$(echo -en "\n\b")
alias csv="cut -d','"
for line in $(cat ${rootDir}/variables.base); do
	template=$(echo $line | csv -f1)
	var=$(echo $line | csv -f2 | sed 's/^\$//g')
	fancyvar=$(echo $line | csv -f3)
	echo -n " $fancyvar: "; checkVar $var
done
IFS=$oldIFS

echo "---End of Variables---\n"
echo "\n"

echo -n "Press ENTER to generate or CTRL+C to stop"; read

# reset echo
alias echo=echo

# populate the basic templates (eventually source a global variables.tf file instead of things flying willy-nilly)
## woah there, exiting now cause debug!!
#exit 0

# prepare directory structure
./getvars
rootDir=$(pwd)
cd $rootDir/atlas
if [[ "x$environment" == "xhub" ]]; then
	newdir="hubs/hub1/$type/$name"
else
	newdir="environments/$environment/$type/$name"
fi

echo "Resource destination location: "$newdir
mkdir -p $newdir || exit 1
cd $newdir || exit 1
echo "Cleaning directory..."
rm "*" > /dev/null
#ls $rootDir/template/base/*
cp -r $rootDir/template/base/* .
# if [[ $policyFile ]]; then cp $policyFile $name.json; fi
# if [[ ! -e $name.json ]]; then mv default.json $name.json; fi
pwd
#exit

echo "Generating tf files..."
alias sed="sed"
IFS=$(echo -en "\n\b")
for file in $(ls -1); do
	for line in $(cat ${rootDir}/variables.base); do
		template=$(echo $line | csv -f1)
		var=$(echo $line | csv -f2 | sed 's/^\$//g')
		fancyvar=$(echo $line | csv -f3)
		#echo v $var V ${!var}
		sed -i "s/$template/${!var}/g" $file
	done
	#sed -i -e '/^[ \t]*#/d' ${file}
done
IFS=$oldIFS
alias sed='sed'

# start getting nosey with the chat questions

# stuff that should have been filled out (the 5 basic questions, who what where why when) that weren't get a 2nd runover here

# won't bother asking anything if the var isn't null - sourced from the one single resource defining file...instead of 5-10

# instance?
	# quantity?
	# type?
# storage?
	# undetermined questions so far...size? access style?
# asg?
	# cidr-block access allowance? default to layer-range (if it's "services" then it will get "public", "services", and "data" blocks)
	# other asg-like questions that can't be determined?
# permissions
	# if it's not using storage then why include anything to do with s3?
	# bucket generation determines things like read/write/access

PATH=$PATH:/bin:/usr/bin

echo "Generation complete!"
IFS=$oldIFS
echo "Running plan..."
cd $rootDir/atlas

$(aws-env $account)

i=0
exec 3>&1
while echo $(vagrant ssh -c "make -C /vagrant/$newdir plan | tee /vagrant/plan.output" 2>&1 1>&3) | grep 'vagrant up' > /dev/null
do
	i=$((i+1))
	vagrant up || errCatch $?
	if [[ $i > "3" ]]; then echo "3 attempts to launch this jalopy failed. Aborting..."; exit 1; fi
done
exec 3>&-

#err=$?
#echo "Plan has run. It returned $err"

alias grep="grep --colour=never"

cd $rootDir

if grep  "error(s) occurred" atlas/plan.output; then
	grep "^\*" atlas/plan.output
	exit $err
fi

echo -n '```' > $name.plan; cat atlas/plan.output | awk '/------------/{flag=1;next}/----------------------/{flag=0}flag' >> $name.plan; echo '```' >> $name.plan

cd atlas || exit 1
git add $newdir || exit 1
git status; echo -n "It looks like everything went well. Press enter to commit or CTRL+C to exit."; read
git commit || errCatch $?

# FIX THIS!!!!!
echo -n "Would you like to rebase? [Y/n]: "
while [[ x$(read rebase) != "xY" || "xn" || "x" ]]; do echo "$rebase is an invalid response!";done
if [[ x$rebase == 'xY' || 'x' ]]; then echo git rebase -i; fi
else
	echo "Skipping rebase!"
fi

git push origin feature/$name

echo "The plan results can be seen in $name.plan"
