module DimensionalPlotRecipes

using RecipesBase
using LinearAlgebra

# Splits a complex matrix to its real and complex parts
# Reals defaults solid, imaginary defaults dashed
# Label defaults are changed to match the real-imaginary reference / indexing
@recipe function f(x::AbstractArray{T},y::Array{Complex{T2}};
                   transformation=:split3D) where {T<:Real,T2<:Number}
  if transformation==:split2D
    A = real.(y)
    B = imag.(y)
    _y = [!iseven(i) ? A[:,i÷2+1] : B[:,i÷2] for i in 1:2size(A,2)]
    linestyle --> reshape([!iseven(i) ? :solid : :dash for i in 1:2size(A,2)],1,2size(A,2))
    label --> reshape([!iseven(i) ? "Re(y$(i÷2+1))" : "Im(y$(i÷2))" for i in 1:2size(A,2)],1,2size(A,2))
    seriescolor --> reshape([!iseven(i) ? i÷2+1 : i÷2 for i in 1:2size(A,2)],1,2size(A,2))
    retval = (x,_y)
  elseif transformation==:split3D
    A = real.(y)
    B = imag.(y)
    ylabel --> "Re(y)"
    zlabel --> "Im(y)"
    retval = (x,A,B)
  elseif transformation==:modulus
    _y = norm.(y)
    label --> reshape(["||y$(i)||" for i in 1:size(_y,2)],1,size(_y,2))
    retval = (x,_y)
  elseif transformation==:modulus2
    _y = abs2.(y)
    label --> reshape(["|y$(i)|^2" for i in 1:size(_y,2)],1,size(_y,2))
    retval = (x,_y)
  else
    error("Transformation unknown. Please use :split2D, :split3D, :modulus, or :modulus2")
  end
  (retval...,)
end

end # module
