@echo off

if exist .bootstrap.lock (
	color C
	echo Error: Installation has already been completed.
	echo Please delete the ".bootstrap.lock" file if you want to rerun bootstrap.bat
	echo Note that this action will delete the current data in the database!
	pause
	exit /b 1
)

docker compose down

rd /s /q database\redis database\mysql

docker system prune -f

docker compose -f docker-preinstall.yml up initvar
docker compose -f docker-preinstall.yml down

docker compose up --build -d mysql redis phpmyadmin

docker compose -f docker-preinstall.yml up initdb
docker compose -f docker-preinstall.yml down

echo. > .bootstrap.lock

docker compose down
docker compose up -d
echo.
echo Installation done. Servers starting...

pause