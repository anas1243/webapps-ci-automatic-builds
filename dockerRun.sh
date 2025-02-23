version=latest
# Login to DockerHub
# docker login -u $docker_username -p $docker_password

# Build the webapp image for the Dockerfile
docker build . -t anas1243/simple-webapp-flask:$version

# If you want to force docker to rebuild the image without relying on the cached layers "less common but can be used to force using latest images!"
# docker build --no-cache . -t anas1243/simple-webapp-flask:$version

docker push anas1243/simple-webapp-flask:$version

# Run the webapp container
docker run -d -p 80:8000 --name flask-webapp anas1243/simple-webapp-flask:$version


