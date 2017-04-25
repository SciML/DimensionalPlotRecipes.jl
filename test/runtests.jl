using DimensionalPlotRecipes
using Base.Test

A = rand(5,2) + im*rand(5,2)
t = linspace(0,1,5)

using Plots
plot(t,A)

t = linspace(0,1,5)
plot(t,A)
plot(t,A,transformation=:split3D)
plot(t,A,transformation=:modulus)
