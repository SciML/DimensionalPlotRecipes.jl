# DimensionalPlotRecipes.jl

[![Build Status](https://github.com/SciML/DimensionalPlotRecipes.jl/workflows/CI/badge.svg)](https://github.com/SciML/DimensionalPlotRecipes.jl/actions?query=workflow%3ACI)
[![Coverage Status](https://coveralls.io/repos/JuliaDiffEq/DimensionalPlotRecipes.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaDiffEq/DimensionalPlotRecipes.jl?branch=master)
[![codecov.io](http://codecov.io/github/JuliaDiffEq/DimensionalPlotRecipes.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaDiffEq/DimensionalPlotRecipes.jl?branch=master)

DimensionalPlotRecipes.jl is a recipe library for higher dimensional plotting
with Plots.jl. Current recipes in the package include:

  - Improved complex number support

```julia
# Transformation Options:
# :split3D  - Splits the complex numbers to a (real,real-part,imag-part) plot
# :split2D  - Splits to form separate series for the real and imaginary parts
# :modulus  - Transforms the complex numbers to use their modulus
# :modulus2 - Transforms the complex numbers to use their squared modulus
plot(x::AbstractArray{<:Real},
    y::Array{Complex{<:Number}};
    transformation = :split3D)
```

## Future Support

  - Quaternions
  - Dimensional reduction (PCA,t-sne,etc.)
