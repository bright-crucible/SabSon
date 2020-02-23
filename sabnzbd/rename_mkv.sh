#!/bin/sh
USAGE="$0"
FINAL_DIR="$1"
JOB_NAME="$2"
INDEX_REPORT="$3"
CATEGORY="$5"
GROUP="$6"
STATUS="$7"
URL="$8"

MATROSKA="Matroska data"
EXT="mkv"
EXIT_CODE=0

if [ -z $FINAL_DIR ]
then
    echo "Missing Final Directory..." >&2
    exit 1
fi

echo "Job name: ${JOB_NAME}"
echo "Final directory: ${FINAL_DIR}"
echo "Index report: ${INDEX_REPORT}"
echo "Category: ${CATEGORY}"
echo "Processing status: ${STATUS}"
echo "Group: ${GROUP}"
echo "URL: ${URL}"

for entry in "$FINAL_DIR"/*
do
    echo "Entry: ${entry}"
    TYPE=`file -b "${entry}"`
    if [ "${TYPE}" == "${MATROSKA}" ]
    then
        BASENAME=`basename "${entry}"`
        EXTENSION="${BASENAME##*.}"
        echo "Entry extension: ${EXTENSION}"
        if [ "${EXTENSION}" != "${EXT}" ]
        then
            if mv "${entry}" "${entry}.${EXT}"
            then
                echo -e "Renamed \n\t${entry} \n\tto \n\t${entry}.${EXT}"
            else
                echo -e "Failed, could not rename \n\t${entry} \n\tto \n\t${entry}.${EXT}" >&2
                EXIT_CODE=1
            fi
        fi
    fi
done
echo Completed
exit ${EXIT_CODE}
