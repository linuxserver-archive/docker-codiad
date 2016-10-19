[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/codiad
[![](https://images.microbadger.com/badges/version/linuxserver/codiad.svg)](https://microbadger.com/images/linuxserver/codiad "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/codiad.svg)](http://microbadger.com/images/linuxserver/codiad "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/codiad.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/codiad.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-codiad)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-codiad/)
[hub]: https://hub.docker.com/r/linuxserver/codiad/

[Codiad][codiadurl] is a web-based IDE framework with a small footprint and minimal requirements. We have added a few plugins. More can be added in the marketplace in the WebUI

* Collaboration - https://github.com/Codiad/Codiad-Collaborative
* Terminal - https://github.com/Fluidbyte/Codiad-Terminal
* CodeGit - https://github.com/Andr3as/Codiad-CodeGit
* Drag and Drop - https://github.com/Andr3as/Codiad-DragDrop


[![codiad](http://kentnagao.noip.me/joomla/images/codiad.png)][codiadurl]
[codiadurl]: http://codiad.com/

## Usage

```
docker create \
--name=codiad \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid>  \
-p 80:80 \
linuxserver/codiad
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 80` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` -
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it codiad /bin/bash`.


### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application 
* use /config/projects to save your projects, for data persistence
* change /config/www/plugins/Codiad-CodeGit-master/shell.sh to add Git User/Pass
* change /config/www/plugins/Codiad-Terminal-master/emulator/term.php to change terminal password

## Info

* To monitor the logs of the container in realtime `docker logs -f codiad`.

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' codiad`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/codiad`



## Versions

+ **14.10.16:** Add version layer information.
+  **10.09.16:** Add layer badges to README
+  **06.11.15:** Initial Release
