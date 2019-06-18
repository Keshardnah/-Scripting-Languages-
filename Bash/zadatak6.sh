#! /bin/bash

odrediste=${!#}
if [ ! -d $odrediste ]; then
	mkdir $odrediste;
	echo "Stvorena mapa $odrediste";
fi
kopirano=0;
datoteke=$@;
echo;
echo "Parametri: $datoteke"
for (( i=$(($#-1)); i>0; i=i-1 )); do
	echo;
	echo "Trenutno gledana datoteka: $(echo $datoteke | cut -d " " -f $i)";
	if [ ! -e $(echo $datoteke | cut -d " " -f $i) ]; then
		echo "Datoteka ne postoji";
		continue;
	fi
	if [ ! -r $(echo $datoteke | cut -d " " -f $i) ]; then
		echo "Datoteka nije citljiva";
		continue;
	fi
	cp $(echo $datoteke | cut -d " " -f $i) $odrediste;
	((kopirano++));
	echo "Kopirano $kopirano datoteka";
done  
echo;
echo "$kopirano datoteka je kopirano u mapu $odrediste";
