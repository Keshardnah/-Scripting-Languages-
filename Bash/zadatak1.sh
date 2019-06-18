#! /bin/bash

proba="Ovo je proba"

echo $proba
echo

lista_datoteka=./* && echo $lista_datoteka
echo

proba3=$(i=3 && while [ $i -gt 0 ]; do printf "${proba}. "; ((i--)); done) && echo $proba3
echo

a=4 && b=3 && c=7 && d=$(((${a}+4)*${b}%${c})) && echo $d
echo

broj_rijeci=$(echo "Broj rijeci je 4" > ./1.txt && cat ./*.txt | wc -w) && rm ./1.txt && echo $broj_rijeci
echo

ls ~
echo

cut -d : -f 1,6,7 /etc/passwd
echo

ps -f | tr -s " " | cut -d " " -f 3,4,5,6,7


