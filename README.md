![Logo1](https://github.com/ScienceMau/Alexandria/assets/61286097/4f88a268-b4b4-4744-8783-ae13bc48040b)

Calculation of some dynamic quantities of a system of differential equations arising from a model that describes an oscillator with complex variables. This code is decripted in Julia lang.

## Mathematical modeling

Mathematical model can be determined following the general equation given by:

$$ \dot{z}+g(z,\bar{z}) = Ae^{i \omega t} $$

where: $z$ is a complex variable and described as $z=x+yi$ and $g(z,\bar{z})$ is a function that contains the complex variable and its conjugate $\bar{z} = x-yi$. This way, we can also determine $\dot{z}=\dot{x}+\dot{y}i$, so we write the general equation as follows:

$$ \dot{z}=\dot{x}+\dot{y}i +g(z,\bar{z}) = Ae^{i \omega t} $$

Therefore, rewriting the above equation, separating the Real and Imaginary parts, we will have:

$$ \dot{x} = Acos(\omega t)- \mathcal{Re}[g(z,\bar{z})] $$
 
$$ \dot{y} = Asin(\omega t)- \mathcal{Im}[g(z,\bar{z})] $$

In these scripts, we will use $g(z,\bar{z})=(z^2+\bar{z}^2)z+\bar{z}$, this way we will have the following differential equations:

$$ \dot{x} = 4xy^2-x+A cos(\omega t)$$

$$ \dot{y} = -4x^2y+y+Acos(\omega t )$$

The 1_Alexandria.jl file uses the following libraries:
DynamicalSystems.jl, SharedArrays.jl, MAT.jl, Statistics.jl, OrdinaryDiffEq.jl, ProgressMeter.jl, DelimitedFiles.jl, CairoMakie.jl

In this first version, the Basin of Attraction, Phase map and Poincaré map are calculated.

** Imagens geradas
* Basins of Attraction
  
![Basin](https://github.com/ScienceMau/Alexandria/assets/61286097/340834f1-09a1-4a30-9eff-b46aca0cbc88)

* Phase Maps
 
![Phase_map_1 0_](https://github.com/ScienceMau/Alexandria/assets/61286097/5bdfc605-b07a-43bc-86cb-642cca83130c)

* Poincare Map
  
![Poincare_map_1 0_](https://github.com/ScienceMau/Alexandria/assets/61286097/17b9fbfb-81e6-474b-87cf-769cb925a142)


** References

RIBEIRO, Mauricio A. et al. Nonlinear dynamics behaviour and its control under frequency-varying excitations for energy harvesting. International Journal of Nonlinear Dynamics and Control, v. 2, n. 3, p. 219-238, 2023.

RIBEIRO, Mauricio A., et al. "MEMS-Based Atomic Force Microscope: Nonlinear Dynamics Analysis and Its Control." (2022).



