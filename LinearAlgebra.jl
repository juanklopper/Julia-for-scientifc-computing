# LINEAR ALGEBRA  STANDARD LIBRARY

# Introduction
# ------------

# Packages
# --------

using LinearAlgebra
using Random


# Arrays
# ------

# Julia has built-in support for
# many types of collection.  Arrays
# are used for rank-n tensors.
# A column vector is created using
# square bracket notation.
# Elements are separated by commas.
[1, 2, 3]

# A row vector is created by placing
# spaces between elements.
[1 2 3]
# Note the element type and the number 2
# to indicate a second dimension to the
# data (each element is seen as a
# column vector).

# A rank-2 tensor is created as row
# vector, separated by a semi-colon.
[1 2 3; 4 5 6]

# Column vector in a matrix are created
# as nested arrays, with a space between
# each column vector.
[[1, 2, 3] [4, 5, 6]]

# Julia has a hierarchical type structure.
# The typoeof() function returns the
# type of an object.
typeof([[1, 2, 3] [4, 5, 6]])

# The supertype function returns the
# parent of the given type.
supertype(Array)

supertype(DenseArray)

supertype(AbstractArray)

# All types are subtypes of the Any type.
# The subtypes() function return the
# children of the given type.
subtypes(AbstractArray)
# We note that there are 31 children of the
# AbstractArray type.

# The leaves of this hierarchical structure
# are the concrete types and only they
# can be instantiated.

# Useful constructors
# -------------------

# There are many useful functions to
# construct arrays.
ones(3, 3)

zeros(5)

trues(3)

falses(3)

# There are built-in iterators.  Since the
# code is compiled, loops are not always
# slower than vectorized code.  List
# comprehension is a great way to create
# an array
[i^2 for i = 1:5]

# Below, we construct a vector of
# (immutable) tuples.
[(i, j) for i = 1:2 for j = 1:3]

# An upper or lower triangular view of
# a matrix can be created.  First, we seed
# the pseudo-random number generator.
Random.seed!(12);
A = rand(1:10, 5, 5)

# An upper triangular view of
# A.  This is not factorization.
UpperTriangular(A)
# The result is a sparse matrix.

# A lower triangular view of A.
LowerTriangular(A)

# The values along the main
# diagonal can be converted to unity.
UnitUpperTriangular(A)

# The same can be done for a lower
# triangular view.
UnitLowerTriangular(A)

# Diagonal matrices can be created as
# proper diagonal as well as upper and
# lower bidiagonal matrices.  The
# Diagonal() function creates a diagonal
# matrix.
Diagonal([1, 2, 3])
# Note that the result is a sparse array.

# An upper bidiagonal matrix is created below.
# Note the use of the :U symbol.
Bidiagonal([1, 2, 3, 4], [7, 8, 9], :U)

# A lower bidiagonal matrix uses the :L
# symbol.
Bidiagonal([1, 2, 3, 4], [7, 8, 9], :L)

# A bidiagonal matrix can be created from
# an existing array.
Random.seed!(12);
A = rand((1:5), (4, 4))

# An upper bidiagonal version of A
Bidiagonal(A, :U)

# A lower bidiagonal version of A
Bidiagonal(A, :L)

# We can also create a symmetric tridiagonal
# matrix.
SymTridiagonal([1, 2, 3, 4], [1, 1, 1])

# Symmetric matrices can be constructed
# from existing matrices
Random.seed!(12)
A = rand(1:10, 5, 5)

# Construct from upper triangular
# elements (default).
Symmetric(A)

# Construct from lower triangular values.
Symmetric(A, :L)

# The transpose of a symmetric matrix
# is equal to itself.
Symmetric(A, :L) == Transpose(Symmetric(A, :L))

# Hermitian matrices can be
# construicted from the upper or
# lower triangualr values of a matrix.
A = [
    1 0 2 + 2im 0 3 - 3im
    0 4 0 5 0
    6 - 6im 0 7 0 8 + 8im
    0 9 0 1 0
    2 + 2im 0 3 - 3im 0 4
]

# By defualt the upper values are
# used.
Hermitian(A)

# We can specify the lower values.
Hermitian(A, :L)


# Vector multiplication
# ---------------------

# The dot() function performs a dot
# product of same-sized vectors
dot([1, 2, 3], [2, 2, 2])

# Short-hand notation is available
[1, 2, 3]⋅[2, 2, 2]

# The cross() function determines
# vector cross products
cross([1, 2, 3], [2, 2, 2])

# Short-hand notation is available as well.
[1, 2, 3] × [2, 2, 2]


# Matrix multiplication
# ---------------------

# Matrix multiplication is calculated
# using the * symbol.
A = [1 2 3; 4 5 6]

B = [1 2; 4 7; 2 3]

# Matrix multiplication is calculated
# using the * symbol.
A * B

# Matrix-vector multiplication is
# done in a similar way.
Random.seed!(12);

A = rand(1:10, 3, 3)

x = [1, 2, 3]

A * x

# Scalar-matrix like-wise uses th
# * symbol.
3 * A

# Elemntwise matrix-matrix multiplication
# uses the .* notation.

Random.seed!(12);

B = rand(1:10, 3, 3)

A .* B

# Addition and subtraction are
# element-wise.
A + B

# The UniformScaling() function
# creates an identity matrix or
# given scalar multiple of the
# identity matrix with a size
# as required.
UniformScaling(1) * A == A

UniformScaling(2) * A == 2 * A

A = [1 2 3 4; 2 3 4 5; 2 1 3 1]

UniformScaling(1) * A

A * UniformScaling(1)


# Factorization
# -----------

# Matrix factorization is commonly
# used for performance or memory
# optimization.
A = [1.5 2 -4; 2 -1 -3; -4 -3 5]

factorize(A)
