#!/usr/bin/python3

import os
import re

dat = open("studenti.txt", "r").read()
redovi = dat.split("\n")

student = {}
for red in redovi:
    if red is not "":
        student_lista = red.strip().split(" ")
        student[student_lista[0]] = [student_lista[1],student_lista[2]]

lista_datoteka = os.listdir(".")
labosi = []
labosi_rjecnik = {}
for datoteka in lista_datoteka:
    if re.match("(Lab_[0-9]+_g[0-9]+.txt)", datoteka):
        broj_lab = int(datoteka.split("_")[1])
        labos = open(datoteka, "r").read()
        redovi_labos = labos.split("\n")
        if broj_lab not in labosi:
            labosi.append(broj_lab)
        for red in redovi_labos:
            if red is not "":
                jmbag,bodovi = red.strip().split(" ")
                #jmbag_broj_lab = labos_lista[0] + "_" + str(broj_lab)
                if (labosi_rjecnik.get((jmbag,bodovi),0) == 0):
                    labosi_rjecnik[jmbag,broj_lab] = bodovi
                else:
                    print("Upozorenje, student", labos_lista[0], "se nalazi vise puta na istom labosu")

print("JMBAG            Prezime, Ime", end = "")
sortirani_lab = sorted(labosi)
for lab in sortirani_lab:
    print("      L", str(lab), end="")
print("")

for i in student:
    print(i, "      ", end = "")
    print(student[i][0], student[i][1], end = "      ")
    for j in sortirani_lab:
        print(str(float(labosi_rjecnik.get((i,int(j)), 0))) + "      ", end = "")
    print("")
