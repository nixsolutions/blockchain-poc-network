docker system prune -af
docker rm -f $(docker ps -a -q)
docker system prune -af
docker rm -f $(docker ps -a -q)
docker system prune -af
docker rm -f $(docker ps -a -q)
docker volume prune -f
docker ps
