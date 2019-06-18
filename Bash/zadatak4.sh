#! /bin/bash

if [ $# == 2 ]; then
	ls -R $1;
	echo;	
	mkdir $2;
	ls -R $2;
	echo;
	slike=$(ls $1);
	for slika in $slike; do
		godina=$(stat -c %y "$1/$slika" | cut -d - -f 1);
		mjesec=$(stat -c %y "$1/$slika" | cut -d - -f 2);
		dat_ime=$godina-$mjesec;
		dir="$2/$dat_ime";
		if [ ! -d $dir ]; then
			mkdir $dir;
		fi
		mv "$1/$slika" $dir;
	done
	ls -R $1;
	echo;
	ls -R $2;
fi
