using DimensionalPlotRecipes, Plots, BenchmarkTools
using StableRNGs

const SUITE = BenchmarkGroup()
const rng = StableRNG(123)

x = collect(range(0.0, 10.0, length = 200))
y_complex = randn(rng, 200, 10) .+ im .* randn(rng, 200, 10)

# =============================================================================
# Recipe transformations through the Plots pipeline
# =============================================================================

SUITE["recipes"] = BenchmarkGroup()

SUITE["recipes"]["split3D"] = @benchmarkable plot(
    $x, $y_complex; transformation = :split3D
)
SUITE["recipes"]["split2D"] = @benchmarkable plot(
    $x, $y_complex; transformation = :split2D
)
SUITE["recipes"]["modulus"] = @benchmarkable plot(
    $x, $y_complex; transformation = :modulus
)
SUITE["recipes"]["modulus2"] = @benchmarkable plot(
    $x, $y_complex; transformation = :modulus2
)
