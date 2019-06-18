#!/usr/bin/python3

import re
import urllib.request
import sys

url = sys.argv[1]
stranica = urllib.request.urlopen(url)
mybytes = stranica.read()
mystr = mybytes.decode("utf8")
print(mystr)

print("Linkovi:")
linkovi = re.findall('href="[^"]+"', mystr)
for link in range(len(linkovi)):
    linkovi[link] = linkovi[link].replace("href=", "")
    linkovi[link] = linkovi[link][1:-1]
    print("-", linkovi[link])

hostovi = {}
for link in linkovi:
    if "http://" in link:
        host = link.replace("http://", "")
        host = host.replace("www.", "")
        host = host.split("/")
        h = host[0]
        if h in hostovi.keys():
            hostovi[h] += 1
        else:
            hostovi[h] = 1
print("\nHostovi:")
for ho in hostovi.keys():
    print(ho, "se ponavlja", hostovi[ho], "puta")

print("\nE-mail:")
email = re.findall("[\w]+@[\w]+\.[\w]+",mystr)
for e in email:
    print("-",e)

print("\nSlike:")
slike = re.findall('<img[\s]+src="[^"]+"[^>]+>', mystr)
for s in slike:
    print("-",s)
print("\nIma", len(slike), "slika")
