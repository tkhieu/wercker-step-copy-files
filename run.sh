#/bin/sh

copy_files()
{
    if [ -z "$WERCKER_COPY_FILES_FLAGS" ]; then
        WERCKER_COPY_FILES_FLAGS="-R"
    fi
    
    echo "Copying content from ${WERCKER_COPY_FILES_SOURCE%/}/ to ${WERCKER_COPY_FILES_DESTINATION%/}/"
    cp $WERCKER_COPY_FILES_FLAGS ${WERCKER_COPY_FILES_SOURCE%/}/* ${WERCKER_COPY_FILES_DESTINATION%/}/
}

# is true if the script should run
check_branches ()
{
    # check if the branches match and abort the script if needed
    if [ -n "$WERCKER_COPY_FILES_IGNORE_BRANCHES" ]; then
        arr=($WERCKER_COPY_FILES_IGNORE_BRANCHES)
        if contains_element "$WERCKER_GIT_BRANCH" "${arr[@]}"; then
            echo "not running on branch ${WERCKER_GIT_BRANCH}"
            return 1
        fi
    elif [ -n "$WERCKER_COPY_FILES_ONLY_ON_BRANCHES" ]; then
        arr=($WERCKER_COPY_FILES_ONLY_ON_BRANCHES)
        if ! contains_element "$WERCKER_GIT_BRANCH" "${arr[@]}"; then
            echo "not running on branch ${WERCKER_GIT_BRANCH}"
            return 1
        fi
    else
        return 0
    fi
}

if check_branches; then
    copy_files
fi