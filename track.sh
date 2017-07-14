#!/usr/bin/env bash
branchName="upstream"
remoteName="upstream"
remoteUrl="https://github.com/amix/vimrc.git"
curBranch="master"

function isTrackBranchExisting()
{

    for branch in `git branch|awk '{print $2}'`
    do
        if [ X$branch = X$branchName ]
        then
            return 0
        fi
    done
    return 1
}

function isTrackRemoteExisting()
{
    for remote in `git remote -v|awk '{print $1}'`
    do
        if [ X$remote = X$remoteName ]
        then
            return 0
        fi
    done
    return 1
}

if ! isTrackRemoteExisting
then
    echo "track remote not exists, going to create"
    echo "git remote add $remoteName $remoteUrl"
    git remote add $remoteName $remoteUrl
    if [ $? -ne 0 ]
    then
        echo "failed to create remote branch"
        exit 1
    fi
fi

echo "fetch change from remote"
echo "git fetch $remoteName"
git fetch $remoteName
if [ $? -ne 0 ]
then
    echo "failed to fecth remote change locally"
    exit 2
fi

if ! isTrackBranchExisting
then
    echo "track branch not exists, going to create"
    echo "git branch --track $branchName $remoteName/master"
    git branch --track $branchName $remoteName/master
    if [ $? -ne 0 ]
    then
        echo "failed to create track branch"
        exit 3
    fi
fi

echo "merge track change to track branch"
git checkout $branchName
if [ $? -ne 0 ]
then
    echo "failed to checkout to track branch"
    exit 4
fi

git merge $remoteName/master
if [ $? -ne 0 ]
then
    echo "failed to merge track branch"
    exit 4
fi

exit 0
