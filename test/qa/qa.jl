using DimensionalPlotRecipes, Aqua, JET, Test

@testset "Aqua" begin
    Aqua.test_all(DimensionalPlotRecipes)
end

@testset "JET" begin
    JET.test_package(DimensionalPlotRecipes; target_defined_modules = true)
end
