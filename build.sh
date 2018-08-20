docker network create --driver bridge wjholden-net

docker stop www
docker container rm www
docker build --tag wjholden-www www/
docker run --detach 443:443 --name www --network wjholden-net wjholden-www

docker stop git
docker container rm git
docker build -t wjholden-git git/
docker run --detach --publish 8022:22 --name git --network wjholden-net wjholden-git
