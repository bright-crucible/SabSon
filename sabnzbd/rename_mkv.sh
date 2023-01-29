#!/usr/bin/env bash
shopt -s dotglob
USAGE="$0"
FINAL_DIR="$1"
JOB_NAME="$2"
CLEAN_NAME="$3"
INDEX_REPORT="$4"
CATEGORY="$5"
GROUP="$6"
STATUS="$7"
URL="$8"

EXIT_CODE="${STATUS}"
EXIT_STRING="Completed"
fileInfo=('Matroska data' 'ISO Media, MP4 Base Media v1 [ISO 14496-12:2003]')
fileExts=("mkv" "mp4")

echo "Invocation: ${USAGE}"
echo "Final directory: ${FINAL_DIR}"
echo "Job name: ${JOB_NAME}"
echo "Clean name: ${CLEAN_NAME}"
echo "Index report: ${INDEX_REPORT}"
echo "Category: ${CATEGORY}"
echo "Group: ${GROUP}"
echo "Status: ${STATUS}"
echo "URL: ${URL}"
echo

if ! [ -d "$FINAL_DIR" ]
then
    echo "Missing Final Directory..." >&2
    exit 1
fi

if [ "${STATUS}" != 0 ]
then
    echo "Task did not succeed, exiting." >&2
    exit 0
fi

for entry in "$FINAL_DIR"/*
do
    echo "Entry: ${entry}"
    TYPE=`file -b "${entry}"`
    echo "Type: ${TYPE}"
    for i in "${!fileInfo[@]}"
    do
        if [ "${fileInfo[$i]}" = "${TYPE}" ]
        then
            #check the file extension
            #add file extension if missing
            if ! echo "${entry}" | grep -i -q -e "\\.${fileExts[$i]}\$"
            then
                if mv -n "${entry}" "${entry}.${fileExts[$i]}"
                then
                    printf "Renamed: \n    ${entry}\n    ${entry}.${fileExts[$i]}\n"
                else
                    printf "Unable to rename: \n    ${entry}\n    ${entry}.${fileExts[$i]}\n"
                    EXIT_CODE=1
                fi
                EXIT_STRING="Renamed"
            fi
        fi
    done
    echo
done
echo "${EXIT_STRING}"
exit ${EXIT_CODE}
