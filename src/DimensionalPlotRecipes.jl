module DimensionalPlotRecipes

using RecipesBase
using LinearAlgebra

# Define a quaternion type
struct Quaternion{T}
    a::T  # Real part
    b::T  # Imaginary part i
    c::T  # Imaginary part j
    d::T  # Imaginary part k
end

# Define functions to extract real and imaginary parts
realpart(q::Quaternion) = q.a
imagpart(q::Quaternion) = [q.b, q.c, q.d]

# Define functions to create quaternions from real and imaginary parts
function quaternion(a, b, c, d)
    return Quaternion(a, b, c, d)
end

function quaternion(a, v)
    return Quaternion(a, v[1], v[2], v[3])
end

# Splits a quaternion matrix to its real and imaginary parts
@recipe function f(x::AbstractArray{T}, y::Array{Quaternion{T2}}) where {T<:Real, T2<:Number}
    A = realpart.(y)
    B = hcat(imagpart.(y)...)

    # You can customize the linestyle, label, and seriescolor as needed
    _y = [A[:,i] B[:,i] for i in 1:size(A,2)]
    linestyle --> reshape([:solid :dash], 1, 2)
    label --> reshape(["Re(y$(i))" "Im(y$(i))" "Im2(y$(i))" "Im3(y$(i))" for i in 1:size(A,2)], 1, 2)
    seriescolor --> reshape(1:2, 1, 2)

    retval = (x, _y...)
    (retval...,)
end

# Splits a complex matrix to its real and complex parts
@recipe function f(x::AbstractArray{T}, y::Array{Complex{T2}}; transformation=:split3D) where {T<:Real,T2<:Number}
    if transformation==:split2D
        A = real.(y)
        B = imag.(y)
        _y = [!iseven(i) ? A[:,i÷2+1] : B[:,i÷2] for i in 1:2size(A,2)]
        linestyle --> reshape([!iseven(i) ? :solid : :dash for i in 1:2size(A,2)], 1, 2size(A,2))
        label --> reshape([!iseven(i) ? "Re(y$(i÷2+1))" : "Im(y$(i÷2))" for i in 1:2size(A,2)], 1, 2size(A,2))
        seriescolor --> reshape([!iseven(i) ? i÷2+1 : i÷2 for i in 1:2size(A,2)], 1, 2size(A,2))
        retval = (x, _y)
    elseif transformation==:split3D
        A = real.(y)
        B = imag.(y)
        ylabel --> "Re(y)"
        zlabel --> "Im(y)"
        retval = (x, A, B)
    elseif transformation==:modulus
        _y = norm.(y)
        label --> reshape(["||y$(i)||" for i in 1:size(_y,2)], 1, size(_y,2))
        retval = (x, _y)
    elseif transformation==:modulus2
        _y = abs2.(y)
        label --> reshape(["|y$(i)|^2" for i in 1:size(_y,2)], 1, size(_y,2))
        retval = (x, _y)
    else
        error("Transformation unknown. Please use :split2D, :split3D, :modulus, or :modulus2")
    end
    (retval...,)
end

end # module
