using Documenter
using DimensionalPlotRecipes

makedocs(;
    modules = [DimensionalPlotRecipes],
    authors = "SciML Contributors",
    sitename = "DimensionalPlotRecipes.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://docs.sciml.ai/DimensionalPlotRecipes/stable/",
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo = "github.com/SciML/DimensionalPlotRecipes.jl.git",
)
