T=`mktemp -d`
chmod a+r $T
chmod a+x $T
echo "Using temporary directory $T"

docker network create --driver bridge wjholden-net

docker stop www
docker container rm www
docker build --tag wjholden-www www/
docker run --detach --publish 80:80 --publish 443:443 --volume `pwd`/www/src:/var/www/html --name www --network wjholden-net wjholden-www

docker stop git
docker container rm git
docker build -t wjholden-git git/
docker run --detach --publish 8022:22 --name git --network wjholden-net wjholden-git
