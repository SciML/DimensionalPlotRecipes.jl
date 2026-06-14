using DimensionalPlotRecipes, SafeTestsets, Test

const GROUP = get(ENV, "GROUP", "All")

if GROUP == "All" || GROUP == "Core"
    # Test explicit imports hygiene
    @safetestset "Explicit Imports" include("explicit_imports.jl")

    @safetestset "Recipes" include("recipes.jl")
end

if GROUP == "QA"
    include(joinpath("qa", "qa.jl"))
end
