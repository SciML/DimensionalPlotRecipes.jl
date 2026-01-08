using ExplicitImports
using DimensionalPlotRecipes
using Test

@testset "ExplicitImports" begin
    @test check_no_implicit_imports(DimensionalPlotRecipes) === nothing
    @test check_no_stale_explicit_imports(DimensionalPlotRecipes) === nothing
end
