using SciMLTesting, DimensionalPlotRecipes, JET, Test
using RecipesBase: apply_recipe

# The @recipe-generated method defines RecipesBase.apply_recipe but is owned by
# DimensionalPlotRecipes, so Aqua flags it as piracy; treat_as_own clears it.
run_qa(
    DimensionalPlotRecipes;
    explicit_imports = true,
    aqua_kwargs = (; piracies = (; treat_as_own = [apply_recipe])),
)
