using DimensionalPlotRecipes, Test

A = rand(5,2) .+ im.*rand(5,2)
t = range(0,stop=1,length=5)

using Plots
plot(t,A)

t = range(0,stop=1,length=5)
plot(t,A)
plot(t,A,transformation=:split3D)
plot(t,A,transformation=:modulus)
plot(t,A,transformation=:modulus2)
