@echo off
if exist  .bootstrap.lock (
	color C
	echo Error: Installation has already been completed.
	echo Please delete the ".bootstrap.lock" file if you want to rerun bootstrap.bat
	echo Note that this action will delete the current data in the database!
	pause
	exit /b 1
)

if exist docker-compose.yml (
	docker compose kill
	docker compose rm -f
)

rd /s /q database\redis database\mysql

docker network prune -f

docker compose -f docker-preinstall.yml up preparevars
docker compose -f docker-preinstall.yml kill preparevars
docker compose -f docker-preinstall.yml rm -f preparevars

docker compose up -d mysql redis phpmyadmin

docker compose -f docker-preinstall.yml up preparedb
docker compose -f docker-preinstall.yml kill preparedb
docker compose -f docker-preinstall.yml rm -f preparedb

echo. > .bootstrap.lock

docker compose down
docker compose up -d

echo.
echo Installation done. Servers starting...

pause