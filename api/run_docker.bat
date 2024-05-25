@echo off
docker run -d --name gestio_basquet_api -p 3001:80 -v %cd%/routes:/var/www/routes gestio_basquet_api
