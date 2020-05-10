#!/bin/bash
Password="Password"
docker run -d --name pihole -e WEBPASSWORD=${Password} -e DNS1=8.8.8.8 -p 80:80 -p 53:53/tcp -p 53:53/udp --restart=unless-stopped --dns=127.0.0.1 --dns=1.1.1.1 -e TZ="America/Chicago" -p 443:443 pihole/pihole:latest

printf 'Starting pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: localhost/admin/, Alternatively, you can also access the Web-Interface via: http://pi.hole/admin once you have set up the DNS on your machine to 127.0.0.1"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
