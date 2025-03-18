@docker-build:
    docker build -t tahana .

@docker-run:
    docker run --name tahana -p 5173:5173 -v $(pwd):/app/build tahana
    @echo "tahana running on http://localhost:5173"

@docker-start:
    docker start tahana
    @echo "tahana started on http://localhost:5173"

@docker-stop:
    docker stop tahana
    @echo "tahana stopped"

@docker-remove:
    docker rm tahana
    @echo "tahana removed"

@docker-logs:
    docker logs tahana

@docker-exec:
    docker exec -it tahana bash


