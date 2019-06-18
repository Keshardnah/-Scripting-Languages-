#! /bin/bash

if [ $# == 2 ]; then
	echo "Kazalo $1";
	echo "Uzorak imena datoteka $2";
	echo;
	datoteke=$(find $1 -type f -name $2);
	ukupno=0;
	for dat in $datoteke; do
		redovi=$(wc -l $dat | cut -d " " -f 1);
		echo "$redovi : $dat";
		echo;
		ukupno=$((ukupno+redovi));
	done
	echo "Ukupno $ukupno redova";
fi
