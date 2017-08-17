#!/bin/bash
# either just run this with no arguments and it will ask what's needed to spin up anything or you can fill out a vars file.
# if you missed anything then it will ask for clarification...then using MAGIC it will generate the files for the resource and spin it up

function sourceFile() {
	filename=$1
	if [[ -e "$filename" ]]; then
		source $filename
		return 0;
	else
		return 1;
	fi;
}

while getopts ":a:" opt; do
  case $opt in
		a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
		b)
      echo "-a was triggered, Parameter: $OPTARG" >&2
    ;;
		c)
      echo "-a was triggered, Parameter: $OPTARG" >&2
    ;;
		d)
      echo "-a was triggered, Parameter: $OPTARG" >&2
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

exit 0

if [[ "x$1" == "xhelp" || ! $1 ]]; then
	echo "fancyname description environment layer account";
	exit 0
fi

# futurey sourcey cleanupy stuffs
sourceFile "config.defaults" || echo "Defaults file config.defaults is NOT found. "#default variables on a per-creator basis
sourceFile "core.defaults" || echo "Defaults file config.defaults is NOT found. "#default variables on a per-creator basis

# set variables. we're down to 5 inputs required at default. yaa!
fname=$1
#name = $(echo $fname | sed 's/'s/\(.*\)/\L\1/'| sed 's/[^a-zA-Z0-9]//g'); fi
if [[ ! $name ]]; then
	name=$(echo $fname | perl -pe 'y/[A-Z]/[a-z]/' | sed 's/[^a-zA-Z0-9]//g')
fi
sourceFile "${name}.project" || echo "Project file for $name not found." #file full of everything needed to spin up anything ever that isn't included in the defaults
description=$2
environment=$3
layer=$4
account=$5

# auto-determined values (there's no such thing as MAGIC)
# do a little logic (break a sweat with that elbow grease)
account_id="$(cat accounts.map | grep $account | cut -d',' -f3)"
account_description="$(cat accounts.map | grep $account | cut -d',' -f2)"
environment_fancy="$(cat environments.map | grep $environment | cut -d',' -f2)"
environment_description="$(cat environments.map | grep $environment | cut -d',' -f3)"

# reset the spanish inquisition state
ask_instances='0'
ask_asg='0'
ask_storage='0'
ask_ports='0'
ask_modules='0'


# purely static variables-ish
modules='atlas_static_module' # soon to be 'atlas_defaults' and then if REQUIRED you can EASILY tack on any other module

# make it so it will auto-gen the resources files around the module-required definitions auto-gen'd from grepping/sed'ing the module
# files. possibly future, interactive-repair during checks. no need to edit,save,plan... . just edit, plan, improvise, done
# check if module exists. if it doesn't then make directory structure and prepare to ask moduley questions

# eventually flip through an array of modules listed (do modules require anything extra?)
# if moduledir doesn't exist then ask_modules=1
if [[ -e "structure/modules/$modules/" ]]; then
	echo "Module exists!"
	ask_modules='0'
else
	echo "Module hasn't been existed yet!"
	ask_modules='1'
fi
# if remote state isn't defined then use the atlas remote state - in future you can specify multiple remote states,
# each assigned to it's short name
remotestate="atlas"

# prepare directory structure
cd ~/vfd/structure
if [[ "x$environment" == "xhub" ]]; then
	newdir="hubs/hub1/$type/$name"
else
	newdir="environments/$environment/$type/$name"
fi

echo "Resource destination location: "$newdir
mkdir -p $newdir
cd $newdir
cp -r ~/vfd/resource/* .
pwd

echo ""
echo "variables:"
echo $fname
echo $name
echo $description
echo $type
echo $team
echo $owner
echo $environment
echo $remotestate
echo $account
echo $account_description
echo $account_id
echo "end variables"
echo ""
# populate the basic templates (eventually source a global variables.tf file instead of things flying willy-nilly)
# woah there, exiting now cause debug!!
#exit 0

IFS=$(echo -en "\n\b")
for file in $(ls -1); do
	sed 's/$_FANCY_NAME/$fname/g' $file
	sed 's/$_NAME/$name/g' $file
	sed 's/$_TYPE/$type/g' $file
	sed 's/$_OWNER/$owner/g' $file
	sed 's/$_TEAM/$team/g' $file
	sed 's/$_DESCRIPTION/$description/g' $file
	sed 's/$_ENVIRONMENT/$environment/g' $file
	sed 's/$_ENVIRONMENT_FANCY/$environment_fancy/g' $file
	sed 's/$_ENVIRONMENT_DESCRIPTION/$environment_description/g' $file
	sed 's/$_REMOTE_STATE/$remotestate/g' $file
	sed 's/$_ACCOUNT_NAME/$account/g' $file
	sed 's/$_ACCOUNT_DESCRIPTION/$account_description/g' $file
	sed 's/$_ACCOUNT_ID/$account_id/g' $file
#	sed 's/$_//g' $file
done

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
