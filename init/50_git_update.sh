#!/bin/bash

# set projects folder
mkdir -p /config/projects

#base program
[[ ! -d "/config/www/.git" ]] && (rm -rf /config/www/* && git clone https://github.com/Codiad/Codiad /config/www && cp /defaults/config.php /config/www/config.php)

#collaborative plugin
[[ ! -d "/config/www/plugins/Codiad-Collaborative-master/.git" ]] && git clone https://github.com/Codiad/Codiad-Collaborative /config/www/plugins/Codiad-Collaborative-master/

#github plugin
[[ ! -d "/config/www/plugins/Codiad-CodeGit-master/.git" ]] && git clone https://github.com/Andr3as/Codiad-CodeGit /config/www/plugins/Codiad-CodeGit-master/

#drag and drop plugin
[[ ! -d "/config/www/plugins/Codiad-DragDrop-master/.git" ]] && git clone https://github.com/Andr3as/Codiad-DragDrop /config/www/plugins/Codiad-DragDrop-master/

#terminal plugin
[[ ! -d "/config/www/plugins/Codiad-Terminal-master/.git" ]] && git clone https://github.com/Fluidbyte/Codiad-Terminal /config/www/plugins/Codiad-Terminal-master/

#remove error on collaboration
sed -i s/' echo formatJSEND("error","Warning: File ".'/'#echo formatJSEND("error","Warning: File ".'/ /config/www/components/active/class.active.php

#fix ownership
chown -R abc:abc /config

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

cd /config/www/plugins/Codiad-Collaborative-master/ || exit
git pull

cd /config/www || exit
git pull

cd /config/www/plugins/Codiad-CodeGit-master/ || exit
git pull

cd /config/www/plugins/Codiad-DragDrop-master/ || exit
git pull

cd /config/www/plugins/Codiad-Terminal-master/ || exit
git pull

#fix ownership
chown -R abc:abc /config




