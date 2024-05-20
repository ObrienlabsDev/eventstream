#!/bin/bash
#

# for eash of override - key/value pairs for constants - shared by all scripts


usage() {
  cat <<EOF
Usage: $0 [PARAMs]
example 
EOF
}

source ./vars.sh


deployment() {

  echo "Date: $(date)"
  echo "Timestamp: $(date +%s)"
  echo "$UNIQUE"
  echo "running with create=${CREATE_PROJ} delete=${DELETE_PROJ}"


if [[ "$CREATE_PROJ" != false ]]; then
  # 
  # service account

  # iam roles for user

  # iam roles for service account
  
  # project services enablement
  
  # create bucket

  # create cloud function

  # BQ schema
  
  # Logging
   



fi






  end=`date +%s`
  runtime=$((end-start))
  echo "Total Duration: ${runtime} sec"
  echo "Date: $(date)"
  echo "Timestamp: $(date +%s)"
}

UNIQUE=old
CREATE_PROJ=false
DELETE_PROJ=false
while getopts ":c:d:u:" PARAM; do
  case $PARAM in
    c)
      CREATE_PROJ=${OPTARG}
      ;;
    d)
      DELETE_PROJ=${OPTARG}
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

#  echo "Options are: -c true/false (create) -d true/false (delete proj)"


if [[ -z $UNIQUE ]]; then
  usage
  exit 1
fi

echo "existing project: $PROJECT_ID"
deployment "$CREATE_PROJ" "$DELETE_PROJ"
printf "**** Done ****\n"
