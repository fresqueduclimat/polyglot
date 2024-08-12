# SETUP
```_bash
docker compose run web yarn install
```

Visit: http://0.0.0.0:3000/


## RUN TESTS
```bash
docker-compose run test rails db:create db:migrate
docker-compose run test bash
rspec
```
