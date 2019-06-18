#! /bin/bash

cat > ./namirnice.txt <<EOF
banana
jabuka
jagoda
dinja
lubenica
hsaj
kruska
mango
Banana
JAGODA
LUBenica
EOF
grep -i -E "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt

echo 
grep -iv -E "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt > ./ne-voce.txt && cat ./ne-voce.txt

rm ./ne-voce.txt
rm ./namirnice.txt

echo
mkdir ~/projekti
mkdir ~/projekti/{prvi,drugi}
cat > ~/projekti/1.txt <<EOF
ABD234567
234567ABD
hdg345678
gfdbjh
74783347
EOF
cat > ~/projekti/prvi/2.txt <<EOF
ABD234567
234567ABD
hdg345678
gfdbjh
74783347
EOF
cat > ~/projekti/drugi/3.txt <<EOF
ABD234567
234567ABD
hdg345678
THF456789
gfdbjh
74783347
EOF
grep -r -E "[[:upper:]]{3}[[:digit:]]{6}" ~/projekti/
rm -r ~/projekti

echo
find ./ -mtime +7 -mtime -14 -ls

echo
for i in $(seq 15); do echo $i; done

