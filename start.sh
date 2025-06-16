#!/bin/bash
sudo docker compose up -d

echo "Aguardando o pgAdmin iniciar..."
sleep 10

xdg-open http://localhost:8888

echo "pgAdmin está sendo aberto no seu navegador."