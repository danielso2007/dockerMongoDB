#!/bin/bash
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
USERNAME="root"
PASSWORD="112358"
valid=true

function PEDIR_INFORMACOES_BANCO()
{
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome o nome do banco de dados:${NC}"
        read -r dataBaseName
        if [[ -z "$dataBaseName" ]]
        then
            echo -e "${Yellow}Database não informado, usar:${NC} ${Green}starwarsdb${NC}"
            dataBaseName=starwarsdb
            break
        else
            break
        fi
    done
}

function PEDIR_INFORMACOES_COLLECTION()
{
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome collection:${NC}"
        read -r collection
        if [[ -z "$collection" ]]
        then
            echo -e "${Yellow}Collection não informado, usar:${NC} ${Green}planet${NC}"
            collection=planet
            break
        else
            break
        fi
    done
}

function PEDIR_INFORMACOES_ARQUIVO()
{
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome o nome do arquivo JSON:${NC}"
        read -r jsonName
        if [[ -z "$jsonName" ]]
        then
            echo -e "${Yellow}Nome do arquivo JSON não informado, usar:${NC} ${Green}planet.json${NC}"
            jsonName=planet.json
            break
        else
            break
        fi
    done
}

function IMPORT() {
    echo -e "${Green}Executando:${NC} ${Yellow}mongoimport -u ${USERNAME} -p ${PASSWORD} --authenticationDatabase admin --verbose --drop --collection $3 --db $1 --file /home/import/$2${NC}"
    docker exec -it mongo bash -c "mongoimport -u ${USERNAME} -p ${PASSWORD} --authenticationDatabase admin --verbose --drop --collection $3 --db $1 --file /home/import/$2"
    echo -e "${Green}Arquivo $2 importado com sucesso!"
}

[ $# -eq 0 ] && { echo -e "${Light_Purple}Você também pode usar:${NC} ${Yellow}$0 nome_banco_dados arquivo_json.${NC}"; }

echo "Importando arquivo para o MongoDB..."

if [ "$#" -eq 3 ]; then
    echo "Total de argumentos: $#"
    echo "1st database = $1"
    echo "2st json file = $2"
    echo "3st collection = $3"
    IMPORT $1 $2 $3
else
    if [ "$#" -eq 1 ]; then
        PEDIR_INFORMACOES_ARQUIVO
        IMPORT $1 $jsonName $collection
    else
        PEDIR_INFORMACOES_BANCO
        PEDIR_INFORMACOES_COLLECTION
        PEDIR_INFORMACOES_ARQUIVO
        IMPORT $dataBaseName $jsonName $collection
    fi
fi