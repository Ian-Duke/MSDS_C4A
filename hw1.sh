#!/usr/bin/bash
fileName='git_address.txt'
fileContents=`cat $fileName`

lineBreak='=============='

#Iterate through fileContents
for line in $fileContents
do
#Save everything preceding the comma on line as your "toClone" variable
if [[ $line =~ ^(.*), ]]
then
    remoteRepository="${BASH_REMATCH[1]}"
fi
#Save all text after the comma on line as your "clonedRepositoryDestination" variable
if [[ $line =~ ,(.*) ]]
then
    localRepository="${BASH_REMATCH[1]}"
fi

#Save wd variable
workingDirectory=`pwd`

#Create an if-else statement that checks whether the folder path exists. If folder path exists, use git pull to update.
#If folder path does not exist, clone to current working directory
if [ -d $localRepository ]
then
    cd $localRepository
    git pull
    ls -le
    cd $workingDirectory
    echo $lineBreak
else
    git clone $remoteRepository $localRepository
    cd $localRepository
    ls -lenbnb
    cd $workingDirectory
    echo $lineBreak
fi
done