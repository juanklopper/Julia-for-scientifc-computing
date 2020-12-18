### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 09391c82-36f6-11eb-2a2a-3fd51aac6161
using Pkg

# ╔═╡ 10ddf4b4-36f6-11eb-1915-ada7cb3e3ff1
using LinearAlgebra

# ╔═╡ 14870e82-36f6-11eb-01b7-0be16908189c
using Plots

# ╔═╡ 810693a8-3709-11eb-0017-1fc0037624ba
using Random

# ╔═╡ b717b4d8-370c-11eb-393b-87966a8b8610
using PlutoUI

# ╔═╡ dabc9ee2-36f5-11eb-3b82-d963d863a9b3
md">Dr Juan H Klopper"

# ╔═╡ ebdbb906-36f5-11eb-3033-376759f5b677
md"# VECTORS IN EUCLIDEAN SPACE"

# ╔═╡ f9286e60-36f5-11eb-1ca6-0f843b90e1c8
md"## Setup"

# ╔═╡ 06a06ae8-36f6-11eb-1142-cdbadb8586a5
file = "/Users/juan/Documents/Mathematics/LinearAlgebraWithJulia/Project.toml"

# ╔═╡ 0ba06c64-36f6-11eb-2c44-1b6f26f93e27
Pkg.activate(file)

# ╔═╡ 18189976-36f6-11eb-0963-fd18b2364876
plotly()

# ╔═╡ 2237d020-36f6-11eb-3c17-0797a2cb6f60
md"## Introduction"

# ╔═╡ 6cf8532e-3a1f-11eb-0f52-51e45fc38fdd
md"Vectors are very important mathematical and physical objects, finding uses in data structures, engineering, and many other fields. They are also fundamental to the study of linear algebra."

# ╔═╡ 73353d74-3a1f-11eb-3ef6-9312cc9dac4e
md"Throughout this notebook, we are concerned with Euclidean space, the fundamental space in classical geometry. We are very familiar with this space, starting with the one-dimensional real number line, moving to the two-dimensional Cartesian plane, and then three-dimensional Cartesian space. Formally, we define Euclidean space as a finite-dimensional inner product space over the real numbers. More about this in later notebooks, though."

# ╔═╡ 8653344c-3a1f-11eb-1336-fd31ab52608b
md" We begin our journey in this notebook by looking at points."

# ╔═╡ 2dfc4816-36f6-11eb-1bc4-dbcbf3c8e202
md"## Points"

# ╔═╡ 45f8bdda-36f6-11eb-2f0a-3d024180181c
md"We are all familiar with the real number line. All elements of the set $\mathbb{ R }$ can be _plotted_ on this line."

# ╔═╡ 62f43eac-36f6-11eb-050e-231fb14749ee
md"The Cartesian plane allows us to represent $2$-tuples of real values in rectangular coordinates. The Cartesian plane, after Rene Descartes, are two real lines usually named the $x$ axis and the $y$ axis. These real number lines are orthogonal (perpendicular) and _intersect_ at $x = 0$ and $y = 0$. The plane is denoted by $\mathbb{ R }^{ 2 }.$"

# ╔═╡ d241f46e-36f6-11eb-26a0-bfa6594d86c5
md"Points in the plane are denoted as $P \left( x , y \right)$. In Figure 1, we see the point $P \left( 3 , 2 \right)$."

# ╔═╡ fae68c66-36f6-11eb-398f-d55cd6a43e69
begin
	x = [3]
	y = [2]
	plot(x, y , seriestype = :scatter, xlims = (-4, 4), ylims = (-4, 4), title = "Figure 1", showaxis = false, label = "Point")
	plot!([(-4, 0), (4, 0)], label = "x axis")
	plot!([(0, -4), (0, 4)], label = "y axis")
end

# ╔═╡ 8caeb170-36f7-11eb-0fb3-a9867dcfbbd6
md"Points can exist in Cartesian space, $\mathbb{ R }^{ 3 }$, where we have three mutually orthogonal axes, by adding a $z$ axis according to the right-hand rule.  Such a point is denoted as $P \left( x , y , z \right)$.  There is no stopping, though, as points can exist in hyperspace, $\mathbb{ R }^{ n } , n > 3 , n \in \mathbb{ N }$."

# ╔═╡ 12513bb8-36f8-11eb-3dcb-3d04bfa276fb
md"## Vectors as geometric objects"

# ╔═╡ 1c94854e-36f8-11eb-1e7c-29d2107d1e8b
md"Restricting our discussion to $\mathbb{ R }^{ 2 }$ for the sake of simplicity, we can connect any two points in the plane. Just note that all of the discussion that follows pertains to $\mathbb{ R }^{ n }$ spaces too, where $ n > 2 , n \in \mathbb{ N }$. If one is our _starting point_ and the other our _destination point_, we can draw an arrow between the points. The arrow will have its _tail_ at the starting point and its _head_ at the destination point. This is a geometric representation of a vector."

# ╔═╡ 78bc1e68-36f8-11eb-25a5-a9bfeb27e47a
md"We can connect the origin of the plane to a point as well. A vector from the origin is a __position vector__, as seen in Figure 2, where we use the use the point, $P \left( 3, 2 \right)$, as the head of the vector."

# ╔═╡ d82538e4-36f8-11eb-382b-99d69607c5bd
begin
	plot(x, y , seriestype = :scatter, xlims = (-4, 4), ylims = (-4, 4), title = "Figure 2", showaxis = false, label = "Point")
	plot!([(0, 0), (3, 2)], label = "Position vector")
	plot!([(-4, 0), (4, 0)], label = "x axis")
	plot!([(0, -4), (0, 4)], label = "y axis")
end

# ╔═╡ 34d2403c-36f9-11eb-18df-070a33a85f50
md"## Vectors as mathematical objects"

# ╔═╡ 51e3060c-36f9-11eb-3e58-ed966fae86f9
md"While it is intuitive to view a vector as a geometric object, it is much more useful to view it as a mathematical object. In __Equation 1__, we use angled bracket notation to represent the vector, $\mathbf{ u }$, the position vector in __Figure 2__. In these notebooks we use a boldface lowercase letter to indicate a vector."

# ╔═╡ 850135c4-36f9-11eb-36f9-ff4d3cdef70e
md"__Equation 1__"

# ╔═╡ 8ca2933e-36f9-11eb-2abc-8562e78f0368
md"$\mathbf{ u } = \left< 3 , 2 \right>$"

# ╔═╡ 98c8665c-36f9-11eb-028e-b7e3f6976020
md"Another way to denote a vector is as a column vector, shown in __Equation 2__, where we use square brackets and parenthesis in the notation."

# ╔═╡ b40ccd0e-36f9-11eb-20b6-c5172553bb40
md"__Equation 2__"

# ╔═╡ b762778a-36f9-11eb-1bf6-c11cc546f885
md"$\mathbf{ u } = \begin{bmatrix} 3 \\ 2 \end{bmatrix} = \begin{pmatrix} 3 \\ 2 \end{pmatrix}$"

# ╔═╡ cd881d42-36f9-11eb-29b6-5946097925fd
md"Vectors in $\mathbb{ R }^{ 2 }$ and in $\mathbb{ R }^{ 3 }$ are generalized in __Equation 3__."

# ╔═╡ 8bb66648-36fa-11eb-0f49-8d36a7b1db3c
md"__Equation 3__"

# ╔═╡ 90628ffa-36fa-11eb-0048-0bf783d2aac8
md"$\begin{align} &\mathbf{ u } \in \mathbb{ R }^{ 2 } = \begin{bmatrix} x \\ y \end{bmatrix} \\ &\mathbf{ u } \in \mathbb{ R }^{ 3 } = \begin{bmatrix} x \\ y \\ z \end{bmatrix} \end{align}$"

# ╔═╡ e0c59bb6-36fa-11eb-2052-e372c91e0a51
md"The values for $x$, $y$, and so on, are termed the __components__ of a vector. Since we often deal with vectors in $\mathbb{ R }^{ n }$, where $n > 3 , n \in \mathbb{ N }$, we denote a generalized vector in __Equation 4__."

# ╔═╡ 2d16befc-36fb-11eb-295a-b5a913b3bace
md"__Equation 4__"

# ╔═╡ 0ccc59b8-36fb-11eb-30ec-d57f38dc2e0e
md"$\mathbf{ u } \in \mathbb{ R }^{ n } = \begin{bmatrix} x_{ 1 } \\ x_{ 2 } \\ \vdots \\ x_{ n } \end{bmatrix}$"

# ╔═╡ 4fbb3046-36fb-11eb-1505-8f9f4119691f
md"The $x_{ i }$ components are used for clarity, since we will may run out of letters of the alphabet for higher-dimensional vectors."

# ╔═╡ 7f327ab4-36fb-11eb-375f-ebd1b5f227f8
md"## The magnitude of a vector"

# ╔═╡ 97b177fc-36fb-11eb-3d82-fb3f358e055d
md"With vectors as geometric objects, it is clear to understand that they must have length, termed a __magnitude__."

# ╔═╡ af0b5ed6-36fb-11eb-29a4-4518b1a19106
md"In the plane, such a magnitude can be calculated using the Pythagorean theorem. This is because we can complete a right-angled triangle for any vector, as shown in __Figure 3__."

# ╔═╡ d744c2f4-36fb-11eb-28b1-9145ed3eb1dc
begin
	plot(x, y , seriestype = :scatter, xlims = (-4, 4), ylims = (-4, 4), title = "Figure 3", showaxis = false, label = "Point", legend = :topleft)
	plot!([(0, 0), (3, 2)], label = "Position vector")
	plot!([(0, 0), (3, 0)], label = "x component")
	plot!([(3, 0), (3, 2)], label = "y component")
	plot!([(-4, 0), (4, 0)], label = "x axis")
	plot!([(0, -4), (0, 4)], label = "y axis")
end

# ╔═╡ 01cb248a-36fc-11eb-375d-d9626a177d70
md"The Pythagorean theorem is defined in higher dimensions as well. This gives us __Equation 5__ for the magnitude of a vector, $\mathbf{ u } \in \mathbb{ R }^{ n }$, denoted by $\left| \mathbf{ u } \right|$."

# ╔═╡ 33ef3314-36fc-11eb-12ba-2fa47b513148
md"__Equation 5__"

# ╔═╡ 3972b04e-36fc-11eb-0161-d32cded73039
md"$\left| \mathbf{ u } \right| = \sqrt{ x_{ 1 }^{ 2 } + x_{ 2 }^{ 2 } + \ldots + x_{ n }^{ 2 } }$"

# ╔═╡ 5e31e056-36fc-11eb-0cdb-bb51ff471994
md"In the code cell below, we use one of the possible ways to create a vector in Julia. The vector represents $\mathbf{ u } = \left< 3 , 2 \right>$ from __Equation 1__."

# ╔═╡ 9174258c-36fc-11eb-0b20-e5753283bee0
u = [3; 2]

# ╔═╡ db7adc8e-36fc-11eb-235b-0de9ab7dcb3c
md"We use square brackets and separate the component values by a semi-colon. The code generates an instance of an array object. We assign this array to the computer variable `u`. The `typeof` function returns the type of the object in `u` below."

# ╔═╡ 9848c89a-36fc-11eb-0ffc-ebbc25bb7078
typeof(u)

# ╔═╡ d9c458ae-36fc-11eb-3601-7d3283e1c523
md"We see that the object in `u` is indeed an array, containing 64-bit integer values (integers) along axis $1$. In essence, this is a column vector."

# ╔═╡ 90907da8-3717-11eb-3f88-1dd144529c8d
md"We can also use the `Vector` function as seen in the code cell below, where the values are separated by a comma. If we use the `typeof` function, we see that it is still an instance of an array object."

# ╔═╡ ac5c3306-3717-11eb-0923-a74c503dc696
Vector([3, 2])

# ╔═╡ b368d424-3717-11eb-390c-69a54dd062ef
typeof(Vector([3, 2]))

# ╔═╡ 07a34160-36fe-11eb-2900-b9649c4fe52a
md"__Problem 1__"

# ╔═╡ c631baa6-3700-11eb-2e3a-35beb8af035c
md"Calculate the magnitude of the vector in $\mathbb{ R }^{ 4 }$, with components $3, 3, - 1, 2$."

# ╔═╡ e599f836-3700-11eb-3542-b9133c13b544
md"__Solution 1__"

# ╔═╡ 119e1f34-3701-11eb-0f8d-79898a289430
md"We see the solution in __Equation 6__."

# ╔═╡ 203c4cdc-3701-11eb-334e-9d25933ace39
md"__Equation 6__"

# ╔═╡ 27503664-3701-11eb-3d34-6b72a1cbd047
md"$\sqrt{ 3^{ 2 } + 3^{ 2 } + { \left( - 1 \right) }^{ 2 } + 2^{ 2 } } = \sqrt{ 9 + 9 + 1 + 4 } = \sqrt{ 23 } \approx 4.796$"

# ╔═╡ f50bff44-3d47-11eb-1393-abcc201fc3f5
sqrt(23)

# ╔═╡ eacd8a16-3700-11eb-1db0-0be4473a3cb1
md"The `norm` function calculates the magnitude of a vector object."

# ╔═╡ fc118764-3700-11eb-082c-c1cd0d9eecc0
norm([3; 3; -1; 2])

# ╔═╡ 65fac488-3701-11eb-2ff2-dd5dd774f34c
md"## The direction of a vector"

# ╔═╡ 8cebf71a-3701-11eb-03d8-778e0d3b3b03
md"In the first and second quadrant of the plane, a vector makes a positive, counter-clockwise angle with the positive $x$ axis. In the third and fourth quadrant, it makes a negative, clockwise angle with the positive $x$ axis. This angle is termed the __direction__ of a vector."

# ╔═╡ b1cccf64-3701-11eb-1409-43fe94b6653b
md"Since we can add an angle of $2 k \pi$, where $k = \left\{ 0 , 1 , 2 , \ldots \right\}$ to any angle we denote the angle where $k = 0$ are the __principal direction__."

# ╔═╡ 0d36f5e6-3702-11eb-397b-3fe4788f4bdb
md"The direction is calculated using trigonometry. We can calculate the direction, $\theta$, of the vector using __Equation 7__"

# ╔═╡ 4c67fd50-3702-11eb-1cb1-811852bc1086
md"__Equation 7__"

# ╔═╡ 504b0606-3702-11eb-3829-955a89e5b0b8
md"$\begin{align} &\tan{ \theta} = \frac{ y }{ x } \\ &\theta = \arctan{ \frac{ y }{ x } } \end{align}$"

# ╔═╡ 002851be-3703-11eb-32ed-dda0c57d4a8a
md"__Problem 2__"

# ╔═╡ 04e8af78-3703-11eb-167f-0f35bbb80345
md"Calculate the direction of the vector in the first quadrant with componets $x=3$ and $y = 2$."

# ╔═╡ 2aef87d2-3703-11eb-3269-6d2d208f8c7d
md"__Solution 2__"

# ╔═╡ 30d8965c-3703-11eb-1458-278f66a2150c
md"We use the `atan` function to calculate the inverse tangent."

# ╔═╡ a0109b68-3702-11eb-2058-c5a399fb1131
atan(2 / 3)

# ╔═╡ 424681a6-3703-11eb-068b-bf1bb934afe1
md"The angle can be expressed in degrees using the `rad2deg` function."

# ╔═╡ e7c804e8-3702-11eb-1d53-ed9d4f7f6077
rad2deg(atan(2 / 3))

# ╔═╡ f47ab08e-3702-11eb-2a90-891a570aa01e
md"In the following problems, we calculate directions in the second to fourth quadrants."

# ╔═╡ 6b72e8a8-3703-11eb-391f-1972847fcbad
md"__Problem 3__"

# ╔═╡ 70640432-3703-11eb-3e04-0990f6cc4c2c
md"Calculate the direction of the vector in the second quadrant of the plane, with components $x = - 3$ and $y = 2$."

# ╔═╡ 8bcb9db6-3703-11eb-0daa-995297c18428
md"__Solution 3__"

# ╔═╡ 926820cc-3703-11eb-3c1d-494b30a2d8c5
atan(2 / -3)

# ╔═╡ 9ae2c0e8-3703-11eb-1693-bd47c2759747
md"We note a negative answer. This is the clockwise angle with the negative $x$ axis and we need to add $\pi$ radians to it, so as to express the obtuse angle with the positive $x$ axis."

# ╔═╡ b9e84648-3703-11eb-01fe-272bb37e1b6d
π + atan(2 / -3)

# ╔═╡ c200e6c0-3703-11eb-0fb4-cfb508d80b3a
md"__Problem 4__"

# ╔═╡ cb10175e-3703-11eb-2284-a5d027bf5aa2
md"Calculate the direction of the vector in the third quadrant of the plane, with components $x = - 3$ and $y = - 2$."

# ╔═╡ d8cb958a-3703-11eb-3a6e-75c555bac1d7
md"__Solution 4__"

# ╔═╡ de54c7a6-3703-11eb-08e9-0744de9a989e
atan(-2 / -3)

# ╔═╡ e4fa9cc8-3703-11eb-1810-b9f3fc53f25f
md"This is the positive counter-clockwise angle with the negative $x$ axis. We need to add $- \pi$ to it for the clockwise angle with the positive $x$ axis."

# ╔═╡ 53680da8-3704-11eb-1728-e520852ec39f
-π + atan(-2 / -3)

# ╔═╡ 5a914f9c-3704-11eb-0353-d30f71da1e57
md"__Problem 5__"

# ╔═╡ 63e17cd4-3704-11eb-3e2a-ebc55f53fab2
md"Calculate the direction of the vector in the fourth quadrant of the plane, with components $x = 3$ and $y = - 2$."

# ╔═╡ 6f7932e4-3704-11eb-041e-29c7b08b8a7a
md"__Solution 5__"

# ╔═╡ 73d63d02-3704-11eb-399f-7b0b14225256
atan(-2 / 3)

# ╔═╡ 78866fbe-3704-11eb-2551-d3bc677f0797
md"This is indeed the negative, clockwise angle with the positive $x$ axis."

# ╔═╡ 8abf605a-3704-11eb-328b-894afe2ae9a0
md"Remember that we only need make changes in the second and third quadrants."

# ╔═╡ 9949a766-3704-11eb-3462-1378c4f63f1c
md"## Equal vectors"

# ╔═╡ a225e0de-3704-11eb-2e2a-df7bbba25709
md"Now that we know about the magnitude and direction of a vector, we note that two vectors are equal of they have the same magnitude and direction."

# ╔═╡ dc4d0c10-3704-11eb-0bbf-2d61dda1b34a
md"Note __Figure 4__, where the two line segments are drawn in the plane as vectors (with the points indicating the heads of the vectors)."

# ╔═╡ 14d4e74c-3705-11eb-046a-2d1cd4e4346f
begin
	plot(x, y , seriestype = :scatter, xlims = (-4, 4), ylims = (-4, 4), title = "Figure 4", showaxis = false, label = "Head 1", legend = :topleft)
	plot!([(0, 0), (3, 2)], label = "Vector 1")
	plot!([2], [1], seriestype = :scatter, label = "Head 2")
	plot!([(-1, -1), (2, 1)], label = "Vector 2")
	plot!([(-4, 0), (4, 0)], label = "x axis")
	plot!([(0, -4), (0, 4)], label = "y axis")
end

# ╔═╡ 3d860c46-3705-11eb-32f5-ef0f6f7501c1
md"These two vectors have the same magnitude and the same direction. We denote them as the __same vector__." 

# ╔═╡ 46c22702-3706-11eb-3eb7-714a7b883b32
md"To make this clear, if the first vector has its tail at $P \left( p_{ 1 } = 0 , p_{ 2 } = 0 \right)$ and its head at $Q \left( q_{ 1 } = 3 , q_{ 2 } = 2 \right)$, we have the vector $\mathbf{ P Q } = \left< 3 - 0 , 2 - 0 \right> = \left< 3, 2 \right>$."

# ╔═╡ caa317f0-3706-11eb-2468-4d20572f8cab
md"If the second vector has its tail at $P' \left( { p' }_{ 1 } = - 1 , { p' }_{ 2 } = - 1 \right)$ and its head at $Q' \left( { q' }_{ 1 } = 2 , { q' }_{ 2 } = 1 \right)$, we have the vector $\mathbf{ P' Q' } = \left< 2 - \left( - 1 \right)) , 1 - \left( - 1 \right) \right> = \left< 3, 2 \right>$ and $\mathbf{ P Q } = \mathbf{ P' Q'}$."

# ╔═╡ 768d6b24-3707-11eb-3ac6-a18e92bca3e5
md"## Row vectors"

# ╔═╡ 7d6e23e8-3707-11eb-2ad5-6dafc1caa33d
md"While we have seen column vectors, we can also create row vectors. These can be created by transposing a column vector. The __transpose__ of a vector, $\mathbf{ u }$, changes each column component to a row component and is denoted $\mathbf{ u }^{ T }$."

# ╔═╡ d497aaa4-3707-11eb-2d06-a350549b8eb4
md"In the code cell below, we reprint the array object assigned to the computer variable `u`. It represents a column vector, with a single colum and two rows of components."

# ╔═╡ adcb3940-3707-11eb-0ff7-e7ea04fb3e9a
u

# ╔═╡ d373a45c-3707-11eb-2d7f-995e116f673f
md"The `transpose` function generates an array along axis $2$, with a single row and two columns."

# ╔═╡ c99882ae-3707-11eb-3c80-7fd925fabd9e
transpose(u)

# ╔═╡ cdd73a36-3707-11eb-3dfe-4d1c79d336a7
md"In __Equation 8__ we see the transpose of a column vector to a row vector for a generalized vector in $\mathbb{ R }^{ n }$."

# ╔═╡ 48f1c8e4-3708-11eb-12ba-0f200a780e98
md"__Equation 8__"

# ╔═╡ 4d2e382a-3708-11eb-12b9-c7c641fc709e
md"$\begin{align} &\mathbf{ u } = \begin{bmatrix} u_{ 1 } \\ u_{ 2 } \\ \vdots \\ v_{ n } \end{bmatrix} \\ &\mathbf{ u }^{ T } = \begin{bmatrix} u_{ 1 } & u_{ 2 } & \cdots & v_{ n } \end{bmatrix}  \end{align}$"

# ╔═╡ 801e5488-3706-11eb-2acb-d5c87a546e9c
md"## Vector arithmetic"

# ╔═╡ b542b92c-3708-11eb-0931-b1d9aa7c5b39
md"We define simple vector arithmetic as addition and scalar-vector multiplication."

# ╔═╡ ab8e914e-3708-11eb-39e6-9744bdae85ef
md"### Vector addition"

# ╔═╡ b36e2de8-3708-11eb-1da9-89325e13b1cc
md"__Vector addition__ is defined in __Equation 9__."

# ╔═╡ d82afc9c-3708-11eb-3a77-816d38c89220
md"__Equation 9__"

# ╔═╡ dd151816-3708-11eb-1ced-83123cf14c03
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } \text{ it follows that } \mathbf{ u } + \mathbf{ v } = \begin{bmatrix} u_{ 1 } + v_{ 1 } \\ u_{ 2 } + v_{ 2 } \\ \vdots \\ u_{ n } + v_{ n } \end{bmatrix}$"

# ╔═╡ f169a096-3708-11eb-1152-afe25a05f832
md"This is simple component-wise addition and is only defined for vectors in the same plane or same space."

# ╔═╡ 4802516c-370b-11eb-0970-134c3511eb0b
md"In the geometric view, we are simply adding the components along each axis. We can place the tail of the second vector at the head of the first as seen in __Figure 5__."

# ╔═╡ 77fa3826-370b-11eb-0472-df3ec8c20a73
begin
	plot(x, y , seriestype = :scatter, xlims = (-2, 5), ylims = (-2, 5), title = "Figure 5", showaxis = false, label = "Head 1", legend = :topleft)
	plot!([(0, 0), (3, 2)], label = "Vector 1")
	plot!([4], [3], seriestype = :scatter, label = "Head 2")
	plot!([(3, 2), (4, 3)], label = "Vector 2")
	plot!([(0, 0), (4, 3)], label = "Resultant vector")
	plot!([(-2, 0), (5, 0)], label = "x axis")
	plot!([(0, -2), (0, 5)], label = "y axis")
end

# ╔═╡ 558eec20-3709-11eb-213c-71c9d8ee7f50
md"__Problem 6__"

# ╔═╡ 5a699902-3709-11eb-303a-fb37ad2dabd0
md"Create two random vectors in $\mathbb{ R }^{ 4 }$ and add them."

# ╔═╡ 7c3dcb54-3709-11eb-2586-19daa4fb1f3c
md"__Solution 6__"

# ╔═╡ ce60431a-3709-11eb-1f91-e1663dcbadde
md"We use the `seed!` function form the Random package so that we get the same pseudo-random numbers each time we generate such values."

# ╔═╡ 98c4a21e-3709-11eb-2e6a-95db481c30b9
Random.seed!(12)

# ╔═╡ e8f56516-3709-11eb-114b-d9a587c6ec37
md"In the code cell below, we generate an array using a unit range object as first argument to the `rand` function. It is set as `1:5`. This assures that each of the four components has a value selected form the set $\left\{ 1 , 2 , 3 , 4 , 5 \right\}$. The two instances of an array object are assigned to the computer variables `vector_1` and `vector_2` respectively."

# ╔═╡ 8b54f994-3709-11eb-0b8a-ff66b3c1bec8
vector_1 = rand(1:5, 4)

# ╔═╡ a5566da0-3709-11eb-3956-037dd4e4e9a0
vector_2 = rand(1:5, 4)

# ╔═╡ 256464ca-370a-11eb-09c4-b3883db912b9
md"The two objects are simply added."

# ╔═╡ b350dd8c-3709-11eb-3b76-d15ccdf2f25b
vector_1 + vector_2

# ╔═╡ b78a9ef6-3709-11eb-006d-cf32800cd7c3
md"### Scalar-vector multiplication"

# ╔═╡ 7a479ab6-370a-11eb-07f5-67f005fbb3be
md"__Scalar-vector multiplication__ is defined in __Equation 10__."

# ╔═╡ 96861054-370a-11eb-371a-6bc2070e9348
md"__Equation 10__"

# ╔═╡ 9d2a7ee0-370a-11eb-3c3b-b13b5c93cf35
md"$\forall c \in \mathbb{ R } , \mathbf{ u } \in \mathbb{ R }^{ n } \text{ it follows that } c \mathbf{ u } = \begin{bmatrix} c u_{ 1 } \\ c u_{ 2 } \\ \vdots \\ c u_{ n } \end{bmatrix}$"

# ╔═╡ b53d0ece-370a-11eb-038b-5f294a5d18e8
md"We simply multily each component by the scalar."

# ╔═╡ f3e4dafa-370a-11eb-04be-45a0a4605470
md"__Problem 7__"

# ╔═╡ fc252a00-370a-11eb-2340-63a66e151bee
md"Multiply `vector_1` by $3$."

# ╔═╡ 050d0372-370b-11eb-2b94-db08ef368de3
md"__Solution 7__"

# ╔═╡ 11e28052-370b-11eb-042a-8d372c3ce312
md"The star, `*`, symbol (SHIFT + 8 on most keyboards) serves as the multiplication operator."

# ╔═╡ 087ef6ee-370b-11eb-3427-fb4ab4b6e196
3 * vector_1

# ╔═╡ 6bdcb2ba-370d-11eb-3c1e-41eb1891184f
md"In the code cell below, we use the `@bind` macro form the PlutoUI package to create a slider assigned to the computer variable `c` that can take the values $\left\{ - 2, - 1 , 0 , 1 , 2 \right\}$. It is then used to scale the vector $\left< 2 , 2 \right>$ in __Figure 6__."

# ╔═╡ d991c17a-370c-11eb-1f1b-a78fd7067b1d
@bind c Slider(-2:2)

# ╔═╡ cbe92cac-370c-11eb-093d-59d3d8549e8b
begin
	plot([(0, 0), (c * 2, c* 2)], xlims = (-5, 5), ylims = (-5, 5), title = "Figure 6", showaxis = false, label = "Vector", legend = :topleft)
	plot!([(-2, 0), (5, 0)], label = "x axis")
	plot!([(0, -2), (0, 5)], label = "y axis")
end

# ╔═╡ 106eed78-370b-11eb-1906-33dc4fa053f6
md"Scalar-vector multiplication serves as changing the magnitude of a vector, but not its direction, unless the scalar is negative, in which case we reverse the direction of the vector. This is defined in __Equation 11__."

# ╔═╡ 24f7e19a-370c-11eb-11bf-63831004261a
md"__Equation 11__"

# ╔═╡ 2a272450-370c-11eb-016c-c3a2496bdd93
md"$\left| c \mathbf{ u } \right| = c \left| \mathbf{ u } \right|$"

# ╔═╡ 44772f30-370c-11eb-0d64-1bfd78f7897e
md"Vector subtraction is the defined as vector addition where the second vector is multiplied by $c = - 1$, as shown in __Equation 12__."

# ╔═╡ 7402e848-370c-11eb-38f2-13ab838bc54c
md"__Equation 12__"

# ╔═╡ 7790324a-370c-11eb-3217-2328a2711918
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } , - 1 \in \mathbb{ R } \text{ it follows that } \mathbf{ u } - \mathbf{ v } = \mathbf{ u } + \left( -1 \right) \mathbf{ v }$"

# ╔═╡ ae094866-3711-11eb-161a-fb55da325458
md"Since $c$ can be a reciprocal of a real value, we have scalar-vector division defined in __Equation 13__."

# ╔═╡ ce522b1a-3711-11eb-125d-51fd29a0a38c
md"__Equation 13__"

# ╔═╡ d5ecab98-3711-11eb-3a18-ad802e9fc91e
md"$\forall \mathbf{ u } \in \mathbb{ R }^{ n } , c \in \mathbb{ R } , c \ne 0 \text{ it follows that } \frac{ \mathbf{ u } }{ c } = \frac{ 1 }{ c } \mathbf{ u }$"

# ╔═╡ af74e12e-370c-11eb-3a0b-f7816ea50c1f
md"## The vector dot product"

# ╔═╡ ecb7109c-370d-11eb-1430-d3b8b73890e4
md"The __vector dot product__ is defined in __Equation 14__."

# ╔═╡ fa90b218-370d-11eb-398e-f327ab6d758d
md"__Equation 14__"

# ╔═╡ fe49c00c-370d-11eb-08d2-879fff8e37eb
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } \text{ it follows that } \mathbf{ u } \cdot \mathbf{ v } = \mathbf{ u }^{ T } \mathbf{ v } = \sum_{ i = 1 }^{ n }{ u_{ i } \cdot v_{ i } }$"

# ╔═╡ 7f0f9cba-370f-11eb-3be0-41bdeaf7bcec
md"In vector calculus the dot product of two vector in the plane stems from the orthogonal projection of one vector onto the ather and calculates the area of a paralellogram formed by the two vectors."

# ╔═╡ afb794ee-370f-11eb-0d3b-edec6939d06c
md"__Problem 8__"

# ╔═╡ bb42ae46-370f-11eb-0670-7b4f629e634c
md"Generate two vectors in $\mathbb{ R }^{ 4 }$ and calculate their dot product."

# ╔═╡ ce0dc71c-370f-11eb-3c27-87ddce4b0695
md"__Solution 8__"

# ╔═╡ f834a5ae-370f-11eb-3513-379b342f9312
md"We proceed in the same fashion as __Problem 6__."

# ╔═╡ e1129d34-370f-11eb-3d4d-abfd0eea35de
Random.seed!(12)

# ╔═╡ d6665918-370f-11eb-0cc7-d17e3612f1e2
vector_3 = rand(1:5, 4)

# ╔═╡ e9cad902-370f-11eb-1f27-39e683f7743f
vector_4 = rand(1:5, 4)

# ╔═╡ 0c0a85e4-3710-11eb-0a7e-1d6681a57587
md"The `dot` function calculates the dot product."

# ╔═╡ ef6ad2b8-370f-11eb-1b07-9934e2498880
dot(vector_3, vector_4)

# ╔═╡ 1abf6a9e-3710-11eb-3c63-f527f4151f02
md"This calculation is shown in __Equation 15__."

# ╔═╡ 338ba152-3710-11eb-26ac-4dcb33f918ba
md"__Equation 15__"

# ╔═╡ 37910490-3710-11eb-37ab-a99e7390000c
md"$\begin{bmatrix} 5 \\ 4 \\ 2 \\ 4 \end{bmatrix} \cdot \begin{bmatrix} 1 \\ 5 \\ 4 \\ 3 \end{bmatrix} = 5 \cdot 1 + 4 \cdot 5 + 2 \cdot 4 + 4 \cdot 3 = 5 + 20 + 8 + 12 = 45$"

# ╔═╡ 54d70b7c-3a43-11eb-3003-0daccb9bfe1c
md"The dot product has some interesting properties.  Firstly, the dot product of a vector with itself is always positive (or $0$).  This follows from the fact that each component is squared and squares are always positive.  Since we add all these positive squares, the result must always be positive.  The only way that a dot product of a vector with itself can be $0$, is when the vector is itself the zero vector."

# ╔═╡ 7b53c894-3a43-11eb-1860-dbbd67f1bf65
md"__Problem 8__"

# ╔═╡ 8328fb20-3a43-11eb-0ab4-7d294e220571
md"Calcluate the dot product of the vector $\mathbf{u}=\left<3,4,-3\right>$ with itself."

# ╔═╡ bde0420a-3a43-11eb-22eb-e1f5f07581fd
md"__Solution 8__"

# ╔═╡ c4d27f60-3a43-11eb-3583-e92668eac55b
md"The solution in shown in __Equation 16__."

# ╔═╡ d06001b8-3a43-11eb-34ef-237582c9560f
md"$\mathbf{ u } \cdot \mathbf{ u } = 3^{ 2 } + 4^{ 2 } + { \left( -3 \right)}^{ 2 } = 9 + 16 + 9 = 34$"

# ╔═╡ 188aaf04-3a44-11eb-2355-8badeebe03c5
md"We verify this result with code."

# ╔═╡ 248de946-3a44-11eb-3495-55f80c020b86
dot([3; 4; -3],[3; 4; -3])

# ╔═╡ 3bec0bde-3a44-11eb-3b05-abedf13626c2
md"We note that the dot product of a vector with itself is the square of it magnitude, shown in __Equation 16__."

# ╔═╡ 33c8f35c-3d2f-11eb-22e7-29ac5cdce932
md"__Equation 16__"

# ╔═╡ 5d529d2e-3a44-11eb-27bf-874ab138e8c3
md"$\mathbf{ u } \cdot \mathbf{ u } = { \left|| \mathbf{ u } \right|| }^{ 2 }$"

# ╔═╡ 856a681e-3a44-11eb-0bd5-29187dc947d9
md"Secondly, when two vectors are orthogonal (perpendicular), their dot product is $0$.  Consequently, if the dot product of two vectors is $0$, then they are orthogonal. Two such vectors, $\mathbf{ u } = \left< 3 , 5 \right>$ and $\mathbf{ v } = \left< -5, 3 \right>$ are seen in Figure 7."

# ╔═╡ 58ff0dd8-3a45-11eb-3ec2-fd1cf1bd530e
begin
	plot([(0, 0), (3, 5)], xlims = (-5, 5), ylims = (-5, 5), title = "Figure 6", showaxis = false, label = "Vector 1", legend = :topleft)
	plot!([(0, 0), (-5, 3)], label = "Vector 2")
	plot!([(-5, 0), (5, 0)], label = "x axis")
	plot!([(0, -2), (0, 5)], label = "y axis")
end

# ╔═╡ bd047c46-3a45-11eb-0f79-6919d788415f
md"We verify the dot product is $0$ using code."

# ╔═╡ c9d70bf0-3a45-11eb-3c7b-e355f842034a
dot([3; 5],[-5; 3])

# ╔═╡ eb3beb58-3a45-11eb-3cb7-213b81743e3e
md"The are three more properties that are listed below in __Equation 17__."

# ╔═╡ 577726d4-3d2f-11eb-1507-4b15fb41b2e1
md"__Equation 17__"

# ╔═╡ fae97bec-3a45-11eb-39bc-d74c00a9f8fc
md"$\begin{align} &\mathbf{ u } \cdot \mathbf{ v } = \mathbf{ v } \cdot \mathbf{ u } \\ &\mathbf{ u } \left( \mathbf{ v } + \mathbf{ w } \right) = \mathbf{ u } \cdot \mathbf{ v } + \mathbf{ u } \cdot \mathbf{ w } \\ &k \left( \mathbf{ u } \cdot \mathbf{ v } \right) = k \mathbf{ u } \cdot \mathbf{ v } = \mathbf{ u } \cdot k \mathbf{ v } \end{align}$"

# ╔═╡ 546d5ada-3a46-11eb-3efc-595445604af3
md"### The dot product as a function of the angle between vectors"

# ╔═╡ 60035d5e-3a46-11eb-0195-53ae917f37ec
md"The dot product can be redefined as a function of the angle between two vectors.  This requires the law of cosines, shown in __Equation 18__ for the three sides, $a , b$, and $c$ of a triangle and the angle $\theta$ between sides $a$ and $b$. Here we view the length of side $a$ as the magnitude of the vector, $\mathbf{ a }$, being $\left|| \mathbf{ a } \right||$, the side $b$ as the magntidue of the vector, $\mathbf{ b }$, being $\left|| \mathbf{ b } \right||$. The side $c$ opposite $\theta$ is then the magnitude of the vector, $\mathbf{ a } - \mathbf{ b }$, being $\left|| \mathbf{ a } - \mathbf{ b } \right||$."

# ╔═╡ a5aa6f64-3a46-11eb-18e0-87044af3564e
md"__Equation 18__"

# ╔═╡ 6c743c02-3a46-11eb-3e4e-eb547f436ff2
md"$\begin{align} &c^{ 2 } = a^{ 2 } + b^{ 2 } -2ab\cos(\theta ) \\ &{ \left|| \mathbf{ a } - \mathbf { b} \right|| }^{ 2 } = { \left|| \mathbf{ a } \right|| }^{ 2 } + { \left|| \mathbf{ b } \right|| }^{ 2 } - 2 \left|| \mathbf{ a } \right|| \left|| \mathbf{ b } \right|| \cos{ \theta } \end{align}$"

# ╔═╡ abaedfa8-3d34-11eb-05b3-a18d8c9ffbb9
md"We express the square of the difference between vectors in __Eqaution 19__."

# ╔═╡ eae2a17c-3d30-11eb-2ff8-7fd6b9245a70
md"__Equation 19__"

# ╔═╡ f2a9df92-3d30-11eb-299b-73b8b77a9dfb
md"$\begin{align} &\mathbf{ a } - \mathbf{ b } = \left< a_{ 1 } - b_{ 1 } , a_{ 2 } - b_{ 2 } \right> \\ &\left|| \mathbf{ a } - \mathbf{ b } \right|| = \sqrt{ { \left(  a_{ 1 } - b_{ 1 } \right) }^{ 2 } + { \left(  a_{ 2 } - b_{ 2 } \right) }^{ 2 } }  \\ &{ \left|| \mathbf{ a } - \mathbf{ b } \right|| }^{ 2 } = { \left(  a_{ 1 } - b_{ 1 } \right) }^{ 2 } + { \left(  a_{ 2 } - b_{ 2 } \right) }^{ 2 } \\ &{ \left|| \mathbf{ a } - \mathbf{ b } \right|| }^{ 2 } = a_{ 1 }^{ 2 } + a_{ 2 }^{ 2 } + b_{ 1 }^{ 2 } + b_{ 2 }^{ 2 } -  2 \left( a_{ 1 } b_{ 1 } + a_{ 2 } b_{ 2 } \right) \\ &{ \left|| \mathbf{ a } - \mathbf{ b } \right|| }^{ 2 } = { \left|| \mathbf{ a } \right|| }^{ 2 } + { \left|| \mathbf{ b } \right|| }^{ 2 }  - 2 \left( \mathbf{ a } \cdot \mathbf{ b } \right) \end{align}$"

# ╔═╡ 7781ca9c-3d34-11eb-0f48-41ea05729c9b
md"Combining __Equation 18__ and __Equation 19__, we have an equation for the angle between two vectors, shown in __Equation 20__."

# ╔═╡ 91ae68ea-3d33-11eb-23bc-4d059317b03a
md"__Equation 20__"

# ╔═╡ 98328c46-3d33-11eb-159b-4fb5c10a5add
md"$\begin{align} &{ \left|| \mathbf{ a } \right|| }^{ 2 } + { \left|| \mathbf{ b } \right|| }^{ 2 }  - 2 \left( \mathbf{ a } \cdot \mathbf{ b } \right) =  { \left|| \mathbf{ a } \right|| }^{ 2 } + { \left|| \mathbf{ b } \right|| }^{ 2 } - 2 \left|| \mathbf{ a } \right|| \left|| \mathbf{ b } \right|| \cos{ \theta } \\ &\mathbf{ a } \cdot \mathbf{ b } = \left|| \mathbf{ a } \right|| \left|| \mathbf{ b } \right|| \cos{ \theta }  \\ &\theta = \cos^{ -1 } \left( \frac{ \mathbf{ a } \cdot \mathbf{ b }}{ \left|| \mathbf{ a } \right|| \left|| \mathbf{ b } \right|| } \right) \end{align}$"

# ╔═╡ d9c95c2a-3d38-11eb-1b3e-5f4d42cec1d9
md"__Equation 20__ for the angle between vectors also extends to vectors in hiher dimensions."

# ╔═╡ 0a762102-3d37-11eb-2bf8-6bad28a60070
md"__Problem 9__"

# ╔═╡ 12a34ada-3d37-11eb-2ca4-999c72d3ddbd
md"Calculate the angle between the vectors $\left< 3 , -1, 7 \right>$ and $\left< -2 , 1, 9 \right>$."

# ╔═╡ 423cfeda-3d37-11eb-1e4c-7b6734537c5d
md"__Solution 9__"

# ╔═╡ 7ed65014-3d37-11eb-0835-1b1a04233f31
md"The `acos` function calculates the inverse cosine function."

# ╔═╡ 493728d2-3d37-11eb-3b52-91ca8e6219c2
acos((dot([3; -1; 7], [-2; 1; 9])) / (norm([3; -1; 7]) * norm([-2; 1; 9])))

# ╔═╡ c2684cc6-3d38-11eb-3dfd-7b4fb45598bf
md"Using the `rad2deg` function, we see that this angle is just over ${ 38}^{ o }$."

# ╔═╡ 67b9c642-3d38-11eb-0ddc-21068c612777
rad2deg(acos((dot([3; -1; 7], [-2; 1; 9])) / (norm([3; -1; 7]) * norm([-2; 1; 9]))))

# ╔═╡ 04a78746-3d39-11eb-0cf5-43b3fc90ee00
md"### Cauchy-Schwarz inequality"

# ╔═╡ 0ae090bc-3d39-11eb-141b-77b9a1ffedbd
md"The Cauchy-Schwarz inequality is defined in __Equation 21__."

# ╔═╡ 616d86a0-3d3a-11eb-275b-c7fe62267917
md"__Equation 21__"

# ╔═╡ 137a7742-3d39-11eb-18e3-313145b46794
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } \text{ it follows that }\left|| \mathbf{ u } \cdot \mathbf{ v } \right|| \le \left|| \mathbf{ u } \right|| \left|| \mathbf{ v } \right||$"

# ╔═╡ 7049bb5e-3d39-11eb-2959-bf85df712475
md"This states that the absolute value of the dot product of two vectors is less than of equal to the product of the magnitude of the two vectors."

# ╔═╡ 731c8de8-3d39-11eb-3435-0befdcc2172e
md"__Problem 10__"

# ╔═╡ 7de19462-3d39-11eb-2bc3-31a9e711f8e8
md"Compare the two vectors $\left< 2 , 3 , 1 \right>$ and $\left< -1 , -2 , 2 \right>$ with respect to the Cauchy-Schwarz inequality."

# ╔═╡ 805e458a-3d39-11eb-3c95-a3b5668d8ae2
md"__Solution 10__"

# ╔═╡ 855a41e4-3d39-11eb-059c-234c54038b2e
md"We calcuate both $\left|| \mathbf{ u } \cdot \mathbf{ v } \right||$ and $\left|| \mathbf{ u } \right|| \left|| \mathbf{ v } \right||$ below."

# ╔═╡ e2bb8ee2-3d39-11eb-3648-0d5135ceb5af
abs(dot([2; 3; 1], [-1; -2; 2]))

# ╔═╡ f6e95d38-3d39-11eb-13d8-af79d7b6ceac
norm([2; 3; 1]) * norm([-1; -2; 2])

# ╔═╡ fda46f80-3d39-11eb-0119-977392fdd249
md"The inequality holds for this example."

# ╔═╡ 036f3d0a-3d3a-11eb-02e8-378681e506c0
md"### Triangle inequality"

# ╔═╡ 418d27c8-3d3a-11eb-1275-57a7f91761ba
md"This inequality is intuitively understood from the three sides of a triangle. If two sides are interpreted as two vector, arranged tail-to-head, so as to indicate the sum of the two vectors, then the length of these two sides is equal to or longer than their addition."

# ╔═╡ 47112314-3d3a-11eb-0d2d-296776715d0f
md"The triangle inequality is defined in __Equation 22__."

# ╔═╡ 6ae85bce-3d3a-11eb-1499-99a11fb8d249
md"__Equation 22__"

# ╔═╡ 717878d4-3d3a-11eb-18ab-6ffce1b06775
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } \text{ it follows that }\left|| \mathbf{ u } + \mathbf{ v } \right|| \le \left|| \mathbf{ u } \right|| + \left|| \mathbf{ v } \right||$"

# ╔═╡ 82150204-3d3a-11eb-0905-21b6a1136791
md"__Problem 11__"

# ╔═╡ 9312a0aa-3d3a-11eb-27a9-8bd579b1a33e
md"Compare the two vectors $\left< 2 , 3 , 1 \right>$ and $\left< -1 , -2 , 2 \right>$ with respect to the triangle inequality."

# ╔═╡ a90b5e74-3d3a-11eb-3317-0b4f6ab20faf
md"__Solution 11__"

# ╔═╡ b03d68ae-3d3a-11eb-3f61-31a66d3c0748
md"We calcuate both $\left|| \mathbf{ u } + \mathbf{ v } \right||$ and $\left|| \mathbf{ u } \right|| + \left|| \mathbf{ v } \right||$ below."

# ╔═╡ c421c4b4-3d3a-11eb-3096-bbb549d70c54
norm([2; 3; 1] + [-1; -2; 2])

# ╔═╡ d70c40fe-3d3a-11eb-04cc-c7ea40e8753f
norm([2; 3; 1]) + norm([-1; -2; 2])

# ╔═╡ e78be65a-3d3a-11eb-2bb5-7364c6e5267a
md"The inequality holds for this example."

# ╔═╡ effff060-3d3a-11eb-0dd3-31e5a0b71a2e
md"### Orthogonal projections"

# ╔═╡ 048cd988-3d3b-11eb-352a-a55a50eca0df
md"In the image below, we have a vector, $\mathbf{ w }$, and can calculate its orthogonal projection, $\mathbf{ u }$, along another vector, $\mathbf{ a }$.  This projection is denoted by $\text{proj}_{ \mathbf{ a } } \mathbf{ w }$, the projection of $\mathbf{ w }$ along $\mathbf{ a }$."

# ╔═╡ 6a49c8c8-3d3b-11eb-3237-59335f117004
LocalResource("/Users/juan/Documents/Mathematics/LinearAlgebraWithJulia/src/Projection.png")

# ╔═╡ 9db4143e-3d3b-11eb-0c03-39528d9481f0
md"It should be clear that if we have a vector orthogonal to $\mathbf{ u }$ (or $\mathbf{ a }$), called $\mathbf{ v }$, we that $\mathbf{ u } + \mathbf{ v } = \mathbf{ w }$.  We can now derive an equation for this projection, shown in __Equation 23__, where $\mathbf{ u }$ is a scalar multiple of $\mathbf{ a }$."

# ╔═╡ e899391a-3d3c-11eb-09ef-dd4ab4617a6b
md"__Equation 23__"

# ╔═╡ ecd3a7fe-3d3c-11eb-2c48-17cceadd34c8
md"$\begin{align} &\mathbf{ w } = \mathbf{ u } + \mathbf{ v } \\ &\mathbf{ u } = \mathbf{ w } - \mathbf{ v } \\ &\mathbf{ u } = \text{proj}_{ \mathbf{ a } } \mathbf{ w } = \mathbf{ w } - \mathbf{ v } \\ &\mathbf{ u } = k \mathbf{ a } \\ &\mathbf{ w } = k \mathbf{ a } + \mathbf{ v } \\ &\mathbf{ w } \cdot \mathbf{ a } = \left( k \mathbf{ a } + \mathbf{ v } \right) \cdot \mathbf{ a } = k \left( \mathbf{ a } \cdot \mathbf{ a } \right) + \mathbf{ v } \cdot \mathbf{ a } = k { \left|| \mathbf{ a } \right||}^{ 2 } + \mathbf{ v } \cdot \mathbf{ a } \\ &\mathbf{ v } \cdot \mathbf{ a } = 0 \\ &k = \frac{ \mathbf{ w } \cdot \mathbf{ a } }{ { \left|| \mathbf{ a } \right|| }^{ 2 } } \\ &\mathbf{ u } = \text{proj}_{ \mathbf{ a } } \mathbf{ w } = \frac{ \mathbf{ w } \cdot \mathbf{ a } }{ { \left|| \mathbf{ a } \right|| }^{ 2 } } \mathbf{ a } \end{align}$"

# ╔═╡ 3a7836a0-3d3d-11eb-0089-cdf24a4709ca
md"We can also derive the magnitude of this projection, shown in __Equation 24__."

# ╔═╡ a0d26960-3d3e-11eb-09a9-ebdee0fda513
md"__Equation 24__"

# ╔═╡ a51afb0e-3d3e-11eb-3855-e59dfc25158c
md"$\begin{align} &\left|| \text{proj}_{ \mathbf{ a } } \mathbf{ w } \right|| = \left| \frac{ \mathbf{ w } \cdot \mathbf{ a } }{ { \left|| \mathbf{ a } \right|| }^{ 2 } } \mathbf{ a } \right| \\ &\left|| \text{proj}_{ \mathbf{ a } } \mathbf{ w } \right|| = \left| \frac{ \mathbf{ w } \cdot \mathbf{ a } }{ { \left|| \mathbf{ a } \right|| }^{ 2 } } \right| \left|| \mathbf{ a } \right|| \\ &\left|| \text{proj}_{ \mathbf{ a } } \mathbf{ w } \right|| = \frac{ \left| \mathbf{ w } \cdot \mathbf{ a } \right| }{ { \left|| \mathbf{ a } \right|| } } \end{align}$"

# ╔═╡ 1f5745be-3d3d-11eb-051d-9f47e42a1f18
md"In physics, work is the product of force and displacement. Work is a scalar and the work done by the force is only a function of the component of the force in the direction of the displacement. Work is a dot product, $W = \mathbf{ F } \cdot \mathbf{ d }$, where $\mathbf{ F }$ is the force applied and $\mathbf{ d }$ is the displacement. If $\mathbf{ a }$ in the image above and in our derivation takes the role of the displacement and $\mathbf{ w }$, takes the role of the force, then we have that $\mathbf{ u } = \left|| \text{proj}_{ \mathbf{ a } } \mathbf{ w } \right||$ is the component of the force in the direction of the displacement and from __Equation 24__, we have that the word done, $\left|| \mathbf{ w } \cdot \mathbf{ a } \right|| = \left|| \mathbf{ a } \right|| \left|| \text{proj}_{ \mathbf{ a } } \mathbf{ w } \right||$."

# ╔═╡ 3e6dfe20-3707-11eb-08d6-e5f9cc14d066
md"## Unit vectors"

# ╔═╡ 8528bd42-3710-11eb-37da-c3e52d24aab5
md"__Unit vectors__ are vectors in the same direction as an original vector, but of magnitude $1$. We simply divide each component of the vector by the magnitude of the vector. This is defined in __Equation 25__ for the vector $\mathbf{ u }$ and is denoted $\hat{ u }$."

# ╔═╡ eefd4882-3710-11eb-3c64-2320e6250a5d
md"__Equation 25__"

# ╔═╡ a74aef8a-3710-11eb-3a62-c1d38227cbb8
md"$\forall \mathbf{ u } \in \mathbb{ R }^{ n } \text{ it follows that } \hat{ u } = \frac{ \mathbf{ u } }{ \left| \mathbf{ u } \right|}$"

# ╔═╡ e75d700c-3710-11eb-3e4c-4bfc27b3f2dc
md"__Problem 12__"

# ╔═╡ 013d047e-3711-11eb-074e-6b655372aefb
md"Calculate the unit vector of the vector $ \mathbf{ u } = \left< 3, 4, 0 \right>$."

# ╔═╡ 1973bb44-3711-11eb-3861-ff2da04b82c2
md"__Solution 12__"

# ╔═╡ 5ed15f7c-3711-11eb-21ae-e5bf7948580e
md"We assign an array object to the computer variable `vector_u` and use the `norm` function to determine its magnitude."

# ╔═╡ 20be3a48-3711-11eb-2b3e-df6e84409c41
vector_u = [3; 4; 0]

# ╔═╡ 4109574a-3711-11eb-35a2-617d2aca0a6c
norm(vector_u)

# ╔═╡ 91aec25e-3711-11eb-235f-854cd229ffe0
md"Now we simply do the division."

# ╔═╡ 4f5277a2-3711-11eb-3ae4-2fd82903e6d1
vector_u / norm(vector_u)

# ╔═╡ 7172584c-3712-11eb-20bc-655aac5521ed
md"The three unit vectors along the positive axes of the Cartesian plane are termed the __unit basis vectors__ and are shown in __Equation 26__."

# ╔═╡ 925ec81a-3712-11eb-100c-7ff43510f491
md"__Equation 26__"

# ╔═╡ 99481bb8-3712-11eb-1428-8ff4abc690aa
md"$\hat{ i } = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix} , \hat{ j } = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix} , \hat{ k } = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$"

# ╔═╡ 7a06e5bc-370e-11eb-1a25-0f24022f2bf4
md"## The vector cross product"

# ╔═╡ 80976eba-370e-11eb-3e93-ef3cff0c1dc4
md"The __vector cross product__ in $\mathbb{ R }^{ 3 }$ is defined in __Equation 27__, where we denote the cross product of two vectors $\mathbf{u} \times \mathbf{v}$, for $\mathbf{u} , \mathbf{v} \in \mathbb{R}^{n}$."

# ╔═╡ 8a84fb54-370e-11eb-165f-05c3928a4433
md"__Equation 27__"

# ╔═╡ 8d526092-370e-11eb-2e16-b93a00c77a04
md"$\forall \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ n } \text{ it follows that } \mathbf{ u } \times \mathbf{ v } = \left| \begin{bmatrix} \hat{ i } & \hat{ j } & \hat{ k } \\ u_{ 1 } & u_{ 2 } & u_{ 3 } \\ v_{ 1 } & v_{ 2 } & v_{ 3 } \end{bmatrix} \right|$"

# ╔═╡ f608899a-370e-11eb-36de-6f5f92a7ddc4
md"__Equation 27__ refers to the determinant along the first row of the indicated matrix. This is covered in  future notebook on the determinant."

# ╔═╡ 0fb6a432-370f-11eb-0058-63bcc88c0d9b
md"For now, we view the vector cross product as a resultant vector, perpendicular to the plane created by the two original vectors. In vector calculus, this is termed the __normal__ vector to the plane."

# ╔═╡ 0326f6f8-3713-11eb-104f-9b1125b064e3
md"__Problem 13__"

# ╔═╡ 11e873ce-3713-11eb-1c49-47e9dcdf059e
md"Use `vector_u` from __Problem 12__ and create `vector_v` as $\left< 2 , 1 , 0 \right>$. Calculate their cross product."

# ╔═╡ 3a758bec-3713-11eb-125a-9339a69ce002
md"__Solution 13__"

# ╔═╡ ef6eb6ca-3712-11eb-1892-d72641ee1ad4
vector_v = [2; 1; 0]

# ╔═╡ 4663e174-3713-11eb-0aa9-c1e4c9c05858
md"The `cross` function calculates the cross product."

# ╔═╡ d37664de-3712-11eb-36ee-67afa6f56038
cross(vector_u, vector_v)

# ╔═╡ 4f249d9e-3713-11eb-093a-5b919c6fae8a
md"Both vectors are in the $ x y $ plane, that is to say, in $\mathbb{ R }^{ 2 }$.  We have to express then in $\mathbb{ R }^{ 3 }$, by adding the component $z = 0$. Note that the cross product is perpendicular to the $x y$ plane, along the $z$ axis, with no component in the plane."

# ╔═╡ 19c214b0-3a24-11eb-39c7-59b2b107213a
md"### Physical interpretation of the vector cross product"

# ╔═╡ 65d05abe-3a20-11eb-2b87-0983fdcd21da
md"The physical intuition for the vector cross product come from the area of a parallelogram. We see two vectors in Figure 7, $\left< 3 , 0 \right>$ and $\left< 4 , 2 \right>$. If we duplicate and translate them, we have a parallelogram."

# ╔═╡ b4a0181c-3a20-11eb-0279-a9485ee19cdb
begin
	plot([(0,0),(3,0)], xlims = (-2, 9), ylims = (-2, 5), title = "Figure 7", showaxis = false, label = "Vector 1", legend = :topleft)
	plot!([(0, 0), (5, 2)], label = "Vector 2")
	plot!([(3, 0), (8, 2)], label = "Translation 1")
	plot!([(5, 2), (8, 2)], label = "Translation 2")
	plot!([(-2, 0), (9, 0)], label = "x axis")
	plot!([(0, -2), (0, 5)], label = "y axis")
end

# ╔═╡ c1d28c58-3a23-11eb-0663-6de0df4260fd
md"The area of a parallelogram is base times perpendicular height. In our example that is $3 \times 2 = 6$. The cross product is a vector perpendicular to the plane. The magnitude of this vector is the area of the parallelogram. We verify this with code below."

# ╔═╡ d54bd9bc-3a23-11eb-14d9-db2189078043
cross([3; 0; 0], [5; 2; 0])

# ╔═╡ fb3ea47c-3a23-11eb-3861-61812062772c
norm(cross([3; 0; 0], [5; 2; 0]))

# ╔═╡ 2ce95940-3a24-11eb-32c0-4fc73eed1578
md"### The scalar triple product"

# ╔═╡ 47a01ff0-3a24-11eb-1b83-375efc61008a
md"The scalar triple product is defined in __Equation 28__, $\forall \mathbf{ u } , \mathbf{ v } , \mathbf{ w } \in \mathbb{ R }^{ 3 }$."

# ╔═╡ 803d768a-3a24-11eb-0dfd-277d10090757
md"__Equation 28__"

# ╔═╡ 513e97ec-3a24-11eb-3c92-55ef232241da
md"$\mathbf{ u } \cdot \left( \mathbf{ v } \times \mathbf{ w } \right)$"

# ╔═╡ 8fdaae50-3a24-11eb-005f-1914bc86d2b2
md"This value is calculated from the determinant of the matrix in __Equation 29__. We learn more about matrices and determinants on future notebooks."

# ╔═╡ ad94a69e-3a24-11eb-1b7f-75b163fb9e5d
md"__Equation 29__"

# ╔═╡ b7afd784-3a24-11eb-0d48-137a5f67c4a2
md"$\left| \begin{bmatrix} u_{ 1 } & u_{ 2 } & u_{ 3 } \\ v_{ 1 } & v_{ 2 } & v_{ 3 } \\ w_{ 1 } & w_{ 2 } & w_{ 3 } \end{bmatrix} \right|$"

# ╔═╡ dc9e726c-3a24-11eb-1fff-5f70b33bde81
md"The scalar triple product is used to calculate the volume of a paralellipiped in $\mathbb{ R }^{ 3 }$ and ihis volume is the absolute value of the scalar triple product.."

# ╔═╡ 6fb82764-3708-11eb-0da7-7502291a3e43
md"## Spanning"

# ╔═╡ 74f823c0-3708-11eb-13d2-1dc1fe48d298
md"If we consider the Cartesian plane and the unit vectors $\hat{ i }$ and $\hat{ j }$, we note that we can _get to_ and point (vector) in the plane by a linear combination of the two unit vectors. A __linear combination of vectors__ in $\mathbb{ R }^{ 2 }$ add scalar multiples of vectors to each other and is defined in __Equation 30__. Note that the linear combination of vectors is defined for any $\mathbb{ R }^{ n }$."

# ╔═╡ bcd61c60-38ac-11eb-1034-1750af1da4c6
md"__Equation 30__"

# ╔═╡ c8f060d6-3713-11eb-3daf-4de23d405ef0
md"$\begin{align} &\forall c_{ 1 } , c_{ 2 } \in \mathbb{ R } \text{ and } \mathbf{ u } , \mathbf{ v } \in \mathbb{ R }^{ 2 } , \text{ we have } c_{ 1 } \mathbf{ u } + c_{ 2 } \mathbf{ v } \\ &c_{ 1 } \mathbf{ u } + c_{ 2 } \mathbf{ v } = c_{ 1 } \begin{bmatrix} u_{ 1 } \\ u_{ 2 } \end{bmatrix} +  c_{ 2 } \begin{bmatrix} v_{ 1 } \\ v_{ 2 } \end{bmatrix} \end{align}$"

# ╔═╡ 13c14a76-3714-11eb-3512-a9a76dbb13c4
md"This means that we can express the vector $\left< 3 , 4 \right>$ as $3 \hat{ i } + 4 \hat{ j }$."

# ╔═╡ ee3bbe68-3714-11eb-37c9-45303610ac14
md"The vectors $\hat{ i }$ and $\hat{ j }$ are a __basis__ for $\mathbb{ R }^{ 2 }$ and as said to __span__ $\mathbb{ R }^{ 2 }$."

# ╔═╡ 43e94284-3715-11eb-3429-75a8a2e0f4cc
md"Furthermore, vectors $\hat{ i }$ and $\hat{ j }$ are said to be __linearly independent__. No scalar multiple of the one will result in the other."

# ╔═╡ 17bc9576-3715-11eb-247d-eb40f752c815
md"It should be intuitive that two vectors that are scalar multiples of each other are limited in the space that they can span. The vectors $\mathbf{ u } = \left< 1 , 2 \right>$ and $\mathbf{ v } = \left< 2, 4 \right>$ cannot span $\mathbb{ R }^{ 2 }$ since $\mathbf{ v } = 2 \mathbf{ u }$. They can only span a line along the vector $\mathbf{ u }$.  They are said to be __linearly dependent__ vectors."

# ╔═╡ Cell order:
# ╟─dabc9ee2-36f5-11eb-3b82-d963d863a9b3
# ╟─ebdbb906-36f5-11eb-3033-376759f5b677
# ╟─f9286e60-36f5-11eb-1ca6-0f843b90e1c8
# ╠═06a06ae8-36f6-11eb-1142-cdbadb8586a5
# ╠═09391c82-36f6-11eb-2a2a-3fd51aac6161
# ╠═0ba06c64-36f6-11eb-2c44-1b6f26f93e27
# ╠═10ddf4b4-36f6-11eb-1915-ada7cb3e3ff1
# ╠═14870e82-36f6-11eb-01b7-0be16908189c
# ╠═18189976-36f6-11eb-0963-fd18b2364876
# ╠═810693a8-3709-11eb-0017-1fc0037624ba
# ╠═b717b4d8-370c-11eb-393b-87966a8b8610
# ╟─2237d020-36f6-11eb-3c17-0797a2cb6f60
# ╟─6cf8532e-3a1f-11eb-0f52-51e45fc38fdd
# ╟─73353d74-3a1f-11eb-3ef6-9312cc9dac4e
# ╟─8653344c-3a1f-11eb-1336-fd31ab52608b
# ╟─2dfc4816-36f6-11eb-1bc4-dbcbf3c8e202
# ╟─45f8bdda-36f6-11eb-2f0a-3d024180181c
# ╟─62f43eac-36f6-11eb-050e-231fb14749ee
# ╟─d241f46e-36f6-11eb-26a0-bfa6594d86c5
# ╠═fae68c66-36f6-11eb-398f-d55cd6a43e69
# ╟─8caeb170-36f7-11eb-0fb3-a9867dcfbbd6
# ╟─12513bb8-36f8-11eb-3dcb-3d04bfa276fb
# ╟─1c94854e-36f8-11eb-1e7c-29d2107d1e8b
# ╟─78bc1e68-36f8-11eb-25a5-a9bfeb27e47a
# ╠═d82538e4-36f8-11eb-382b-99d69607c5bd
# ╟─34d2403c-36f9-11eb-18df-070a33a85f50
# ╟─51e3060c-36f9-11eb-3e58-ed966fae86f9
# ╟─850135c4-36f9-11eb-36f9-ff4d3cdef70e
# ╟─8ca2933e-36f9-11eb-2abc-8562e78f0368
# ╟─98c8665c-36f9-11eb-028e-b7e3f6976020
# ╟─b40ccd0e-36f9-11eb-20b6-c5172553bb40
# ╟─b762778a-36f9-11eb-1bf6-c11cc546f885
# ╟─cd881d42-36f9-11eb-29b6-5946097925fd
# ╟─8bb66648-36fa-11eb-0f49-8d36a7b1db3c
# ╟─90628ffa-36fa-11eb-0048-0bf783d2aac8
# ╟─e0c59bb6-36fa-11eb-2052-e372c91e0a51
# ╟─2d16befc-36fb-11eb-295a-b5a913b3bace
# ╟─0ccc59b8-36fb-11eb-30ec-d57f38dc2e0e
# ╟─4fbb3046-36fb-11eb-1505-8f9f4119691f
# ╟─7f327ab4-36fb-11eb-375f-ebd1b5f227f8
# ╟─97b177fc-36fb-11eb-3d82-fb3f358e055d
# ╟─af0b5ed6-36fb-11eb-29a4-4518b1a19106
# ╠═d744c2f4-36fb-11eb-28b1-9145ed3eb1dc
# ╟─01cb248a-36fc-11eb-375d-d9626a177d70
# ╟─33ef3314-36fc-11eb-12ba-2fa47b513148
# ╟─3972b04e-36fc-11eb-0161-d32cded73039
# ╟─5e31e056-36fc-11eb-0cdb-bb51ff471994
# ╠═9174258c-36fc-11eb-0b20-e5753283bee0
# ╟─db7adc8e-36fc-11eb-235b-0de9ab7dcb3c
# ╠═9848c89a-36fc-11eb-0ffc-ebbc25bb7078
# ╟─d9c458ae-36fc-11eb-3601-7d3283e1c523
# ╟─90907da8-3717-11eb-3f88-1dd144529c8d
# ╠═ac5c3306-3717-11eb-0923-a74c503dc696
# ╠═b368d424-3717-11eb-390c-69a54dd062ef
# ╟─07a34160-36fe-11eb-2900-b9649c4fe52a
# ╟─c631baa6-3700-11eb-2e3a-35beb8af035c
# ╟─e599f836-3700-11eb-3542-b9133c13b544
# ╟─119e1f34-3701-11eb-0f8d-79898a289430
# ╟─203c4cdc-3701-11eb-334e-9d25933ace39
# ╟─27503664-3701-11eb-3d34-6b72a1cbd047
# ╠═f50bff44-3d47-11eb-1393-abcc201fc3f5
# ╟─eacd8a16-3700-11eb-1db0-0be4473a3cb1
# ╠═fc118764-3700-11eb-082c-c1cd0d9eecc0
# ╟─65fac488-3701-11eb-2ff2-dd5dd774f34c
# ╟─8cebf71a-3701-11eb-03d8-778e0d3b3b03
# ╟─b1cccf64-3701-11eb-1409-43fe94b6653b
# ╟─0d36f5e6-3702-11eb-397b-3fe4788f4bdb
# ╟─4c67fd50-3702-11eb-1cb1-811852bc1086
# ╟─504b0606-3702-11eb-3829-955a89e5b0b8
# ╟─002851be-3703-11eb-32ed-dda0c57d4a8a
# ╟─04e8af78-3703-11eb-167f-0f35bbb80345
# ╟─2aef87d2-3703-11eb-3269-6d2d208f8c7d
# ╟─30d8965c-3703-11eb-1458-278f66a2150c
# ╠═a0109b68-3702-11eb-2058-c5a399fb1131
# ╟─424681a6-3703-11eb-068b-bf1bb934afe1
# ╠═e7c804e8-3702-11eb-1d53-ed9d4f7f6077
# ╟─f47ab08e-3702-11eb-2a90-891a570aa01e
# ╟─6b72e8a8-3703-11eb-391f-1972847fcbad
# ╟─70640432-3703-11eb-3e04-0990f6cc4c2c
# ╟─8bcb9db6-3703-11eb-0daa-995297c18428
# ╠═926820cc-3703-11eb-3c1d-494b30a2d8c5
# ╟─9ae2c0e8-3703-11eb-1693-bd47c2759747
# ╠═b9e84648-3703-11eb-01fe-272bb37e1b6d
# ╟─c200e6c0-3703-11eb-0fb4-cfb508d80b3a
# ╟─cb10175e-3703-11eb-2284-a5d027bf5aa2
# ╟─d8cb958a-3703-11eb-3a6e-75c555bac1d7
# ╠═de54c7a6-3703-11eb-08e9-0744de9a989e
# ╟─e4fa9cc8-3703-11eb-1810-b9f3fc53f25f
# ╠═53680da8-3704-11eb-1728-e520852ec39f
# ╟─5a914f9c-3704-11eb-0353-d30f71da1e57
# ╟─63e17cd4-3704-11eb-3e2a-ebc55f53fab2
# ╟─6f7932e4-3704-11eb-041e-29c7b08b8a7a
# ╠═73d63d02-3704-11eb-399f-7b0b14225256
# ╟─78866fbe-3704-11eb-2551-d3bc677f0797
# ╟─8abf605a-3704-11eb-328b-894afe2ae9a0
# ╟─9949a766-3704-11eb-3462-1378c4f63f1c
# ╟─a225e0de-3704-11eb-2e2a-df7bbba25709
# ╟─dc4d0c10-3704-11eb-0bbf-2d61dda1b34a
# ╠═14d4e74c-3705-11eb-046a-2d1cd4e4346f
# ╟─3d860c46-3705-11eb-32f5-ef0f6f7501c1
# ╟─46c22702-3706-11eb-3eb7-714a7b883b32
# ╟─caa317f0-3706-11eb-2468-4d20572f8cab
# ╟─768d6b24-3707-11eb-3ac6-a18e92bca3e5
# ╟─7d6e23e8-3707-11eb-2ad5-6dafc1caa33d
# ╟─d497aaa4-3707-11eb-2d06-a350549b8eb4
# ╠═adcb3940-3707-11eb-0ff7-e7ea04fb3e9a
# ╟─d373a45c-3707-11eb-2d7f-995e116f673f
# ╠═c99882ae-3707-11eb-3c80-7fd925fabd9e
# ╟─cdd73a36-3707-11eb-3dfe-4d1c79d336a7
# ╟─48f1c8e4-3708-11eb-12ba-0f200a780e98
# ╟─4d2e382a-3708-11eb-12b9-c7c641fc709e
# ╟─801e5488-3706-11eb-2acb-d5c87a546e9c
# ╟─b542b92c-3708-11eb-0931-b1d9aa7c5b39
# ╟─ab8e914e-3708-11eb-39e6-9744bdae85ef
# ╟─b36e2de8-3708-11eb-1da9-89325e13b1cc
# ╟─d82afc9c-3708-11eb-3a77-816d38c89220
# ╟─dd151816-3708-11eb-1ced-83123cf14c03
# ╟─f169a096-3708-11eb-1152-afe25a05f832
# ╟─4802516c-370b-11eb-0970-134c3511eb0b
# ╠═77fa3826-370b-11eb-0472-df3ec8c20a73
# ╟─558eec20-3709-11eb-213c-71c9d8ee7f50
# ╟─5a699902-3709-11eb-303a-fb37ad2dabd0
# ╟─7c3dcb54-3709-11eb-2586-19daa4fb1f3c
# ╟─ce60431a-3709-11eb-1f91-e1663dcbadde
# ╠═98c4a21e-3709-11eb-2e6a-95db481c30b9
# ╟─e8f56516-3709-11eb-114b-d9a587c6ec37
# ╠═8b54f994-3709-11eb-0b8a-ff66b3c1bec8
# ╠═a5566da0-3709-11eb-3956-037dd4e4e9a0
# ╟─256464ca-370a-11eb-09c4-b3883db912b9
# ╠═b350dd8c-3709-11eb-3b76-d15ccdf2f25b
# ╟─b78a9ef6-3709-11eb-006d-cf32800cd7c3
# ╟─7a479ab6-370a-11eb-07f5-67f005fbb3be
# ╟─96861054-370a-11eb-371a-6bc2070e9348
# ╟─9d2a7ee0-370a-11eb-3c3b-b13b5c93cf35
# ╟─b53d0ece-370a-11eb-038b-5f294a5d18e8
# ╟─f3e4dafa-370a-11eb-04be-45a0a4605470
# ╟─fc252a00-370a-11eb-2340-63a66e151bee
# ╟─050d0372-370b-11eb-2b94-db08ef368de3
# ╟─11e28052-370b-11eb-042a-8d372c3ce312
# ╠═087ef6ee-370b-11eb-3427-fb4ab4b6e196
# ╟─6bdcb2ba-370d-11eb-3c1e-41eb1891184f
# ╠═d991c17a-370c-11eb-1f1b-a78fd7067b1d
# ╠═cbe92cac-370c-11eb-093d-59d3d8549e8b
# ╟─106eed78-370b-11eb-1906-33dc4fa053f6
# ╟─24f7e19a-370c-11eb-11bf-63831004261a
# ╟─2a272450-370c-11eb-016c-c3a2496bdd93
# ╟─44772f30-370c-11eb-0d64-1bfd78f7897e
# ╟─7402e848-370c-11eb-38f2-13ab838bc54c
# ╟─7790324a-370c-11eb-3217-2328a2711918
# ╟─ae094866-3711-11eb-161a-fb55da325458
# ╟─ce522b1a-3711-11eb-125d-51fd29a0a38c
# ╟─d5ecab98-3711-11eb-3a18-ad802e9fc91e
# ╟─af74e12e-370c-11eb-3a0b-f7816ea50c1f
# ╟─ecb7109c-370d-11eb-1430-d3b8b73890e4
# ╟─fa90b218-370d-11eb-398e-f327ab6d758d
# ╟─fe49c00c-370d-11eb-08d2-879fff8e37eb
# ╟─7f0f9cba-370f-11eb-3be0-41bdeaf7bcec
# ╟─afb794ee-370f-11eb-0d3b-edec6939d06c
# ╟─bb42ae46-370f-11eb-0670-7b4f629e634c
# ╟─ce0dc71c-370f-11eb-3c27-87ddce4b0695
# ╟─f834a5ae-370f-11eb-3513-379b342f9312
# ╠═e1129d34-370f-11eb-3d4d-abfd0eea35de
# ╠═d6665918-370f-11eb-0cc7-d17e3612f1e2
# ╠═e9cad902-370f-11eb-1f27-39e683f7743f
# ╟─0c0a85e4-3710-11eb-0a7e-1d6681a57587
# ╠═ef6ad2b8-370f-11eb-1b07-9934e2498880
# ╟─1abf6a9e-3710-11eb-3c63-f527f4151f02
# ╟─338ba152-3710-11eb-26ac-4dcb33f918ba
# ╟─37910490-3710-11eb-37ab-a99e7390000c
# ╟─54d70b7c-3a43-11eb-3003-0daccb9bfe1c
# ╟─7b53c894-3a43-11eb-1860-dbbd67f1bf65
# ╟─8328fb20-3a43-11eb-0ab4-7d294e220571
# ╟─bde0420a-3a43-11eb-22eb-e1f5f07581fd
# ╟─c4d27f60-3a43-11eb-3583-e92668eac55b
# ╟─d06001b8-3a43-11eb-34ef-237582c9560f
# ╟─188aaf04-3a44-11eb-2355-8badeebe03c5
# ╠═248de946-3a44-11eb-3495-55f80c020b86
# ╟─3bec0bde-3a44-11eb-3b05-abedf13626c2
# ╟─33c8f35c-3d2f-11eb-22e7-29ac5cdce932
# ╟─5d529d2e-3a44-11eb-27bf-874ab138e8c3
# ╟─856a681e-3a44-11eb-0bd5-29187dc947d9
# ╠═58ff0dd8-3a45-11eb-3ec2-fd1cf1bd530e
# ╟─bd047c46-3a45-11eb-0f79-6919d788415f
# ╠═c9d70bf0-3a45-11eb-3c7b-e355f842034a
# ╟─eb3beb58-3a45-11eb-3cb7-213b81743e3e
# ╟─577726d4-3d2f-11eb-1507-4b15fb41b2e1
# ╟─fae97bec-3a45-11eb-39bc-d74c00a9f8fc
# ╟─546d5ada-3a46-11eb-3efc-595445604af3
# ╟─60035d5e-3a46-11eb-0195-53ae917f37ec
# ╟─a5aa6f64-3a46-11eb-18e0-87044af3564e
# ╟─6c743c02-3a46-11eb-3e4e-eb547f436ff2
# ╟─abaedfa8-3d34-11eb-05b3-a18d8c9ffbb9
# ╟─eae2a17c-3d30-11eb-2ff8-7fd6b9245a70
# ╟─f2a9df92-3d30-11eb-299b-73b8b77a9dfb
# ╟─7781ca9c-3d34-11eb-0f48-41ea05729c9b
# ╟─91ae68ea-3d33-11eb-23bc-4d059317b03a
# ╟─98328c46-3d33-11eb-159b-4fb5c10a5add
# ╟─d9c95c2a-3d38-11eb-1b3e-5f4d42cec1d9
# ╟─0a762102-3d37-11eb-2bf8-6bad28a60070
# ╟─12a34ada-3d37-11eb-2ca4-999c72d3ddbd
# ╟─423cfeda-3d37-11eb-1e4c-7b6734537c5d
# ╟─7ed65014-3d37-11eb-0835-1b1a04233f31
# ╠═493728d2-3d37-11eb-3b52-91ca8e6219c2
# ╟─c2684cc6-3d38-11eb-3dfd-7b4fb45598bf
# ╠═67b9c642-3d38-11eb-0ddc-21068c612777
# ╟─04a78746-3d39-11eb-0cf5-43b3fc90ee00
# ╟─0ae090bc-3d39-11eb-141b-77b9a1ffedbd
# ╟─616d86a0-3d3a-11eb-275b-c7fe62267917
# ╟─137a7742-3d39-11eb-18e3-313145b46794
# ╟─7049bb5e-3d39-11eb-2959-bf85df712475
# ╟─731c8de8-3d39-11eb-3435-0befdcc2172e
# ╟─7de19462-3d39-11eb-2bc3-31a9e711f8e8
# ╟─805e458a-3d39-11eb-3c95-a3b5668d8ae2
# ╟─855a41e4-3d39-11eb-059c-234c54038b2e
# ╠═e2bb8ee2-3d39-11eb-3648-0d5135ceb5af
# ╠═f6e95d38-3d39-11eb-13d8-af79d7b6ceac
# ╟─fda46f80-3d39-11eb-0119-977392fdd249
# ╟─036f3d0a-3d3a-11eb-02e8-378681e506c0
# ╟─418d27c8-3d3a-11eb-1275-57a7f91761ba
# ╟─47112314-3d3a-11eb-0d2d-296776715d0f
# ╟─6ae85bce-3d3a-11eb-1499-99a11fb8d249
# ╟─717878d4-3d3a-11eb-18ab-6ffce1b06775
# ╟─82150204-3d3a-11eb-0905-21b6a1136791
# ╟─9312a0aa-3d3a-11eb-27a9-8bd579b1a33e
# ╟─a90b5e74-3d3a-11eb-3317-0b4f6ab20faf
# ╟─b03d68ae-3d3a-11eb-3f61-31a66d3c0748
# ╠═c421c4b4-3d3a-11eb-3096-bbb549d70c54
# ╠═d70c40fe-3d3a-11eb-04cc-c7ea40e8753f
# ╟─e78be65a-3d3a-11eb-2bb5-7364c6e5267a
# ╟─effff060-3d3a-11eb-0dd3-31e5a0b71a2e
# ╟─048cd988-3d3b-11eb-352a-a55a50eca0df
# ╠═6a49c8c8-3d3b-11eb-3237-59335f117004
# ╟─9db4143e-3d3b-11eb-0c03-39528d9481f0
# ╟─e899391a-3d3c-11eb-09ef-dd4ab4617a6b
# ╟─ecd3a7fe-3d3c-11eb-2c48-17cceadd34c8
# ╟─3a7836a0-3d3d-11eb-0089-cdf24a4709ca
# ╟─a0d26960-3d3e-11eb-09a9-ebdee0fda513
# ╟─a51afb0e-3d3e-11eb-3855-e59dfc25158c
# ╟─1f5745be-3d3d-11eb-051d-9f47e42a1f18
# ╟─3e6dfe20-3707-11eb-08d6-e5f9cc14d066
# ╟─8528bd42-3710-11eb-37da-c3e52d24aab5
# ╟─eefd4882-3710-11eb-3c64-2320e6250a5d
# ╟─a74aef8a-3710-11eb-3a62-c1d38227cbb8
# ╟─e75d700c-3710-11eb-3e4c-4bfc27b3f2dc
# ╟─013d047e-3711-11eb-074e-6b655372aefb
# ╟─1973bb44-3711-11eb-3861-ff2da04b82c2
# ╟─5ed15f7c-3711-11eb-21ae-e5bf7948580e
# ╠═20be3a48-3711-11eb-2b3e-df6e84409c41
# ╠═4109574a-3711-11eb-35a2-617d2aca0a6c
# ╟─91aec25e-3711-11eb-235f-854cd229ffe0
# ╠═4f5277a2-3711-11eb-3ae4-2fd82903e6d1
# ╟─7172584c-3712-11eb-20bc-655aac5521ed
# ╟─925ec81a-3712-11eb-100c-7ff43510f491
# ╟─99481bb8-3712-11eb-1428-8ff4abc690aa
# ╟─7a06e5bc-370e-11eb-1a25-0f24022f2bf4
# ╟─80976eba-370e-11eb-3e93-ef3cff0c1dc4
# ╟─8a84fb54-370e-11eb-165f-05c3928a4433
# ╟─8d526092-370e-11eb-2e16-b93a00c77a04
# ╟─f608899a-370e-11eb-36de-6f5f92a7ddc4
# ╟─0fb6a432-370f-11eb-0058-63bcc88c0d9b
# ╟─0326f6f8-3713-11eb-104f-9b1125b064e3
# ╟─11e873ce-3713-11eb-1c49-47e9dcdf059e
# ╟─3a758bec-3713-11eb-125a-9339a69ce002
# ╠═ef6eb6ca-3712-11eb-1892-d72641ee1ad4
# ╟─4663e174-3713-11eb-0aa9-c1e4c9c05858
# ╠═d37664de-3712-11eb-36ee-67afa6f56038
# ╟─4f249d9e-3713-11eb-093a-5b919c6fae8a
# ╟─19c214b0-3a24-11eb-39c7-59b2b107213a
# ╟─65d05abe-3a20-11eb-2b87-0983fdcd21da
# ╠═b4a0181c-3a20-11eb-0279-a9485ee19cdb
# ╟─c1d28c58-3a23-11eb-0663-6de0df4260fd
# ╠═d54bd9bc-3a23-11eb-14d9-db2189078043
# ╠═fb3ea47c-3a23-11eb-3861-61812062772c
# ╟─2ce95940-3a24-11eb-32c0-4fc73eed1578
# ╟─47a01ff0-3a24-11eb-1b83-375efc61008a
# ╟─803d768a-3a24-11eb-0dfd-277d10090757
# ╟─513e97ec-3a24-11eb-3c92-55ef232241da
# ╟─8fdaae50-3a24-11eb-005f-1914bc86d2b2
# ╟─ad94a69e-3a24-11eb-1b7f-75b163fb9e5d
# ╟─b7afd784-3a24-11eb-0d48-137a5f67c4a2
# ╟─dc9e726c-3a24-11eb-1fff-5f70b33bde81
# ╟─6fb82764-3708-11eb-0da7-7502291a3e43
# ╟─74f823c0-3708-11eb-13d2-1dc1fe48d298
# ╟─bcd61c60-38ac-11eb-1034-1750af1da4c6
# ╟─c8f060d6-3713-11eb-3daf-4de23d405ef0
# ╟─13c14a76-3714-11eb-3512-a9a76dbb13c4
# ╟─ee3bbe68-3714-11eb-37c9-45303610ac14
# ╟─43e94284-3715-11eb-3429-75a8a2e0f4cc
# ╟─17bc9576-3715-11eb-247d-eb40f752c815
