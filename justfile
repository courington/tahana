@docker-build:
    docker build -t svelte-app .

@docker-run:
    docker run --name folio -p 5173:5173 -v $(pwd):/app folio
    @echo "Folio running on http://localhost:5173"

@docker-start:
    docker start folio
    @echo "Folio started on http://localhost:5173"

@docker-stop:
    docker stop folio
    @echo "Folio stopped"

@docker-remove:
    docker rm folio
    @echo "Folio removed"
@docker-logs:
    docker logs folio

@docker-exec:
    docker exec -it folio bash


