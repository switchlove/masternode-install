#!/bin/bash
TAG=$(date +"%m.%d.%y")
TITLE='Bootstrap'
DESC='Blockchain imported into bootstrap.dat as of $(date).'
FILEROOT='/root/.lemonad/blocks/'
FILENAME='bootstrap.dat'

# make new bootstrap.dat
cd $FILEROOT
ls -1 blk[0-9]*.dat | sort | xargs cat > $FILENAME

# make your tag and upload
git tag $TAG && git push --tags
gothub upload --user switchlove --repo masternode-install --tag $TAG --name "$Title" --description "$DESC" --file $FILEROOT/$FILENAME

