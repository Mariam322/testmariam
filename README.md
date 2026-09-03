# testmariam

Service Harice (`testmariam`), genere automatiquement par le Maestro.

- Type : angular
- Port : 8006
- Image : systeodigital/testmariam

Le CI/CD est automatique : a chaque push, Jenkins build l'image,
la pousse, puis la deploie via `docker compose` sur le serveur.
Le `Jenkinsfile` et le `docker-compose.yml` sont deja prets.

## En local
```bash
docker build -t systeodigital/testmariam:dev .
docker run --rm -p 8006:8006 systeodigital/testmariam:dev
```
