#!/usr/bin/env bash
RED='\033[0;31m'
Black='\033[0;30m'
Dark_Gray='\033[1;30m'
Light_Red='\033[1;31m'
Green='\033[0;32m'
Light_Green='\033[1;32m'
Brown_Orange='\033[0;33m'
Yellow='\033[1;33m'
Blue='\033[0;34m'
Light_Blue='\033[1;34m'
Purple='\033[0;35m'
Light_Purple='\033[1;35m'
Cyan='\033[0;36m'
Light_Cyan='\033[1;36m'
Light_Gray='\033[0;37m'
White='\033[1;37m'
NC='\033[0m' # No Color
DIR="/home/dump/"
USERNAME="root"
PASSWORD="112358"
valid=true

function PEDIR_INFORMACOES_USUARIO()
{
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome o nome do banco de dados:${NC}"
        read dataBaseName
        if [[ -z "$dataBaseName" ]]
        then
            echo -e "${Yellow}Database não informado, usar:${NC} ${Green}starwarsdb${NC}"
            dataBaseName=starwarsdb
            break
        else
            break
        fi
    done
    DUMP $dataBaseName ${DIR}
}

function DUMP() {
    docker exec -it mongo bash -c "mongodump -u ${USERNAME} -p ${PASSWORD} --authenticationDatabase admin --verbose --gzip --db ${dataBaseName} --out ${DIR}`date +"%y-%m-%d"`"
    echo -e "Criado backup em: ${Green}$2`date +"%y-%m-%d"`/$1${NC}"
}

[ $# -eq 0 ] && { echo -e "${Light_Purple}Você também pode usar:${NC} ${Yellow}$0 nome_banco_dados.${NC}"; }

echo "Realizando dump do banco de dados MongoDB..."
# echo "Verificando diretório ${DIR}..."
# if [ -d ${DIR} ]
# then
#     echo -e "${Yellow}Diretório já existe.${NC}"
# else
#     `mkdir ${DIR}`
#     echo -e "${Yellow}Diretório criado.${NC}"
# fi

if [ "$#" -eq 1 ]; then
    echo "Total de argumentos: $#"
    echo "1st Argument = $1"
    DUMP $1 ${DIR}
else
    PEDIR_INFORMACOES_USUARIO
fi

ls -l ./data/dump
ls -l ./data/dump/`date +"%y-%m-%d"`
echo -e "${Yellow}Dump finalizado!"
