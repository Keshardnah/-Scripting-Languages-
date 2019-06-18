#!/usr/bin/python3

dat = open("ulaz.txt", "r").read()
redovi = dat.split("\n")

print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")

rb_red = 0
for red in redovi:
    if red is not "":
        rb_red += 1
        elementi = red.rstrip().split(" ")
        elementi_float = []
        for x in elementi:
            if x is not "":
                elementi_float.append(float(x))
        elementi_float.sort()
        br_elem = len(elementi_float)
        lista_za_print = []
        for i in range(1, 10):
            lista_za_print.append(elementi_float[int((i/10)*br_elem)])
        print(("%03d" % rb_red)+"#"+str(lista_za_print[0])+"#"+str(lista_za_print[1])+"#"
            +str(lista_za_print[2])+"#"+str(lista_za_print[3])+"#"+str(lista_za_print[4])+"#"
                +str(lista_za_print[5])+"#"+str(lista_za_print[6])+"#"+str(lista_za_print[7])+"#"
                    +str(lista_za_print[8]))
