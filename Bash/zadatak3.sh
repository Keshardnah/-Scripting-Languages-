#! /bin/bash

datoteke=$(ls | grep -E *localhost_access_log.[[:digit:]]{4}-02-[[:digit:]]{2}.txt)
for dat_velj in $datoteke; do
	dan=$(echo $dat_velj | cut -d "." -f 2 | cut -d "-" -f 3);
	mjesec=$(echo $dat_velj | cut -d "." -f 2 | cut -d "-" -f 2);
	godina=$(echo $dat_velj | cut -d "." -f 2 | cut -d "-" -f 1);
	echo "datum: ${dan}-${mjesec}-${godina}";
	echo "-------------------------------------------";
	cat $dat_velj | cut -d '"' -f 2 | sort | uniq -c | sort -k 1 -nr | tr -s " " | sed 's/ / : /2';
	echo;
done
