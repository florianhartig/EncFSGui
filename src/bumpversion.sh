#/bin/sh
infofile=$1.app/Contents/Info.plist
echo Updating version number in $infofile
major=`cat version.txt | cut -d. -f1`
minor=`cat version.txt | cut -d. -f2`
revision=`cat version.txt | cut -d. -f3`
revision=`expr $revision + 1`
echo $major.$minor.$revision > version.txt
echo New version:
cat version.txt
sed "s/ENCFSGUIVERSION/$major.$minor.$revision/g" Info.plist.in > $infofile
echo Done updating version