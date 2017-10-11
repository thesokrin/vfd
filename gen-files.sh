#!/bin/bash
shopt -s expand_aliases
# either just run this with no arguments and it will ask what's needed to spin up anything or you can fill out a vars file.
# if you missed anything then it will ask for clarification...then using MAGIC it will generate the files for the resource and spin it up

function deriveVars() {
	account="$(cat account.map | grep $account | cut -d',' -f1)"
	account_description="$(cat account.map | grep $account | cut -d',' -f2)"
	account_id="$(cat account.map | grep $account | cut -d',' -f3)"
	environment="$(cat environment.map | grep $environment | cut -d',' -f1)"
	environment_fancy="$(cat environment.map | grep $environment | cut -d',' -f2)"
	environment_description="$(cat environment.map | grep $environment | cut -d',' -f3)"
}

function sourceFile() {
	filename=$1
	if [[ -e "$filename" ]]; then
		source $filename
		return 0;
	else
		return 1;
	fi;
}

function checkVar() {
	deriveVars
	var=$1
	#echo $var ${!var}
	if [[ ${!var} == "" ]]; then
		echo "Enter value: "; read ${var}
	elif [[ -e "${var}.map" ]]; then
		while ! grep ${!var} ${var}.map >/dev/null; do
			echo "Option '${!var}' is invalid. Possible valid options are: "
			cat ${var}.map
			echo -n "Enter new value: "; read ${var}
			deriveVars
		done
	fi
	echo "${!var}"
}

while getopts "n:d:e:l:a:h" opt; do
  case $opt in
		n)
			echo "fancy name: $OPTARG" >&2
			fname=$OPTARG
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
		h)
			echo "-n fancyname -d description -e environment -l layer -a account";
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
#exit 0

# futurey sourcey cleanupy stuffs
sourceFile "config.defaults" || echo "Defaults file config.defaults is NOT found. "#default variables on a per-creator basis
sourceFile "core.defaults" || echo "Defaults file config.defaults is NOT found. "#default variables on a per-creator basis

# set variables. we're down to 5 inputs required at runtime. yaa!
#fname=$1
#name = $(echo $fname | sed 's/'s/\(.*\)/\L\1/'| sed 's/[^a-zA-Z0-9]//g'); fi
if [[ ! $name ]]; then
	name=$(echo $fname | perl -pe 'y/[A-Z]/[a-z]/' | sed 's/[^a-zA-Z0-9]//g')
fi
sourceFile "${name}.project" || echo "Project file for $name not found." #file full of everything needed to spin up anything ever that isn't included in the defaults

# auto-determined values (there's no such thing as MAGIC)
# do a little logic (break a sweat with that elbow grease)
deriveVars

# reset the spanish inquisition state
ask_instances='0'
ask_asg='0'
ask_storage='0'
ask_ports='0'
ask_modules='0'


# purely static variables-ish
# soon to be 'atlas_defaults' and then if REQUIRED you can EASILY tack on any other module

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
		ask_modules='1'
	fi
}
# if remote state isn't defined then use the atlas remote state - in future you can specify multiple remote states,
# each assigned to it's short name

# make echo not return a newline automatically
alias echo='echo -e -n'

echo "\n"
echo "---Variables---\n"
echo " Fancy name: "; checkVar fname
echo " Short name: "; checkVar name
echo " Description: "; checkVar description
echo " Type: "; checkVar type
echo " Team: "; checkVar team
echo " Owner: "; checkVar owner
echo " Environment: "; checkVar environment
echo " Remote state: "; checkVar remotestate
echo " Account: "; checkVar account
echo " Account Description: "; checkVar account_description
echo " Account ID: "; checkVar account_id
echo " Module: "; checkVar module
echo "---End of Variables---\n"
echo "\n"

# reset echo
alias echo=echo

# populate the basic templates (eventually source a global variables.tf file instead of things flying willy-nilly)
## woah there, exiting now cause debug!!
#exit 0

# prepare directory structure
rootDir=$(pwd)
cd ~/vfd/atlas
if [[ "x$environment" == "xhub" ]]; then
	newdir="hubs/hub1/$type/$name"
else
	newdir="environments/$environment/$type/$name"
fi

echo "Resource destination location: "$newdir
mkdir -p $newdir || exit 1
cd $newdir || exit 1
echo "Cleaning directory..."
rm * 2>/dev/null
cp -r ~/vfd/resource/* .
pwd

echo "Generating tf files..."
alias sed="sed -i"
IFS=$(echo -en "\n\b")
for file in $(ls -1); do
	sed -i "s/\$_FANCY_NAME/$fname/g" $file
	sed -i "s/\$_NAME/$name/g" $file
	sed -i "s/\$_TYPE/$type/g" $file
	sed -i "s/\$_OWNER/$owner/g" $file
	sed -i "s/\$_TEAM/$team/g" $file
	sed -i "s/\$_DESCRIPTION/$description/g" $file
	sed -i "s/\$_ENVIRONMENT/$environment/g" $file
	sed -i "s/\$_ENVIRONMENT_FANCY/$environment_fancy/g" $file
	sed -i "s/\$_ENVIRONMENT_DESCRIPTION/$environment_description/g" $file
	sed -i "s/\$_REMOTE_STATE/$remotestate/g" $file
	sed -i "s/\$_ACCOUNT_NAME/$account/g" $file
	sed -i "s/\$_ACCOUNT_DESCRIPTION/$account_description/g" $file
	sed -i "s/\$_ACCOUNT_ID/$account_id/g" $file
	sed -i "s/\$_MODULE/$module/g" $file
	#sed -i "s/\$_//g' $file
done

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

echo "Generation complete!"
echo "Running plan..."
cd $rootDir
aws-env $account && vagrant ssh -c "make -C $newdir plan > plan.output"
echo "Plan has run. It was a "
