#!/bin/bash

# set projects folder
mkdir -p /config/projects

#base program
[[ ! -d "/config/www/.git" ]] && (rm -rf /config/www/* && git clone https://github.com/Codiad/Codiad /config/www && cp /defaults/config.php /config/www/config.php)
cd /config/www
git pull

#collaborative plugin
[[ ! -d "/config/www/plugins/Codiad-Collaborative-master/.git" ]] && (git clone https://github.com/Codiad/Codiad-Collaborative /config/www/plugins/Codiad-Collaborative-master/)
cd /config/www/plugins/Codiad-Collaborative-master/
git pull

#github plugin
[[ ! -d "/config/www/plugins/Codiad-CodeGit-master/.git" ]] && (git clone https://github.com/Andr3as/Codiad-CodeGit /config/www/plugins/Codiad-CodeGit-master/)
cd /config/www/plugins/Codiad-CodeGit-master/
git pull

#drag and drop plugin
[[ ! -d "/config/www/plugins/Codiad-DragDrop-master/.git" ]] && (git clone https://github.com/Andr3as/Codiad-DragDrop /config/www/plugins/Codiad-DragDrop-master/)
cd /config/www/plugins/Codiad-DragDrop-master/
git pull

#terminal plugin
[[ ! -d "/config/www/plugins/Codiad-Terminal-master/.git" ]] && (git clone https://github.com/Fluidbyte/Codiad-Terminal /config/www/plugins/Codiad-Terminal-master/)
cd /config/www/plugins/Codiad-Terminal-master/
git pull

#remove error on collaboration
sed -i s/' echo formatJSEND("error","Warning: File ".'/'#echo formatJSEND("error","Warning: File ".'/ /config/www/components/active/class.active.php


#fix ownership
chown -R abc:abc /config



