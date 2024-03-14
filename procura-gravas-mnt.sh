#!/bin/bash

#Desenvolvido por: Rodrigo Pinheiro
#Data inicial: 05/03/2024

#Contato:
#https://www.linkedin.com/in/rodrigo-pinheiro-214663206/
#https://github.com/devchimpa/
#
#
#
# COMO FUNCIONA:
# Para executar o script devem ser montados os volumes contendo as
# gravações com o nome: /mnt.
# Os uniqueids devem ser colocados dentro de: /home/lista_de_procuradas.
# Após isso, basta rodar o script.
#
# Este é um programa colaborativo, caso tenha melhorias a acrescentar, sinta-se
# a vontade para mexer, apenas siga o modelo abaixo informando o que foi feito.
#
#
############## Siga o modelo abaixo caso mexa no script: ###############
#
#
#Modificado por:
#Data:
#Contato:
#Modificação feita:
#
#
##########################################################################
#                       VARIAVEIS PRINCIPAIS:                            #
##########################################################################

# aqui deve ser inserido o diretório onde será feita a busca.
# caso sejam vários diretórios de mesmo nome, como mnt1 , mnt2, basta
# colocar apenas mnt, que o script irá varrer todos.
NOME_DIRETORIO=bkp_disk1

DIRETORIOS=$( df -h | grep $NOME_DIRETORIO | awk '{print $6}' )



##########################################################################
#                           CORPO DO SCRIPT:                             #
##########################################################################

procura_lista()
        {
         for i in $( cat /home/lista_de_procuradas )
         do
         LOCALIZADA=$( find $1 -iname $i )

         if [ -z "$LOCALIZADA" ]
         then
                 echo "$i Não localizada."
         else
                for GRAVA in ${LOCALIZADA[*]}
                do
         cp -rpv "$GRAVA" /home/gravacoes/localizadas
         echo "$GRAVA localizda" >> /home/gravacoes/localizadas/lista-encontradas
                done
                fi

        done
        }

for PONTO_DE_MONTAGEM in ${DIRETORIOS[*]}
do
        procura_lista "$PONTO_DE_MONTAGEM"
done

