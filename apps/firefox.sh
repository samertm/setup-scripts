#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

firefox_dir="$HOME/.mozilla/firefox/"
if [[ ! -e $firefox_dir ]] ; then
    echo "$firefox_dir does not exist, please install firefox"
    exit 1
fi

cd $firefox_dir

num_profiles=$(find . -maxdepth 1 -name '*.default' | wc -l)
if [[ $num_profiles == 0 ]] ; then
    echo "no default profiles exist for Firefox."
    exit 1
elif [[ $num_profiles > 1 ]] ; then
    echo "too many default profiles exist for Firefox."
    exit 1
fi

default_dir=$(find . -maxdepth 1 -name '*.default')
user_js="${default_dir}/user.js"

echo "Installing $user_js"

cat > $user_js <<EOF
user_pref("layout.css.devPixelsPerPx", "1.2"); // Bump up pixels for hi-res displays.
user_pref("ui.key.menuAccessKey", 0); // Don't show menu bar on 'alt'.
EOF



cat <<EOF
Install these addons:
https://addons.mozilla.org/en-us/firefox/addon/adwaita/
https://addons.mozilla.org/en-US/firefox/addon/htitle/
https://addons.mozilla.org/en-US/firefox/addon/disable-ctrl-q-shortcut/
EOF
