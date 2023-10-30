![Logo1](https://github.com/ScienceMau/Alexandria/assets/61286097/4f88a268-b4b4-4744-8783-ae13bc48040b)

Calculation of some dynamic quantities of a system of differential equations arising from a model that describes an oscillator with complex variables. This code is decripted in Julia lang.

## Mathematical modeling

O modelo matemático pode ser determinado seguindo a equação geral dada por:

$$ \dot{z}+g(z,\bar{z}) = Ae^{\omega t} $$

em que: $z$ é uma váriavel complexa e descrita como $z=x+yi$ e $g(z,\bar{z})$ é uma função que contém a variável complexa e seu conjugado $\bar{z}= x-yi$. Dessa forma, nós podemos determinar também $\dot{z}=\dot{x}+\dot{y}i$, sendo assim escrevemos a equação geral da seguinte forma:

$$ \dot{z}=\dot{x}+\dot{y}i +g(z,\bar{z}) = Ae^{\omega t} $$
