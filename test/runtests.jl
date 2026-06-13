using SciMLTesting
using DimensionalPlotRecipes
using Test

run_tests(;
    core = joinpath(@__DIR__, "core.jl"),
    qa = (; body = joinpath(@__DIR__, "qa", "qa.jl"), env = joinpath(@__DIR__, "qa")),
)
