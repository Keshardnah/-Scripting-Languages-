#!/usr/bin/python3

def ucitavanje_matrice(datoteka, rb):
    dat = open(datoteka, "r").read()
    dat = dat.split("\n\n")
    redovi = dat[rb].split("\n")
    dimenzije[rb] = redovi[0]
    matrica = {}
    for red in redovi[1:]:
        if red is not "":
            elementi = red.split(" ")
            matrica[int(elementi[0]), int(elementi[1])] = float(elementi[2])
    return matrica

dimenzije = ["0","0"]
matrica1 = ucitavanje_matrice("Matrice.txt", 0)
print("Matrica 1:\n", matrica1, "\n")
matrica2 = ucitavanje_matrice("Matrice.txt", 1)
print("Matrica 2:\n", matrica2, "\n")
dimenzija1 = dimenzije[0].split(" ")
dimenzija2 = dimenzije[1].split(" ")

if (int(dimenzija1[1]) != int(dimenzija2[0])):
    exit("Matrice nisu ulancane\n")

matrica3 = {}
dimenzija3 = [dimenzija1[0],dimenzija2[1]]
for red in range(1, int(dimenzija1[0])+1):
    for stupac in range(1, int(dimenzija2[1])+1):
        matrica3[(red, stupac)] = 0
        for k in range(1, int(dimenzija1[1])+1):
            matrica3[(red, stupac)] += float(matrica1.get((red, k), 0) * matrica2.get((k, stupac), 0))

nova_dat = open("umnozak.txt", "w")
nova_dat.write(dimenzija3[0]+" "+dimenzija3[1]+"\n")
for red in range(1, int(dimenzija3[0])+1):
    for stupac in range(1, int(dimenzija3[1])+1):
        if matrica3[(red, stupac)] == 0:
            del matrica3[(red, stupac)]
        else:
            nova_dat.write(str(red)+" "+str(stupac)+" "+str(matrica3[(red,stupac)])+"\n")
nova_dat.close()

nova_ispis = open("umnozak.txt", "r").read()
redovi = nova_ispis.split("\n")
matrica_ispis = {}
for red in redovi[1:]:
    if red is not "":
        elementi = red.split(" ")
        matrica_ispis[int(elementi[0]), int(elementi[1])] = float(elementi[2])
print("Umnozak:\n", matrica_ispis, "\n")