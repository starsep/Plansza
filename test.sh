#!/bin/bash

esc="\033["
blue="${esc}40;34;1m"
pink="${esc}40;35;1m"
green="${esc}40;32;1m"
white="${esc}40;37;1m"
yellow="${esc}40;33;1m"
red="${esc}40;31;1m"
end="${esc}0m"

c="C (kompilowany "`gcc --version | head -n 1`")"
cpp="C++ (kompilowany "`g++ --version | head -n 1`")"
java="Java (kompilowany "`javac -version 2> tmp; cat tmp`")"
ocaml="Ocaml (kompilowany ocamlopt "`ocamlopt -version`")"
ccolors="${green}${c}${end}"
cppcolors="${blue}${cpp}${end}"
javacolors="${red}${java}${end}"
ocamlcolors="${yellow}${ocaml}${end}"
mini="\n${white}Mini:${end}"
mega="\n${white}Mega:${end}"

echo -e "${pink}Programy A:${end}"
#A MINI
echo -e ${mini}

echo -e ${ccolors}
gcc -o planszaA -O2 -w planszaA.c
time ./planszaA < planszaMini.in > plansza.out

echo -e ${cppcolors}
g++ -o planszaA -O2 -w planszaA.cpp
time ./planszaA < planszaMini.in > plansza.out

echo -e ${javacolors}
javac PlanszaA.java
time java -Xmx1400m PlanszaA < planszaMini.in > plansza.out

echo -e ${ocamlcolors}
ocamlopt -o planszaA planszaA.ml
time ./planszaA < planszaMini.in > plansza.out

#A MEGA
echo -e ${mega}

echo -e ${ccolors}
time ./planszaA < planszaMega.in > plansza.out

echo -e ${cppcolors}
time ./planszaA < planszaMega.in > plansza.out

echo -e ${javacolors}
time java -Xmx1400m PlanszaA < planszaMega.in > plansza.out

echo -e ${ocamlcolors}
time ./planszaA < planszaMega.in > plansza.out

echo -e "${pink}Programy B:${end}"
#B MINI
echo -e ${mini}

echo -e ${ccolors}
gcc -o planszaB -O2 -w planszaB.c
time ./planszaB < planszaMini.in > plansza.out

echo -e ${cppcolors}
g++ -o planszaB -O2 -w planszaB.cpp
time ./planszaB < planszaMini.in > plansza.out

echo -e ${javacolors}
javac PlanszaB.java
time java -Xmx1400m PlanszaB < planszaMini.in > plansza.out

echo -e ${ocamlcolors}
ocamlopt -o planszaB planszaB.ml
time ./planszaB < planszaMini.in > plansza.out

#B MEGA
echo -e ${mega}

echo -e ${ccolors}
time ./planszaB < planszaMega.in > plansza.out

echo -e ${cppcolors}
time ./planszaB < planszaMega.in > plansza.out

echo -e ${javacolors}
time java -Xmx1400m PlanszaB < planszaMega.in > plansza.out

echo -e ${ocamlcolors}
time ./planszaB < planszaMega.in > plansza.out

rm plansza.out PlanszaA.class PlanszaB.class planszaA planszaB planszaA.cm* planszaA.o planszaB.cm* planszaB.o tmp
