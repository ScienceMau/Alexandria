![Logo1](https://github.com/ScienceMau/Alexandria/assets/61286097/4f88a268-b4b4-4744-8783-ae13bc48040b)

Calculation of some dynamic quantities of a system of differential equations arising from a model that describes an oscillator with complex variables. This code is decripted in Julia lang.

## Mathematical modeling

O modelo matemático pode ser determinado seguindo a equação geral dada por:

$$ \dot{z}+g(z,\bar{z}) = Ae^{\omega t} $$

em que: $z$ é uma váriavel complexa e descrita como $z=x+yi$ e $g(z,\bar{z})$ é uma função que contém a variável complexa e seu conjugado $\bar{z}= x-yi$. Dessa forma, nós podemos determinar também $\dot{z}=\dot{x}+\dot{y}i$, sendo assim escrevemos a equação geral da seguinte forma:

$$ \dot{z}=\dot{x}+\dot{y}i +g(z,\bar{z}) = Ae^{\omega t} $$

 Portanto, reescrevendo a equação acima, separando a parte Real e a Imaginária, teremos:

 $$ \dot{x} = Acos(\omega t)- \mathcal{Re}[g(z,\bar{z})] $$
 
 $$ \dot{y} = Asin(\omega t)- \mathcal{Im}[g(z,\bar{z})] $$

Nesses scripts, nós utilizaremos $g(z,\bar{z})=(z^2+\bar{z}^2)z+\bar{z}$, dessa forma teremos as seguintes equações diferenciais:

$$ \dot{x} = 4xy^2-x+A cos(\omega t)$$

$$ \dot{y} = -4x^2y+y+Acos(\omega t )$$

O arquivo 1_script.jl utiliza as seguintes bibliotecas: 
DynamicalSystems.jl, SharedArrays.jl, MAT.jl, Statistics.jl, OrdinaryDiffEq.jl, ProgressMeter.jl, DelimitedFiles.jl, CairoMakie.jl

Nessa primeira versão é cálculado a Bacia de Atração, Mapa de fase e mapa de Poincaré.

** Imagens geradas
* Basins of Attraction
* 
![Basin](https://github.com/ScienceMau/Alexandria/assets/61286097/340834f1-09a1-4a30-9eff-b46aca0cbc88)

* Phase Maps
* 
![Phase_map_1 0_](https://github.com/ScienceMau/Alexandria/assets/61286097/5bdfc605-b07a-43bc-86cb-642cca83130c)

* Poincare Map
* 
![Poincare_map_1 0_](https://github.com/ScienceMau/Alexandria/assets/61286097/17b9fbfb-81e6-474b-87cf-769cb925a142)


** References

RIBEIRO, Mauricio A. et al. Nonlinear dynamics behaviour and its control under frequency-varying excitations for energy harvesting. International Journal of Nonlinear Dynamics and Control, v. 2, n. 3, p. 219-238, 2023.

RIBEIRO, Mauricio A., et al. "MEMS-Based Atomic Force Microscope: Nonlinear Dynamics Analysis and Its Control." (2022).



