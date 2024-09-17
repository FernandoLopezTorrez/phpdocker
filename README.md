# phpdocker# EjercicioDocker
git add .
git commit -m "Created hola mundo"
git push -u origin main

# borrar imagen
docker rmi isma:v1 

#
docker run -p 8080:8080 isma:v2

#
docker build -t isma:v2 .

#
docker ps -a

#
docker start nice_albattani
docker start -i nice_albattani
docker kill nice_albattani


#
docker tag isma:v2 sengokusama/prueba:latest

#
docker push sengokusama/prueba:latest

docker pull salvadorhm/ml4d:0.79
docker run -it -p 8080:8080 salvadorhm/ml4d:0.79