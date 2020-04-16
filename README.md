# Step to install pihole
Source : https://www.reddit.com/r/pihole/comments/9k6lzp/run_pihole_on_macos_mojave_with_docker/

    1. Install Docker on your Mac
    2. Open Terminal
    3. run: 
        docker pull pihole/pihole
    4. Find your local IP with:
        ipconfig getifaddr en0
    5. Changed ServerIPAddress & Password, Run this script to Run Docker.
    6 Change the Local DNS to your docker : networksetup -setdnsservers Wi-Fi 127.0.0.1
    7. Check that everything is okay docker ps -a
        Good Output:
        $ docker ps -a
        CONTAINER ID        IMAGE                  COMMAND             CREATED             STATUS                    PORTS                                                                                      NAMES
        90bb3ac107ed        pihole/pihole:latest   "/s6-init"          11 minutes ago      Up 11 minutes (healthy)   0.0.0.0:53->53/tcp, 0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:53->53/udp, 67/udp   pihole
    8. Dashboard: http://pi.hole/admin (This URL will work only after setting the DNS on your machine, if this not working - use http://127.0.0.1/admin
    9. Once installation is complete, you can add additional block list using: https://firebog.net/


# Steps to remove pihole docker container:
Source : https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/

    1. List all docker containers: 
        docker container ls -a
    
        The output should look something like this:

            CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                      PORTS               NAMES
            cc3f2ff51cab        centos                  "/bin/bash"              2 months ago        Created                                         competent_nightingale
            cd20b396a061        solita/ubuntu-systemd   "/bin/bash -c 'exec …"   2 months ago        Exited (137) 2 months ago                       systemd
            fb62432cf3c1        ubuntu                  "/bin/bash"              3 months ago        Exited (130) 3 months ago                       jolly_mirzakhani
   

    2. Once you know the CONTAINER ID of the containers you want to delete, pass it to the docker container rm command. For example, to remove the first two containers listed in the output above run:
        docker container rm cc3f2ff51cab cd20b396a061
