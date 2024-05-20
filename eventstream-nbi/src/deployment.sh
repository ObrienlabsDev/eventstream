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
  echo "running with create=${CREATE_PROJ} delete=${DELETE_PROJ} boot_project_id=${BOOT_PROJECT_ID}"

if [[ "$CREATE_PROJ" != false ]]; then
  # linux
  STREAM_PROJECT_RAND=$(shuf -i 0-10000 -n 1)
  # osx
  #STREAM_PROJECT_RAND=$(jot -r 1 1000 10000)
  STREAM_PROJECT_ID=${STREAM_PROJECT_NAME_PREFIX}-${STREAM_PROJECT_RAND}
  echo "Creating project: $STREAM_PROJECT_ID"
else
  STREAM_PROJECT_ID=${STREAM_PROJECT_ID_PASSED}
  echo "Reusing project: $STREAM_PROJECT_ID"
fi

echo "STREAM_PROJECT_ID: $STREAM_PROJECT_ID"
exit 1

if [[ "$CREATE_PROJ" != false ]]; then
  # create project
  gcloud config set project "${BOOT_PROJECT_ID}"
  BILLING_FORMAT="--format=value(billingAccountName)"
  BILLING_ID=$(gcloud billing projects describe $BOOT_PROJECT_ID $BILLING_FORMAT | sed 's/.*\///')
  gcloud beta billing projects link "${STREAM_PROJECT_ID}" --billing-account "${BILLING_ID}"
  ORG_ID=$(gcloud projects get-ancestors $BOOT_PROJECT_ID --format='get(id)' | tail -1)
  
  gcloud beta billing projects link "${STREAM_PROJECT_ID}" --billing-account "${BILLING_ID}"  
  gcloud config set project "${STREAM_PROJECT_ID}"

  
  # service account

  # iam roles for user

  # iam roles for service account
  
  # project services enablement
  
  # create bucket

  # create cloud function

  # BQ schema
  
  # Logging
 
  # RETURN
  gcloud config set project "${BOOT_PROJECT_ID}"  



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
STREAM_PROJECT_ID=
BOOT_PROJECT_ID=
while getopts ":c:d:b:u:" PARAM; do
  case $PARAM in
    c)
      CREATE_PROJ=${OPTARG}
      ;;
    d)
      DELETE_PROJ=${OPTARG}
      ;;
    b)
      BOOT_PROJECT_ID=${OPTARG}
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

#  echo "Options are: -c true/false (create) -d true/false (delete proj) -b BOOT_PROJ_ID"


if [[ -z $UNIQUE ]]; then
  usage
  exit 1
fi

echo "existing project: $PROJECT_ID"
deployment "$CREATE_PROJ" "$DELETE_PROJ" "$BOOT_PROJECT_ID"
printf "**** Done ****\n"
