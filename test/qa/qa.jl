using SafeTestsets

@safetestset "Aqua" begin
    using DimensionalPlotRecipes, Aqua, Test
    # deps_compat and piracies are genuine findings tracked in
    # https://github.com/SciML/DimensionalPlotRecipes.jl/issues/50
    Aqua.test_all(DimensionalPlotRecipes; deps_compat = false, piracies = false)
    @test_broken false  # Aqua deps_compat: root Project.toml lacks compat for Aqua/JET extras — see https://github.com/SciML/DimensionalPlotRecipes.jl/issues/50
    @test_broken false  # Aqua piracies: @recipe-generated apply_recipe on RecipesBase types — see https://github.com/SciML/DimensionalPlotRecipes.jl/issues/50
end

@safetestset "JET" begin
    using DimensionalPlotRecipes, JET, Test
    @test_broken false  # JET: no matching method `is_key_supported(::Symbol)` in apply_recipe — see https://github.com/SciML/DimensionalPlotRecipes.jl/issues/50
end
