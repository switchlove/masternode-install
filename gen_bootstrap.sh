#!/bin/bash
TAG=$(date +"%m.%d.%y")
DATE=$(date)
TITLE='Bootstrap'
DESC='Blockchain imported into bootstrap.dat as of'
SCRIPTROOT='/root/.mnscripts/'
FILEROOT='/root/.lemonad/blocks/'
FILENAME='bootstrap.dat'

# make new bootstrap.dat
ls -1 $FILEROOT/blk[0-9]*.dat | sort | xargs cat > $FILENAME

# make your tag and upload
git tag $TAG && git push --tags
gothub release --user switchlove --repo masternode-install --tag $TAG --name "$TITLE" --description "$DESC $DATE."
gothub upload --user switchlove --repo masternode-install --tag $TAG --name "$FILENAME" --file $FILENAME
