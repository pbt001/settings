function getSHA() {
    git log -1 --pretty=format:%H | pbcopy
    echo "Latest SHA1 has been copied to the clipboard"
}

function base64EncodeSvg() {
    # pass in path to svg file
    echo "background: url('data:image/svg+xml;base64,"$(openssl base64 < $1)"');"
    echo "background: url('data:image/svg+xml;base64,"$(openssl base64 < $1)"');" | pbcopy
}

# note
function n() {
    $EDITOR ~/notes/"$*".txt
}

# note search
function ns() {
    grep "$*" -r ~/notes
}

# note title search
function nts() {
    ls -c ~/notes | grep "$*"
}