#!/bin/bash 
#====================================================
#
#          FILE: Start-Docker-Transmission.sh
# 
#         USAGE: ./Start-Docker-Transmission.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 10/04/2018 16:38
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------
#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	docker create --name=transmission \
	-v /config:/config \
	-v /torrents:/downloads \
	-v /torrents:/watch \
	-e PGID=1001 \
	-e PGUID=1001 \
	-e TZ=America/Chicago \
	-p 9091:9091 -p 52309:52309 \
	-p 52309:52309/udp \
	stiles/transmission
}	# end Main

Main

#===EXIT===
exit 0

