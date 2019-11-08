# Docker MongoDB

Arquivo docker-compose para iniciar um container Docker com MongoDB. Também são apresentados arquivos shell script para auxiliar no dump, restore, importação e exportação de dados dentro do container. Mais abaixo, explicações de como usar essas arquivos.

Dentro deste docker-compose, há um container chamado Mongo-Express, interface administrativa do MongoDB baseada na Web, escrita com Node.js e express.

## Getting Started

Essas instruções fornecerão uma cópia do projeto em execução na sua máquina local para fins de desenvolvimento e teste.

### Prerequisites

É obrigatório ter o docker e docker-compose instalados.

### Installing

Siga os passos abaixo para a instalação do docker e docker-compose.

```
sudo apt-get install -y docker.io
```
```
newgrp docker & sudo addgroup --system docker & sudo adduser $USER docker
```
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
```
docker-compose --version
```

## Running

Dentro da pasta onde está o arquivo docker-compose, execute o comando abaixo:
```
docker-compose up -d
```

### Stopping the docker

Para encerrar o docker, execute o comando abaixo:
```
docker-compose stop
```

### Accessing Mongo-Express

Para acessar a interface administrativa do mondo express, acesse a URL abaixo:

[http://swarm-ip:8081](http://swarm-ip:8081)

[http://localhost:8081](http://localhost:8081)

[http://host-ip:8081](http://host-ip:8081)

## Deployment

Nada será necessário, pois as imagens já estão prontas e estão definidas dentro do docker-compose.

## Restoring the database

Para restaurar o banco, com o container rodando, copie a pasta `./dump/19-11-07` para a pasta `./data/dump`. Esta pasta está no volume definido no docker-compose. Depois execute:
``` 
./restore.sh
```
Você pode executar também:
```
./restore.sh starwarsdb 19-11-07
```

## Database dump

Para criar o dump do banco de dados, com o container rodando, execute:
```
./dump
```
O dump será criado dentro do volume na pasta `./data/dump` com a data corrente no padrão `yy-MM-dd`.

## Exporting data from a collection

Para a exportação de dados de uma coleção, execute:

```
./mongoexport.sh
```

## Importing data from a collection

Para a importação de dados de uma coleção, execute:

```
./mongoimport.sh
```

## Volume Folder Permissions

Para modifcar as permissões das pasta do volume, execite `./permissao_data.sh`. Assim, as pastas do volume estação no mesmo grupo do usuário linux.

## Built With

* [Mongo - Docker Official Images](https://hub.docker.com/_/mongo)
* [Mongo-Express - Docker Official Images](https://hub.docker.com/_/mongo-express)
* [Docker](https://www.docker.com/)
* [Overview of Docker Compose](https://docs.docker.com/compose/)


## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

Usamos [SemVer](http://semver.org/) para versionar. Para as versões disponíveis, consulte as [tags neste repositório](https://github.com/danielso2007/dockerMongoDB/releases). 

## Authors

* **Daniel Oliveira** - *Initial work* - [danielso2007](https://github.com/danielso2007)

See also the list of [contributors](https://github.com/danielso2007/dockerMongoDB/graphs/contributors) who participated in this project.

## License

Este projeto está licenciado sob a licença MIT - consulte o arquivo [LICENSE.md](LICENSE.md) para obter detalhes
