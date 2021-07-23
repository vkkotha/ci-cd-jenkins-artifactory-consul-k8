cdir=`pwd`
echo $cdir
# docker run -d --name docker-proxy -v /var/run/docker.sock:/var/run/docker.sock -p 2376:1234 bobrik/socat TCP-LISTEN:1234,fork UNIX-CONNECT:/var/run/docker.sock
docker run -d --name jenkins --memory="2g" -p 7000:8080 -p 50001:50001 -v $cdir/jenkins_home:/var/jenkins_home --env DOCKER_HOST=tcp://host.docker.internal:2376 --env JAVA_OPTS="-Xmx1024m" jenkins

# WKMZTD95B2AF.global.publicisgroupe.net
# 192.168.1.209
