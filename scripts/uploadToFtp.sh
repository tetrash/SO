#!/usr/bin/env bash

. $(dirname "$0")/../.env

uploadToFtp() {
    if [ !$1 ]; then
        echo "uploadToFtp.sh requires 1 parameter"
        exit 1
    fi

    if [ !FTP_USER ] || [ !FTP_PASSWORD ] || [ !FTP_HOST ] || [ !FTP_DIRECTORY ]; then
        echo "uploadToFtp.sh requires FTP_USER FTP_PASSWORD FTP_HOST FTP_DIRECTORY variables"
        exit 1
    fi

    FILE_NAME=$1
    echo "Uploading $FILE_NAME to $FTP_USER@$FTP_HOST/$FTP_DIRECTORY"

    lftp -u $FTP_USER,$FTP_PASSWORD $FTP_HOST/$FTP_DIRECTORY -e "put -a $FILE_NAME;quit"
}
