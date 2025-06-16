@echo off

docker compose up -d

echo Aguardando o pgAdmin iniciar...
timeout /t 10

echo Abrindo o pgAdmin no seu navegador...
start http://localhost:8888