### A Pluto.jl notebook ###
# v0.12.11

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

# ╔═╡ 779709d6-080f-11eb-2514-bf188e49d4f7
using Pkg

# ╔═╡ 89aa39d4-080f-11eb-2729-1b61609f2e3d
using Plots

# ╔═╡ 9269b77a-080f-11eb-086e-c56e50088cc5
using PlutoUI

# ╔═╡ b1f9b602-23db-11eb-00e8-9779dc9fc4fa
using LinearAlgebra

# ╔═╡ 5875e11c-080f-11eb-375e-af85d85c552d
md"# COMPLEX NUMBERS"

# ╔═╡ 47d1aa9e-2112-11eb-18c4-dd3bee4d36ec
md"The complex numbers, $\mathbb{ C }$, extends our number system allowing for a rich framework in which to investigate physical phenomena. This extension follows from the sets denoted in __Equation 1__."

# ╔═╡ f2c680ec-2119-11eb-2e52-21b52a798680
md"__Equation 1__"

# ╔═╡ 9f8ffaf6-2112-11eb-16ff-e37fa35393b7
md"$\mathbb{ N } \subset \mathbb{ Z } \subset \mathbb{ Q } \subset \mathbb{ R } \subset \mathbb{ C }$"

# ╔═╡ 7204595e-080f-11eb-070b-9ba219eb2c22
md"## Setup"

# ╔═╡ 1a2d1de8-2113-11eb-081f-9fd0ede31cd3
md"The environment for this Pluto notebook exists in the folder listed below. We activate the environment using the `activate` function in the `Pkg` package manager."

# ╔═╡ 5918011c-2113-11eb-1db7-4dba9a23e9ae
file = "/Users/juan/Documents/Julia/Projects/MathematicsForPhysics/Project.toml"

# ╔═╡ 7b8f85e8-080f-11eb-3147-41aa21e2ebda
Pkg.activate(file)

# ╔═╡ 62378cea-2113-11eb-167a-5b5cf0181054
md"We also use the Plots (with a Plotly backend), the PlotUI, and the LinearAlgebra packages in this notebook."

# ╔═╡ ba714d9a-2354-11eb-0d76-117d96b9430c
plotly()

# ╔═╡ c92030fa-080f-11eb-2ffa-533c718a37a8
md"## The imaginary number"

# ╔═╡ b755d36c-2113-11eb-0867-fbcb9471c8dd
md"The imaginary number $i$ has the value as shown in __Equation 2__."

# ╔═╡ e7a9e85c-2119-11eb-02e7-2d0167026928
md"__Equation 2__"

# ╔═╡ cace9528-2113-11eb-06cf-5b1dc7e3a357
md"$i^{ 2 } = - 1$"

# ╔═╡ da5466f8-2113-11eb-1d45-53bc19ffe196
md"In Julia, the imaginary number is expressed using the `im` keyword."

# ╔═╡ 95caa302-080f-11eb-1fbf-23f03c7f8f4e
im

# ╔═╡ 05e6fc18-2114-11eb-1abf-490461565625
md"When using `im` in a calculation, the result is expressed in the form of __Equation 3__, which we will see in the next section."

# ╔═╡ 0159e226-2114-11eb-0b3d-3bf024c60cf2
im^2

# ╔═╡ 1f09eb6e-0810-11eb-1d9f-a56b6dfc0061
md"## Complex numbers"

# ╔═╡ 2d7e77f0-0810-11eb-12f2-97c4321d091c
md"A complex number is written as in __Equation 3__. The alternative form is more intuitive when we use the complex plane later in this notebook."

# ╔═╡ d453b5a0-2119-11eb-186f-55c2cdb1306c
md"__Equation 3__"

# ╔═╡ 3dd26828-0810-11eb-1cba-7970f2cebdc7
md"$\begin{align} &z = a + b i \\ &z = x + iy \text{ (common alternative)} \end{align}$"

# ╔═╡ 48df2f26-0810-11eb-0ba6-bf6840db1152
md"Here $a$ is the _real part_ and $b$ is the _imaginary part_, with both $a , b \in \mathbb{ R }$. The real part of a complex number is written as $\text{Re} \left( z \right)$ and the imaginary part as $\text{Im} \left( z \right)$."

# ╔═╡ 533ffbd2-27ce-11eb-030b-a30b48fe4c15
md"We can also view a complex number as a pair of real numbers. In this way, we have $z = \left( a , b \right)$."

# ╔═╡ 5d7c2704-0810-11eb-1f9e-8b6ec957103e
md"Below, we create a complex number and use the `real` and `imag` functions to find its real and imaginary values. First though, we create two sliders to hold (integer) values for the computer variables `a` and `b`, both in the range $\left[ - 5 , 5 \right]$, using the PlutoUI macro interface."

# ╔═╡ de64da9c-2114-11eb-1e14-85e18deb6351
@bind a Slider(-5:5)

# ╔═╡ ed048df4-2114-11eb-1d2d-03e436cb3a74
@bind b Slider(-5:5)

# ╔═╡ 0317d006-2115-11eb-0ea4-8ba5a96c56e8
md"Moving the sliders produces the appropriate values for $a$ and $b$."

# ╔═╡ de60878a-080f-11eb-0cac-91414531052a
z1 = a + b * im

# ╔═╡ 12eaf346-0810-11eb-1872-5510a5f5a31e
real(z1)

# ╔═╡ 151c606e-0810-11eb-12f0-4dc99bb74ef6
imag(z1)

# ╔═╡ aa41729e-241a-11eb-3391-f56605b74ddb
md"The `reim` function returns a tuple containg the real and imaginary parts of a complex number."

# ╔═╡ a1cac854-241a-11eb-3fa0-d565020329bc
reim(z1)

# ╔═╡ 79e1c6ce-0810-11eb-2e42-a1894a4dc658
md"We add a second complex number, $z_2$ and add it to $z_1$ in __Equation 4__. The real parts add and so do the imaginary parts."

# ╔═╡ 49cd46f4-2115-11eb-03c5-fd694dd5d19d
md"__Equation 4__"

# ╔═╡ c052ed66-0810-11eb-2461-d7bef5433777
md"$\begin{align} &{ z }_{ 1 } = { x }_{ 1 } + i { y }_{ 1 } \\ &{ z }_{ 2 } = { x }_{ 2 } + i { y }_{ 2 } \\ &z_{ 1 } + z_{ 2 } = { x }_{ 1 } + i { y }_{ 1 } + { x }_{ 2 } + i { y }_{ 2 } \\ &{ z }_{ 1 } + { z }_{ 2 } = \left( { x }_{ 1 } + { x }_{ 2 } \right) + i \left( { y }_{ 1 } + { y }_{ 2 } \right) \text{ (group real and imaginary parts)} \end{align}$"

# ╔═╡ f8744e86-2360-11eb-211d-6dc5f3286893
md"If we used the notation $z_{ 1 } = \left( x_{ 1 } , y_{ 1 } \right)$ and $z_{ 2
} = \left( x_{ 2 } , y_{ 2 } \right)$, then we would have $z_{ 1 } + z_{ 2 } = \left( x_{ 1 } + x_{ 2 } , y_{ 1 } + y_{ 2 } \right)$."

# ╔═╡ 471b5b58-2361-11eb-2437-19b45197af6a
md"Below, we create another complex number, $z_{ 2 } = 3 - 3 i$, and add it to the current value of $z_{ 1 }$."

# ╔═╡ bb6940f0-2378-11eb-0369-b50bb4ea4211
z1

# ╔═╡ f877f194-080f-11eb-2793-336f09c5eb76
z2 = 3-3im

# ╔═╡ fce350ac-080f-11eb-1533-ab1b6209d9cb
z1 + z2

# ╔═╡ 12bc8cf2-0812-11eb-3345-610b62856ce1
md"### Multiplication"

# ╔═╡ 000b06f8-0810-11eb-2874-c745ba1bc512
md"Multiplication of two complex numbers is shown in __Equation 5__."

# ╔═╡ bfd38a60-2119-11eb-0488-f7453efa43ca
md"__Equation 5__"

# ╔═╡ 307e92fe-0811-11eb-11e6-5f13b941e4e8
md"$\begin{align} &{ z }_{ 1 } { z }_{ 2 } = \left( x_{ 1 } + i y_{ 1 } \right) \left( x_{ 2 } + i y_{ 2 } \right) \\ &z_{ 1 } z_{ 2 } = x_{ 1 } x_{ 2 } + i x_{ 1 } y_{ 2 } + i x_{ 2 } y_{ 1 } +i^{ 2 } y_{ 1 } y_{ 2 } \\ &{ z }_{ 1 } { z }_{ 2 } = { x }_{ 1 } { x }_{ 2 } - { y }_{ 1 } { y }_{ 2 } + i \left( { x }_{ 1 } { y }_{ 2 } + { x }_{ 2 } { y }_{ 1 } \right) \text{ (grouping)} \end{align}$"

# ╔═╡ 5e637a50-2361-11eb-3364-89e469213200
md"In terms of our alternate notation, this would be $z_{ 1 } z_{ 2 } = \left( { x }_{ 1 } { x }_{ 2 }  - { y }_{ 1 } { y }_{ 2 } , { x }_{ 1 } { y }_{ 2 } + { x }_{ 2 } { y }_{ 1 } \right)$."

# ╔═╡ 7c7b4112-2115-11eb-1d2f-310cb359a316
md"In __Example 1__, we create two new complex numbers and verify the results of our calculation using code."

# ╔═╡ 9b3f9eb8-2115-11eb-1e6a-ebf3cdc9fbf8
md"__Example 1__"

# ╔═╡ eb722828-2378-11eb-373d-61f66135913e
md"Multiply $z_{ 3 } = 2 + 3 i$ and $z_{ 4 } = -2 - i$."

# ╔═╡ bb129380-2115-11eb-14ae-37160b69391a
md"$\begin{align}&z_{ 3 } \times z_{ 4 } = \left( 2 + 3 i \right) \left( -2 - i \right) \\ &z_{ 3 } z_{ 4 } = -4 - 2 i - 6 i - 3 i^{ 2 } \\ &z_{ 3 } z_{ 4 } = -4 - 8 i - 3 \left( - 1 \right) \\ &z_{ 3 } z_{ 4 } = - 1 - 8 i \end{align}$"

# ╔═╡ 30e60daa-241b-11eb-13fe-7dc84e7ac80e
md"Now, we use Julia to verify our result."

# ╔═╡ 3ffe15ec-2116-11eb-1eb9-73b0fa23a1b9
z3 = 2 + 3 * im

# ╔═╡ fb522bc6-0811-11eb-0268-6f5341dc5b6a
z4 = -2 - im

# ╔═╡ 9cbbba3c-2116-11eb-3391-bb1e3aa219a6
z3 * z4

# ╔═╡ 091e7840-0812-11eb-2321-0502dd0ff199
md"### Complex conjugate"

# ╔═╡ 26613fa0-0812-11eb-28d1-61defedc57fa
md"The __complex conjuagte__, $\bar{ z }$, of a complex number, $z$, is defined in __Equation 6__."

# ╔═╡ 9c61a6ce-211a-11eb-1dcf-2391a2932d4d
md"__Equation 6__"

# ╔═╡ 334287f6-0812-11eb-2913-c1dd4d8d55e2
md"$\text{If } z = x + i y \text{ then } \bar{z} = x - i y$"

# ╔═╡ 4be525b4-241b-11eb-2a82-f3db68189ba2
md"We simply take the additive inverse of the imaginary part of the complex number."

# ╔═╡ 8c592532-0812-11eb-3a68-e59dd173abfa
md"The `conj` function return the complex conjugate."

# ╔═╡ db4fdef4-2116-11eb-0c24-e3d45a26a181
z4

# ╔═╡ 83b89ffe-0812-11eb-22cf-cde44d1e7366
conj(z4)

# ╔═╡ fefc292e-0812-11eb-20c3-3f3ea9e1eec4
md"The product of a complex number, $z = x + i y$, and its complex conjugate, $\bar{ z } = x - i y$, is shown in __Equation 7__."

# ╔═╡ a6dae5c8-2119-11eb-0390-27fd43009b09
md"__Equation 7__"

# ╔═╡ 0c1bd1b8-0813-11eb-2384-814ca89a9f43
md"$\begin{align} &z \bar{z} = \left( x + i y \right) \left( x - i y \right) \\& z \bar{ z } = x^{ 2 } - i x y + i x y - i^{ 2 } y^{ 2 } \\ &z \bar{ z } = { x }^{ 2 } + { y }^{ 2 } \text{ (cancellation and simplification)} \\ &z \bar{ z } \in \mathbb{ R } \end{align}$"

# ╔═╡ 8c8f8b74-2379-11eb-3463-b79d5ae842ea
md"__Example 2__"

# ╔═╡ 9d3c0ede-2379-11eb-0dcf-6ff49b0844d8
md"Calculate $z_{ 4 } \bar{ z }_{ 4 }$."

# ╔═╡ af255bdc-2379-11eb-117f-21a1b79a5e6e
md"$\begin{align} &z_{ 4 } \bar{ z }_{ 4 } = \left( -2 - i \right) \left( - 2 + i \right) \\ &z_{ 4 } \bar{ z}_{ 4 } = 4 - 2 i + 2 i - i^{ 2 } \\ &z_{ 4 } \bar{ z }_{ 4 } = 4 - \left( - 1 \right) = 5 \end{align}$"

# ╔═╡ 46e1e06c-0813-11eb-10df-bbe8c050f530
md"We verify our result using code."

# ╔═╡ f7951598-2116-11eb-242a-0daedde007c5
z4 * conj(z4)

# ╔═╡ 4023cf34-2117-11eb-386c-fbf8630e211b
md"With the imaginary part being $0$, $\text{Im} \left( z_{ 4 } \right) = 0$, we have a real number. We can now see that $\mathbb{ R } \subset \mathbb{ C }$."

# ╔═╡ 9a8398d8-0812-11eb-0a33-0d4ca7a8ebd6
md"### Division"

# ╔═╡ ad1aa746-0812-11eb-27b2-711772f8a9c5
md"Division of complex number is defined in __Equation 9__."

# ╔═╡ b7698f66-0812-11eb-1af5-9d02410c52fb
md"__Equation 9__"

# ╔═╡ 8279a016-2117-11eb-2e5e-9fca571a55eb
md"$\begin{align} &\frac{ { z }_{ 1 } }{ { z }_{ 2 } } = \frac{ { z }_{ 1 } }{ { z }_{ 2 } } \cdot \frac{ { \bar{ z } }_{ 2 } }{ { \bar{ z } }_{ 2 } }, z_{ 2 } \ne 0 + 0 i \\ &\frac{ { z }_{ 1 } }{ { z }_{ 2 } } = \frac{ x_{ 1 } + i y_{ 1 } }{ x_{ 2 } + i y_{ 2 } } \cdot \frac{ x_{ 2 } - i y_{ 2 } }{ x_{ 2 } - i y_{ 2 } } \\ &\frac{ { z }_{ 1 } }{ { z }_{ 2 } } = \frac{ x_{ 1 } x_{ 2 } + y_{ 2 } y_{ 2 } + i \left( x_{ 2 } y_{ 1 } - x_{ 1 } y_{ 2 } \right) }{ x_{2 }^{ 2 } + y_{ 2 }^{ 2 } }  \end{align}$"

# ╔═╡ 3b1e6786-237b-11eb-12ef-1109369e12f1
md"__Example 3__"

# ╔═╡ 598975e0-0813-11eb-2b7f-23ba2c6ecfde
md"Calculate the division of ${ z }_{ 5 } = 3 + 4 i$ by ${ z }_{ 6 } = 3 - 3 i$."

# ╔═╡ 774b911c-0813-11eb-27cd-47743e3d1f5c
md"$\begin{align} &\frac{ { z }_{ 5 } }{ { z }_{ 6 } } = \frac{ 3 + 4 i }{ 3 - 3 i } \cdot \frac{ 3 + 3 i }{ 3 + 3 i } \\ &\frac{ { z }_{ 5 } }{ { z }_{ 6 } } = \frac{ 9 + 9i + 12 i - 12 }{ 9 + 9 } \\ &\frac{ { z }_{ 5 } }{ { z }_{ 6 } } = \frac{ - 3 + 21 i }{ 18 } \end{align}$"

# ╔═╡ 89e69352-237b-11eb-080e-750fb513d927
md"Let's verify our result."

# ╔═╡ c100f83e-2117-11eb-1cb3-093e187cfa89
z5 = 3 + 4 * im

# ╔═╡ c8991090-2117-11eb-2eb6-e70d386094cd
z6 = 3 - 3 * im

# ╔═╡ 0dfffd98-0814-11eb-3b02-ebd555daf050
z5 / z6

# ╔═╡ abc628b6-237b-11eb-0321-efe0765bc388
md"This is the same as the solution."

# ╔═╡ 9f461808-237b-11eb-1e2f-713d90955ce0
(-3 + 21 * im)/ 18

# ╔═╡ 987db362-0816-11eb-2801-491343f11e4f
md"## Argand diagram"

# ╔═╡ 9db23db2-0816-11eb-2e72-ef10f878f295
md"A complex number is a point on a plane, called the __Argand diagram__."

# ╔═╡ dfb83d0a-2117-11eb-14eb-d1736ddef6d1
md"The Argand diagram or _complex plane_ has two perpendicular axes. The horizontal axis is denoted the _real axis_ and the vertical axis is denoted the _imaginary axis_."

# ╔═╡ 002ec5f6-2118-11eb-1619-b97d8d29c51e
md"Any complex number can be plotted on the Argand diagram as a point in the complex plane according to the values of it real and imaginary parts."

# ╔═╡ 06b74196-2364-11eb-2d80-5997606efb8a
md"In __Fig 1__, we see a representation of an Argand diagram with a real and an imaginary axis. The complex numbers $z = 1 + i = \left( 1 , 1 \right)$ and $z = 2 - i = \left( 2 , - 1 \right)$ is shown as a blue markers. We can also view these two complex numbers as (complex) vectors and consider their lengths as well as the angles they make with the positive real axis, using the Pythagorean theorem and the trigonometry of right triangles."

# ╔═╡ bd7ffaec-2361-11eb-352c-79e84e4b838f
begin
	x0 = [1, 2]
	y0 = [1, -1]
	plot(x0, y0, seriestype = :scatter, xlims = (-3, 3), ylims = (-3, 3), title = "Fig 1 Argand diagram", label = "complex numbers", showaxis = false)
	plot!([(-3, 0), (3, 0)], label = "real axis")
	plot!([(0, -3), (0, 3)], label = "imaginary axis")
	plot!([(0, 0), (1, 1)], label = "vector (1,1)")
	plot!([(0, 0), (2, -1)], label = "vector (2,-1)")
end

# ╔═╡ 50e8d6d2-0814-11eb-10f1-19f8082ee113
md"## Magnitude of a complex number"

# ╔═╡ bae5c6c6-0814-11eb-304d-5dbbe8c8cd8c
md"This is also known as the _modulus_ of a complex number. It is defined in __Equation 10__ and follows from the Pythagorean theorem."

# ╔═╡ c293f17c-241b-11eb-02de-e1587cf7c885
md"__Equation 10__"

# ╔═╡ c8377568-0814-11eb-3735-91ddfc6c9b63
md"$\left| z \right| = + \sqrt{ { x }^{ 2 } + { y }^{ 2 } } = + \sqrt{ z \bar{ z } }$"

# ╔═╡ d72cc3ac-237b-11eb-29cd-f703999dbe41
md"__Example 4__"

# ╔═╡ 2f6f93a0-0815-11eb-3ae0-879e54a304f2
md"Calculate the modulus of $z_{ 5 } =  3 + 4 i$."

# ╔═╡ fb4503e4-237b-11eb-31aa-dd10671bf55a
md"$\left| z_{ 5 } \right| = \sqrt{ 3^{ 2 } + 4^{ 4 } } = + \sqrt{ 25 } = 5$"

# ╔═╡ 528234c4-237c-11eb-333d-cbadf4d0cc44
md"We can verify this using both of the forms in __Equation 10__."

# ╔═╡ 0c3ecfd6-0815-11eb-23cc-e59e2acc127b
sqrt(real(z5)^2 + imag(z5)^2)

# ╔═╡ 55f76e64-2118-11eb-3bc7-3f7f56755418
sqrt(z5 * conj(z5))

# ╔═╡ 0adcae86-2121-11eb-0536-e90acc24da14
md"The `abs` function returns the modulus of a complex numbers."

# ╔═╡ 201d48aa-2121-11eb-22f4-1141493bfda8
abs(z5)

# ╔═╡ 90bd5f2c-2118-11eb-075b-370bf5360767
md"From __Equation 10__ it should be clear that the complex modulus is the length of a vector drawn from the origin of the complex plane to the point in the plane represented by the complex number, i.e. the length of the hypoteneuse. This follows from the Pythagorean theorem."

# ╔═╡ 4022102e-0815-11eb-1ebc-2315d2fac4a5
md"## Argument of a complex number"

# ╔═╡ c579237a-0815-11eb-3918-5746487895ba
md"The __principal argument__, $\theta$, of a complex number, $z = x + i y$, is defined in __Equation 11__ and it follows from trigonometry."

# ╔═╡ 02eac800-2119-11eb-1c62-4998e986c114
md"__Equation 11__"

# ╔═╡ d566ea42-0815-11eb-3371-2d8412317e65
md"$\theta = \arctan{ \frac{ y }{ x } }$"

# ╔═╡ 0911fcb6-2359-11eb-25fa-2f6c3d883eb5
md"We see a graph of the arctangent function in __Fig 2__."

# ╔═╡ 2805d82a-2354-11eb-3c73-5d96f8232478
begin
	x = collect(range(-6, 6, length = 201))
	y = atan.(x)
	plot(x, y, label = "arctangent function", title = "Fig 2 Arctangent function", xlabel = "real axis", ylabel = "imaginary axis")
end

# ╔═╡ 015a3ba4-237d-11eb-2a29-6727a68c4e01
md"__Example 5__"

# ╔═╡ 6b3ef4e2-0816-11eb-04e9-5d2628ba015a
md"Calculate the principal argument of $z_{ 7 } = 1 + \sqrt{ 3 }$ (in degrees using the `rad2deg` function)."

# ╔═╡ 15c448a0-237d-11eb-275d-eb40aed5ed69
md"$\theta = \arctan{ \frac{ \sqrt{ 3 }}{ 1 } }$"

# ╔═╡ 0b8114be-241c-11eb-16d5-d95a74e4ff07
md"$\theta = 60^{ 0 }$"

# ╔═╡ 2140f53c-241c-11eb-3673-2d2572d1e02a
md"Let's verify this."

# ╔═╡ 53cbbfa6-2119-11eb-289e-99920c357f31
z7 = 1 + sqrt(3) * im

# ╔═╡ 49419468-0815-11eb-129c-d9e85501505a
rad2deg(atan(imag(z7) / real(z7)))

# ╔═╡ 700b11ce-2119-11eb-3a02-29b782f3f255
md"With the round-off error, the solution is ${ 60 }^{ o }$."

# ╔═╡ f82c0962-2120-11eb-2406-0b72dc0c2791
md"The `angle` function returns the same value."

# ╔═╡ ea1addc6-2120-11eb-26ca-ad6b9c879f58
rad2deg(angle(z7))

# ╔═╡ 3f735628-219f-11eb-2b36-631692509fc0
md"The `round` function will round the solution off to the nearest integer in this case."

# ╔═╡ 3308a0e4-219f-11eb-3826-6b4c9b57a070
round(rad2deg(angle(z7)))

# ╔═╡ df875dc6-2355-11eb-16b5-3f9ce65f7464
md"Let's consider the argumant of a complex number in the four quadrants of the Argand diagram."

# ╔═╡ 092a1cae-2356-11eb-274a-7324b8b7af62
md"We start with $z = 1 + i$."

# ╔═╡ 1c34e2de-2356-11eb-20fc-516e16336e1c
rad2deg(angle(1 + im))

# ╔═╡ 41de2f7c-2356-11eb-25e6-b55954faa64f
md"It is $45^{ o }$ as expected. Now we consider $z = - 1 + i$."

# ╔═╡ 4e8cf1c2-2356-11eb-1217-751c94fa199b
rad2deg(angle(-1 + im))

# ╔═╡ 65199f9e-2356-11eb-2d25-231560b2b430
md"The angle between the positive real axis and the complex vector is $135^{ o }$. Now, for quadrant three with $z = - 1 - i$."

# ╔═╡ 888df394-2356-11eb-3b32-cdad1d29c3de
rad2deg(angle(-1 - im))

# ╔═╡ 8dbeeee2-2356-11eb-0cf7-c39a48e7d6c1
md"We note an angle of $- 135^{ o }$. This is the angle from the positive real axis, going clock-wise to the complex vector. Lastly, we consider a complex number in the fourth quadrant, $z = 1 - i$."

# ╔═╡ b4dac396-2356-11eb-1b0d-ef9253ae770d
rad2deg(angle(1 - im))

# ╔═╡ d28d2f48-2356-11eb-0c49-abd17c2e4428
md"The angle, going clockwise, is $- 45^{ o }$."

# ╔═╡ dad9c668-2357-11eb-0511-5beb70514c0e
md"For the argument of a complex number, we need not stop at the full circle $2 \pi$. We can view the complex number $z = 1 + i$, with a principal argument of $45^{ o } \left( \frac{ \pi }{ 4 } \text{ rad} \right)$ or add $2 \pi k$ radians to it, where $k = \mathbb{ Z }^{ + }$. With $k = 1$, we have $405^{ o } \left( \frac{ 9 \pi }{ 4 } \text{ rad} \right)$."

# ╔═╡ c4cde596-2359-11eb-3993-e3b004598eba
md"The tangent of $\frac{ \pi }{ 4 } + 2 \pi = \frac{ 9 \pi }{ 4 } \text{ rad}$ is $1$ (for the same $z = 1 + i$)."

# ╔═╡ 2e5b5058-2359-11eb-0c14-c33622fd6f95
round(tan(9π/4))

# ╔═╡ f3c68d94-2359-11eb-09c4-115cc05ea45a
md"As we see below, it is the same $z = 1 + i$."

# ╔═╡ 3e136a08-2359-11eb-20e1-ad45247c8bc6
rad2deg(atan(1))

# ╔═╡ 32ea1308-211b-11eb-0609-c927629fddc1
md"## Euler's equation"

# ╔═╡ 434b7f8e-211b-11eb-1d79-d145a543ff21
md"From the Argand diagram, and using right-angle tringle trigonometry, we can easily derive __Equation 12__, where $\theta$ is the angle between the positive real axis and the vector representing the complex number (for simplification, we only consider the first quadrant here)."

# ╔═╡ 5a538468-211b-11eb-2e40-731ca94282a3
md"__Equation 12__"

# ╔═╡ 61f1d062-211b-11eb-2d6b-5ba00a82b140
md"$\begin{align} &\cos{ \theta } = \frac{ x }{ r } \rightarrow x = r \cos{ \theta } \\ & \sin{ \theta } = \frac{ y }{ r } \rightarrow y = y = r \sin{ \theta } \\ &r = + \sqrt{ x^{ 2 } + y^{ 2 } } \end{align}$"

# ╔═╡ 44345760-211c-11eb-2894-2d76a6e59b7d
md"Here $r$ is the modulus (lenghth) of the complex number, seen as the hypotenuese of the right-angle triangle as representation of the complex number. We derive the value for $r$ in __Equation 13__ below, using the trigonometric identity $\cos^{ 2 }{ \theta } + \sin^{ 2 }{ \theta } = 1$."

# ╔═╡ 9c3e00a0-211c-11eb-0d24-0974b267f0cc
md"__Equation 13__"

# ╔═╡ a21f5db6-211c-11eb-2656-230adf866acc
md"$\begin{align} &x^{ 2 } +y^{  2 } = r^{ 2 } \cos^{ 2 }{ \theta } + r^{ 2 } \sin^{ 2 }{ \theta } \\ &x^{ 2 } +y^{  2 } = r^{ 2 } \left( \cos^{ 2 }{ \theta } + \sin^{ 2 }{ \theta } \right) \\ &x^{ 2 } +y^{  2 } = r^{ 2 } \\ &r = + \sqrt{ x^{ 2 } + y^{ 2 } } \end{align}$"

# ╔═╡ 387a9eec-211d-11eb-35b0-7fca10ef0707
md"Since $r$ denotes length, we only consider the positive value of the square root."

# ╔═╡ e51760fe-211d-11eb-16ef-c1ab109c7685
md"Substituting using __Equation 12__, we rewrite a complex number in __Equation 14__."

# ╔═╡ f7d5a818-211d-11eb-2509-d366e47fb5d9
md"__Equation 14__"

# ╔═╡ 00470672-211e-11eb-36e3-f18173ef4942
md"$\begin{align} &z = x + i y \\ &z = r \cos{\theta} + i \left( r \sin{ \theta } \right) \\ &z = r \left( cos{ \theta } + i \sin{ \theta } \right) \end{align}$"

# ╔═╡ 99867742-211d-11eb-2cec-634e3f119b1e
md"We are now ready to derive Euler's equation for complex numbers. First, we consider the series expansion of the sine and cosine of an angle $\theta$, as well as $e^{ \theta }$ in __Equation 15__."

# ╔═╡ c32d0322-211d-11eb-0d5d-5791738ae06b
md"__Equation 15__"

# ╔═╡ d294b7f6-211d-11eb-2da2-3932d4010b75
md"$\begin{align} &\cos{ \theta } = 1 - \frac{ \theta^{ 2 }}{ 2 ! } + \frac{ \theta^{ 4 }}{ 4 ! } - \frac{ \theta^{ 6 }}{ 6 ! } + \ldots \\ &i \sin{ \theta } = i \theta - i \frac{ \theta^{ 3 }}{ 3 ! } + i \frac{ \theta^{ 5 }}{ 5 ! } - i \frac{ \theta^{ 7 }}{ 7 ! } + \ldots \text{(multiplying both side by } i \text{)} \\ &e^{ \theta } = 1 + \theta + \frac{ \theta^{ 2 }}{ 2 ! } + \frac{ \theta^{ 3 }}{ 3 ! } + \frac{ \theta^{ 4 }}{ 4 ! } + \ldots \\ &e^{ i \theta } = 1 + { i \theta } + \frac{ { \left( i \theta \right) }^{ 2 } }{ 2 ! } + \frac{ { \left( i \theta \right) }^{ 3 } }{ 3 ! } + \ldots \text{ (replacing } \theta \text{ with } i \theta \text{)} \\ &e^{ i \theta } = 1 + i \theta - \frac{ \theta^{ 2 } }{ 2 ! } - i \frac{ \theta^{ 3 } }{ 3 ! } + \frac{ \theta^{ 4 } }{ 4 ! } - \ldots \text{(simplifying the powers of } i \text{)} \\ &\text{(From here we group the real and imaginary expressions)} \\ &e^{ i \theta } = \left( 1 - \frac{ \theta^{ 2 }}{ 2 ! } + \frac{ \theta^{ 4 }}{ 4 ! } - \frac{ \theta^{ 6 }}{ 6 ! } + \ldots \right) + \left( i \theta - i \frac{ \theta^{ 3 }}{ 3 ! } + i \frac{ \theta^{ 5 }}{ 5 ! } - i \frac{ \theta^{ 7 }}{ 7 ! } + \ldots \right) \\ &\text{(Finally we substitute the series expansions)} \\ &e^{ i \theta } = cos{ \theta } + i \sin{ \theta } \end{align}$"

# ╔═╡ 8e88102e-211f-11eb-08b0-25d26b7c979a
md"Combinining __Equation 14__ and __Equation 15__ (multiplying with the modulus), we have __Equation 16__, Euler's equation."

# ╔═╡ 126c5c2e-2120-11eb-01cb-e1527c392270
md"__Equation 16__"

# ╔═╡ 186348ea-2120-11eb-0d24-b97dbec770f6
md"$z=r e^{ i \theta} = r \left( \cos{ \theta } + i \sin{ \theta } \right)$"

# ╔═╡ 500f3b5a-2120-11eb-1da2-3551d9c5ce68
md"In this form of complex the number, $r$ is the _modulus_ and $\theta$ is the _argument_ of the complex number."

# ╔═╡ 2ccf07b2-218e-11eb-0886-25ff48a23fc7
md"This provides us with the astonishing _connection_ between $e$ and $\pi$. When $r=1$ and $\theta = \pi$ radians, we have Euler's identity, shown in __Equation 17__."

# ╔═╡ d1f63e02-237d-11eb-080c-9d8a8eacaba5
md"__Equation 17__"

# ╔═╡ 5de93b7c-218e-11eb-2959-cb5afe584452
md"$\begin{align} &e^{ i \pi } = \cos{ \pi } + i \sin{ \pi } \\ & e^{ i \pi } = - 1 \\ &e^{ i \pi} + 1 = 0 \end{align}$"

# ╔═╡ c7b352cc-218e-11eb-0a27-0923abf09149
md"This should make intuitive sense if we consider the Arngad diagram, where an argument of $\pi$ radians and a modulus of $1$, is a vector in the complex plane to the point $\left( - 1 , 0 \right)$."

# ╔═╡ 4634c270-218f-11eb-31f3-cd260dbbd765
md"Using Euler's notation, $z = r e^{ i \theta }$, we can view the multiplication and division of complex numbers in a different way. For two complex numbers $z_{ 1 }$ and $z_{ 2 }$, we have multiplication in __Equation 18__ (where we also consider the multiplication of multiple complex numbers) and division in __Equation 19__, where $z_{ 2 } \ne 0$."

# ╔═╡ a30219c6-218f-11eb-1d99-5bb6666dd66d
md"__Equation 18__"

# ╔═╡ b266cb3c-218f-11eb-3715-5b2b300ad91c
md"$\begin{align} &z_{ 1 } z_{ 2 } = r_{ 1 } e^{ i \theta_{ 1 } } \cdot r_{ 2 } e^{ i \theta_{ 2 } } \\ &z_{ 1 } z_{ 2 } = r_{ 1 } r_{ 2 } e^{ i \left( \theta_{ 1 } + \theta_{ 2 } \right)} \\ &z_{ 1 } z_{ 2 } \ldots z_{ n } = \left( \prod_{ m = 1 }^{ n }{ r_{ m } } \right) \left( e^{ i \sum_{ m = 1 }^{ n }{ \theta_{ m } } } \right) | m \in \mathbb{ N } \end{align}$"

# ╔═╡ 134358ee-2190-11eb-09a8-15a0596ed3af
md"__Equation 19__"

# ╔═╡ 1883044e-2190-11eb-3a72-2dd77cd7e3a6
md"$\begin{align} &\frac{ z_{ 1 } }{ z_{ 2 } } = \frac{ r_{ 1 } e^{ i \theta_{ 1 } } }{ r_{ 2 } e^{ i \theta_{ 2 } } } \\ &\frac{ z_{ 1 } }{ z_{ 2 } } = \frac{ r_{ 1 } }{ r_{ 2 } } e^{ i \left( \theta_{ 1 } - \theta_{ 2 } \right)} \end{align}$"

# ╔═╡ 51e42d22-2121-11eb-2dcb-d10dc4a8c175
md"## De Moivre's theorem"

# ╔═╡ 5b5bb68c-2191-11eb-058e-a996bd60129c
md"De Moivre's theorem is shown in __Equation 20__."

# ╔═╡ ce4fb7bc-2191-11eb-0ee1-0f66e6726aec
md"__Equation 20__"

# ╔═╡ ded2509a-2191-11eb-2cb2-49f4beccf3b3
md"$\begin{align} &z^{ n } = r^{ n } { \left( cos{ \theta } + i \sin{ \theta } \right)}^{ n } \\ &z^{ n } = r^{ n } \left[ \cos{ \left( n \theta \right)} + i \sin{ \left( n \theta \right)} \right] \end{align}$"

# ╔═╡ 53643586-2192-11eb-012a-8ff065f98252
md"A proof of this is given in __Equation 21__, using mathematical induction and trigonometric idenities $\cos{ \left( A + B \right)} = \cos{ A } \cos{ B } - \sin{ A } \sin{ B }$ and $\sin{ A + B } = \cos{ A } \sin{ B } + sin{ A } \cos{ B }$."

# ╔═╡ 60059db6-2192-11eb-3665-2de54f462cc0
md"__Equation 21__"

# ╔═╡ 68bb8e20-2192-11eb-2b19-5fe8c1da71d7
md"$\begin{align} &\text{Base case} \\& n = 1 \\ &z = r \left( cos{ \theta } + i \sin{ \theta } \right) \\ & \\ &\text{Induction hypothesis} \\ &\text{Assume that the theorem is true for } n = k \text{ and show that it is true for } n = k + 1  \\ &z^{ k } = r^{ k } \left[ \cos{ \left( k \theta \right) } + i \sin{ \left( k \theta \right) } \right] \Rightarrow z^{ k + 1 } = r^{ k + 1 } \left\{ \cos{ \left[ \left( k + 1 \right) \theta \right] } + i \sin{ \left[ \left( k + 1 \right) \theta \right]} \right\} \\ & \\ &z^{ k + 1 } = z^{ k } z = r^{ k } \left[ \cos{ \left( k \theta \right) } + i \sin{ \left( k \theta \right) } \right] \left[ r \left( cos{ \theta } + i \sin{ \theta } \right) \right] \\ &z^{ k + 1 } = r^{ k + 1} \left\{ \cos{ \left( k \theta \right)} \cos{ \theta } - sin{ \left( k \theta \right) \sin{ \theta } } + i \left[ \cos{ \left( k \theta \right) \sin{ \theta } } + \sin{ \left( k \theta \right) } \cos{ \theta } \right] \right\} \\ &z^{ k + 1 } = r^{ k + 1 } \left[ \cos{ \left( k \theta + \theta \right) } + i \sin{ \left( k \theta + \theta \right) } \right] \\ &z^{ k + 1 } = r^{ k + 1 } \left\{ \cos{ \left[ \left( k + 1 \right) \theta \right] } + i \sin{ \left[ \left( k + 1 \right) \theta \right]} \right\} \\ & \\ &\text{Since this is true for } n = 1 \text{ we have Q.E.D.} \end{align}$"

# ╔═╡ 4e5cb39a-2199-11eb-0b57-9399f8fa8ed5
md"This allows us to calculate the roots of a complex number (including the real numbers)."

# ╔═╡ 92856378-2199-11eb-20ea-a53639455ddd
md"__Example 6__"

# ╔═╡ 96f8f74e-2199-11eb-39aa-8f38820650b8
md"Calculate the fourth roots of $1$."

# ╔═╡ aa3c65e8-2199-11eb-0008-bf48f9663081
md"$\begin{align} &\sqrt[ 4 ]{ 1 } = 1^{\frac{ 1 }{ 4 }} , n = \frac{ 1 }{ 4 } , r = 1 , \theta = 0, 1^{ p } | p \in \mathbb{ R }, p \ne 0 = 1 \\ &\sqrt[ 4 ]{ 1 } = 1 \left[ \cos{ \left( \frac{ \theta + 2 k \pi }{ 4 } \right) } + i \sin{ \frac{ \left( \theta + 2 k \pi \right) }{ 4 } } \right] , k = \left\{ 0 , 1 , 2 , \ldots \right\} \\ &\text{(The sine and cosine functions repeat every } 2 \pi \text{ radians )} \\ &\sqrt[ 4 ]{ 1 } = \left[ \cos{ \left( \frac{ k \pi }{ 2 } \right) } + i \sin{ \frac{ \left( k \pi \right) }{ 2 } } \right] \\ &\sqrt[ 4 ]{ 1 } = \left\{ 1 , i , -1 , -i \right\} , k= \left\{ 0 , 1 , 2 , 3 \right\} \end{align}$"

# ╔═╡ fae0f830-2188-11eb-27a4-31eacb3727c8
md"## Revisiting sine and cosine"

# ╔═╡ dc316668-21a3-11eb-3054-295c6c65b2ed
md"We can express the sine and cosine function in terms of complex number notation. First, we reconsider Euler's equation in __Equation 22__, for both $\theta$ and $- \theta$, remembering that cosine is an odd function and $\cos{ \left( - \theta \right) } = \cos{ \theta }$."

# ╔═╡ 0fa93186-21a4-11eb-2ef8-39908e25ef88
md"__Equation 22__"

# ╔═╡ 14d09d0a-21a4-11eb-08cf-efd9c7e74a0b
md"$\begin{align} &e^{ i \theta } = \cos{ \theta } + i \sin{ \theta } \\ &e^{ - i \theta } = \cos{ \left( - \theta \right) } + i \sin{ \left( - \theta \right)} = \cos{ \theta } - i sin{ \theta } \end{align}$"

# ╔═╡ c602fcb4-21a4-11eb-11c4-d727462a6808
md"We can now write new expressions for the sine and cosine functions as shown in __Equation 23__."

# ╔═╡ d9aff334-21a4-11eb-0c95-2fbf1c3c10ff
md"__Equation 23__"

# ╔═╡ df94996c-21a4-11eb-08d2-f794ef346ee1
md"$\begin{align} &e^{ i \theta } + e^{ - i \theta } = 2 cos{ \theta \\ } \text{ (the sine functions cancel)} \\ &\cos{ \theta } = \frac{ e^{ i \theta } + e^{ - i \theta } }{ 2 } \text{ (simple algebra)} \\ & \\ &e^{ i \theta } - e^{ - i \theta } = - 2 i \sin{ \theta } \text{ (the cosine functions cancel)} \\ &\sin{ \theta } = \frac{ e^{ i \theta } - e^{ - i \theta } }{ 2 i } \text{ (simple algebra)} \end{align}$"

# ╔═╡ 011622b4-2366-11eb-232d-57f58db3a782
md"If we use Euler notation, and $r = 1$, we can write __Equation 24__."

# ╔═╡ 12e34044-2366-11eb-0d97-2b7302bfa53c
md"__Equation 24__"

# ╔═╡ 17c2c10c-2366-11eb-25ae-1343710f8d59
md"$\begin{align} &z^{ n } = \cos{ \left( n \theta \right) } + i \sin{ \left( n \theta \right) } \\ &z^{ - n } = \cos{ \left( n \theta \right) } - i \sin{ \left( n \theta \right) } \end{align}$"

# ╔═╡ c536fe8e-2366-11eb-00b1-2d8bf072eead
md"When $n = 1$, we can derive yet more equations for the sine and cosine function as seen in __Equation 25__."

# ╔═╡ ec6871fe-2366-11eb-26e8-a34fa5eabf65
md"__Equation 25__"

# ╔═╡ f3fe5c26-2366-11eb-258a-078178c03542
md"$\begin{align} &z + z^{ - 1 } = 2 \cos{ \theta} \text{ (the sine functions cancel)} \\ &z - z^{ - 1 } = 2 i \sin{ \theta } \text{ (the cosine functions cancel)} \end{align}$"

# ╔═╡ 588694ae-2367-11eb-35e9-edcfe0da0f60
md"This allows us to express powers of trigonometric functions. Consider __Example 7__."

# ╔═╡ 7ad8414e-2367-11eb-3ccd-ff9250beada3
md"__Example 7__"

# ╔═╡ 8356ad10-2367-11eb-357e-b7d1a1535aa3
md"Expand the expression $\cos^{ 4 }{ \theta }$."

# ╔═╡ 982ea49a-2367-11eb-0086-c79c74a48a8e
md"To do this, we make use of __Equation 24__ and __Equation 25__."

# ╔═╡ b1134452-2367-11eb-0168-2f7a501756d5
md"$\begin{align} &2^{ 4 } \cos^{ 4 }{ \theta } = { \left( z + z^{ - 1 } \right) }^{ 4 } \\ &16 \cos^{ 4 }{ \theta } = z^{ 4 } + 4 z^{ 2 } + 6 + 4 z^{ - 2 } + z^{ - 4 } \text{ (making use of Pascal's triangle)} \\ &16 \cos^{ 4 }{ \theta } = \left( z^{ 4 } + z^{ - 4 } \right) + 4 \left( z^{ 2 } + z^{ - 2 } \right) + 6 \text{ (grouping terms)} \\ &16 \cos^{ 4 }{ \theta } = 2 \cos{ \left( 4 \theta \right) } + 8 \cos{ \left( 2 \theta \right) } + 6 \text{ (substitution)} \\ &\cos^{ 4 }{ \theta } = \frac{ 1 }{ 8 } \left[ \cos{ \left( 4 \theta \right)} + 4 \cos{ \left( 2 \theta \right)}  + 3 \right] \text{ (simplifying)} \end{align}$"

# ╔═╡ 7b5ca94a-236a-11eb-33da-e74167314cec
md"Let's verify this with $\theta = \frac{ \pi }{ 4 }$."

# ╔═╡ 89cdec52-236a-11eb-0a23-7bcb536cba3f
round(cos(π/4)^4, digits = 2)

# ╔═╡ a2603b56-236a-11eb-12c9-dfb7ec6a8eb8
(1/8) * (cos(π) + 4 * cos(π/2) + 3)

# ╔═╡ bec5b2dc-236a-11eb-1e33-a5cd16fc7e85
md"We can also express the sine and cosine of the constant multiple of angles in terms of the powers of these functions."

# ╔═╡ 0892d848-236b-11eb-2138-85ed007216d2
md"__Example 8__"

# ╔═╡ 1fdb9f58-236b-11eb-3841-4db2e710fb44
md"Express $\cos{ \left( 4 \theta \right)}$ and $\sin{ \left( 4 \theta \right)}$ in terms of the powers and products of sine and cosine functions."

# ╔═╡ 4aba4d96-236b-11eb-0d13-c98e09173376
md"$\begin{align} &\cos{ \left( 4 \theta \right)} + i \sin{ \left( 4 \theta \right)} = { \left( \cos{ \theta } + i \sin{ \theta } \right)}^{ 4 }  \text{ (Euler)} \\ &\cos{ \left( 4 \theta \right)} + i \sin{ \left( 4 \theta \right)} = \cos^{ 4 }{ \theta } + 4 i  \cos^{ 3 }{ \theta } \sin{ \theta } - 6 \cos^{ 2 }{ \theta } \sin^{ 2 }{ \theta } - 4 i \cos{ \theta } \sin^{ 3 }{ \theta } + \sin^{ 4 }{ \theta } \\ &\text{(Pascal's triangle)} \\ &\cos{ \left( 4 \theta \right)} + i \sin{ \left( 4 \theta \right)} = \left( \cos^{ 4 }{ \theta } - 6 \cos^{ 2 }{ \theta } \sin^{ 2 }{ \theta } + \sin^{ 4 }{ \theta } \right) + i \left( 4 \cos^{ 3 }{ \theta } \sin{ \theta } - 4 \cos{ \theta } \sin^{ 3 }{ \theta }  \right) \\ &\text{(grouping real and imaginary terms)} \\ &\cos{ \left( 4 \theta \right)}  = \cos^{ 4 }{ \theta } - 6 \cos^{ 2 }{ \theta } \sin^{ 2 }{ \theta } + \sin^{ 4 }{ \theta } \text{ (real parts)} \\ &\sin{ \left( 4 \theta \right)} = 4 \cos^{ 3 }{ \theta } \sin{ \theta } - 4 \cos{ \theta } \sin^{ 3 }{ \theta } \text{ (imaginary parts)} \end{align}$"

# ╔═╡ 8d99dd3c-236d-11eb-0912-150801074f01
md"Let's verify this for $\theta  = \frac{ \pi }{ 4 }$."

# ╔═╡ 9f43fb8a-236d-11eb-0434-8114e302107e
cos(π)

# ╔═╡ a5b6081e-236d-11eb-0270-6dcc0a947109
round(sin(π))

# ╔═╡ aff8025a-236d-11eb-0fc0-b9ad3e171fcc
(cos(π/4)^4) - (6 * cos(π/4)^2 * sin(π/4)^2) + sin(π/4)^4

# ╔═╡ 1b56b776-236e-11eb-1446-55f4d2ad8409
round((4 * cos(π/4)^3 * sin(π/4)) - 4 * (cos(π/4) * sin(π/4)^3))

# ╔═╡ dde9c9c6-23da-11eb-22da-1f882f72046e
md"## Dot and cross products"

# ╔═╡ ea088e20-23da-11eb-286d-83bc9f95dc1f
md"The _dot product_ of two complex numbers is shown in __Equation 26__. It follows from the dot product of vectors in Euclidean space."

# ╔═╡ 3ba8c894-23db-11eb-2b4d-1de6ca3a3de0
md"__Equation 26__"

# ╔═╡ 15012916-23db-11eb-06c2-c91a960183a2
md"$z_{ 1 } \cdot z_{ 2 } = x_{ 1 } x_{ 2 } + y_{ 1 } y_{ 2 } = \left| z_{ 1 } \right| \left| z_{ 2 } \right| \cos{ \theta }$"

# ╔═╡ 7f96c230-23dc-11eb-1403-c99cc5cd26cb
md"__Example 9__"

# ╔═╡ 83cc936e-23dc-11eb-1684-3fb0a5fb9073
md"Calculate the dot product of $z_{ 8 } = 3 + 4 i$ and $z_{ 9 } = 2 + 4 i$."

# ╔═╡ 9c36d5cc-23dc-11eb-124f-1b4ca1935466
md"$\left( 3 + 4 i \right) \cdot \left( 2 + 4 i \right) = 3 \cdot 2 + 4 \cdot 4 = 22$"

# ╔═╡ d5dea5b8-23dc-11eb-3c75-c39e786b99f5
md"The `dot` function from the LinearAlgebra package calculates the dot product between two column vectors. Below, we verify our result using the `dot` function, but also create our own functions."

# ╔═╡ 38fa8252-23db-11eb-21e8-051caa85ea07
dot([3; 4], [2; 4])

# ╔═╡ f0e1955a-23dc-11eb-1a78-3fa61c4a27fa
md"We can create a function that saves the real and imaginary part of two complex numbers and performs the dot product."

# ╔═╡ c8c2d99a-23db-11eb-0b55-6b1fb47e43b6
function dot_product(z1, z2)
	x1, y1 = reim(z1) # Save the real and imaginary parts
	x2, y2 = reim(z2)
	
	a = [x1; y1] # Create a column vector from the values of the
	b = [x2; y2] # real and imaginary parts
	
	return dot(a, b) # Return the dot product
end

# ╔═╡ d83bf792-2414-11eb-0fb4-03b09292aada
begin
	z8 = 3 + 4 * im
	z9 = 2 + 4 * im;
end

# ╔═╡ 6148235a-23dc-11eb-20a1-23fc3ba7865d
dot_product(z8, z9)

# ╔═╡ aeb25750-2413-11eb-125a-bf525fd2ee03
md"Below, we create another function, `dot_product_angle` that uses the angle between the imaginary numbers."

# ╔═╡ 85716854-23de-11eb-3361-17e1b3f936b3
function dot_product_angle(z1, z2)
	norm_1 = abs(z1)
	norm_2 = abs(z2)
	
	angle_1 = angle(z1)
	angle_2 = angle(z2)
	angle_diff = abs(angle_1 - angle_2)
	
	return norm_1 * norm_2 * cos(angle_diff)
end

# ╔═╡ d89716dc-2413-11eb-27f9-add2453ece31
md"Using this new function, we get the same result."

# ╔═╡ 25a9d31e-23de-11eb-0c4a-8f31e3b64f7d
dot_product_angle(z8, z9)

# ╔═╡ e6746a3e-2413-11eb-3d6d-61bd0c68935e
md"The dot product is the multiplication of the modulus of a complex number and the orthogonal projection of another complex number onto the first."

# ╔═╡ 2cc9c902-23dd-11eb-18bd-b917e082f429
md"The _cross product_ of two complex numbers is and vector perpendicular to the Arhand diagram and is defined in __Equation 27__."

# ╔═╡ 7665f478-23dd-11eb-21f6-83c9b6d4f480
md"__Equation 27__"

# ╔═╡ a15e1a96-23dd-11eb-10a0-9b033b73ed99
md"$z_{ 1 } \times z_{ 2 } = \left< 0 ,0, x_{ 1 } y_{ 2 } - x_{ 2 } y_{ 1 } \right>$"

# ╔═╡ 1d423494-2414-11eb-042f-21dfdca12f30
md"This is the determinant of the matrix in __Equation 28__."

# ╔═╡ 2a1df75a-2414-11eb-2ea9-bf1ef1c36661
md"__Equation 28__"

# ╔═╡ 2e041e1c-2414-11eb-0296-039a3628cb1d
md"$z_{ 1 } \times z_{ 2 } = \left|\begin{pmatrix} \hat{ i } & \hat{ j } & \hat{ k } \\ x_{ 1 } & y_{ 1 } & 0 \\ x_{ 2 } & y_{ 2 } & 0 \end{pmatrix} \right|$"

# ╔═╡ d67ba664-23dd-11eb-2e18-0bb6c0ed3358
md"The norm of the cross product is defined in __Equation 29__."

# ╔═╡ e52c0596-23dd-11eb-3272-29e1a1683d34
md"__Equation 29__"

# ╔═╡ e977bc3c-23dd-11eb-0dbb-29ce3d980810
md"$\left| z_{ 1 } \times z_{ 2 } \right| = x_{ 1 } y_{ 2 } - x_{ 2 } y_{ 1 }$"

# ╔═╡ 8943c796-2414-11eb-038c-6fdd32ee430f
md"__Example 10__"

# ╔═╡ 8f81bd90-2414-11eb-0cea-db483e649146
md"Calculate the cross product of $z_{ 8 }$ and $z_{ 9 }$ from above."

# ╔═╡ 5366898c-2415-11eb-31a6-d3d95eb3ed59
md"$\begin{align} \\ &z_{ 1 } \times z_{ 2 } = \left|\begin{pmatrix} \hat{ i } & \hat{ j } & \hat{ k } \\ 3 & 4 & 0 \\ 2 & 4 & 0 \end{pmatrix} \right| \\ &z_{ 1 } \times z_{ 2 } = 0 \hat{ i } - 0 \hat{ j } + \left( 3 \cdot 4 - 2 \cdot 4 \right) \hat{ k } \\ &z_{ 1 } \times z_{ 2 } =  0 \hat{ i } + 0 \hat{ j } = 4 \hat{ k } = \left< 0 , 0 , 4 \right> \end{align}$"

# ╔═╡ 3332db8e-2415-11eb-29fd-ed23a78e4904
md"The `cross` function from the LinearAlgebra package perform the cross product given two column vectors."

# ╔═╡ 0456e864-2415-11eb-02ab-e1734d7d178a
cross([3; 4; 0], [2; 4; 0])

# ╔═╡ 4bf51c22-2415-11eb-32c3-413d6205fe32
md"The norm of this cross product is the area of the parallelogram created with the two complex numbers being the adjacent sides of the parallelogram."

# ╔═╡ abf8a2dc-2416-11eb-0ce3-6d5f62dd8958
md"__Equation 30__ contains two properties of the dot and cross products."

# ╔═╡ e772b5a0-2416-11eb-384d-c378edd31c79
md"$\begin{align} &z_{ 1 } \cdot z_{ 2 } = 0 \Leftrightarrow z_{ 1 } \perp z_{ 2 } \\ &\left| z_{ 1 } \times z_{ 2 } \right| = 0 \Leftrightarrow z_{ 1 } \parallel z_{ 2 } \end{align}$"

# ╔═╡ Cell order:
# ╟─5875e11c-080f-11eb-375e-af85d85c552d
# ╟─47d1aa9e-2112-11eb-18c4-dd3bee4d36ec
# ╟─f2c680ec-2119-11eb-2e52-21b52a798680
# ╟─9f8ffaf6-2112-11eb-16ff-e37fa35393b7
# ╟─7204595e-080f-11eb-070b-9ba219eb2c22
# ╟─1a2d1de8-2113-11eb-081f-9fd0ede31cd3
# ╠═5918011c-2113-11eb-1db7-4dba9a23e9ae
# ╠═779709d6-080f-11eb-2514-bf188e49d4f7
# ╠═7b8f85e8-080f-11eb-3147-41aa21e2ebda
# ╟─62378cea-2113-11eb-167a-5b5cf0181054
# ╠═89aa39d4-080f-11eb-2729-1b61609f2e3d
# ╠═ba714d9a-2354-11eb-0d76-117d96b9430c
# ╠═9269b77a-080f-11eb-086e-c56e50088cc5
# ╠═b1f9b602-23db-11eb-00e8-9779dc9fc4fa
# ╟─c92030fa-080f-11eb-2ffa-533c718a37a8
# ╟─b755d36c-2113-11eb-0867-fbcb9471c8dd
# ╟─e7a9e85c-2119-11eb-02e7-2d0167026928
# ╟─cace9528-2113-11eb-06cf-5b1dc7e3a357
# ╟─da5466f8-2113-11eb-1d45-53bc19ffe196
# ╠═95caa302-080f-11eb-1fbf-23f03c7f8f4e
# ╟─05e6fc18-2114-11eb-1abf-490461565625
# ╠═0159e226-2114-11eb-0b3d-3bf024c60cf2
# ╟─1f09eb6e-0810-11eb-1d9f-a56b6dfc0061
# ╟─2d7e77f0-0810-11eb-12f2-97c4321d091c
# ╟─d453b5a0-2119-11eb-186f-55c2cdb1306c
# ╟─3dd26828-0810-11eb-1cba-7970f2cebdc7
# ╟─48df2f26-0810-11eb-0ba6-bf6840db1152
# ╟─533ffbd2-27ce-11eb-030b-a30b48fe4c15
# ╟─5d7c2704-0810-11eb-1f9e-8b6ec957103e
# ╠═de64da9c-2114-11eb-1e14-85e18deb6351
# ╠═ed048df4-2114-11eb-1d2d-03e436cb3a74
# ╟─0317d006-2115-11eb-0ea4-8ba5a96c56e8
# ╠═de60878a-080f-11eb-0cac-91414531052a
# ╠═12eaf346-0810-11eb-1872-5510a5f5a31e
# ╠═151c606e-0810-11eb-12f0-4dc99bb74ef6
# ╟─aa41729e-241a-11eb-3391-f56605b74ddb
# ╠═a1cac854-241a-11eb-3fa0-d565020329bc
# ╟─79e1c6ce-0810-11eb-2e42-a1894a4dc658
# ╟─49cd46f4-2115-11eb-03c5-fd694dd5d19d
# ╟─c052ed66-0810-11eb-2461-d7bef5433777
# ╟─f8744e86-2360-11eb-211d-6dc5f3286893
# ╟─471b5b58-2361-11eb-2437-19b45197af6a
# ╠═bb6940f0-2378-11eb-0369-b50bb4ea4211
# ╠═f877f194-080f-11eb-2793-336f09c5eb76
# ╠═fce350ac-080f-11eb-1533-ab1b6209d9cb
# ╟─12bc8cf2-0812-11eb-3345-610b62856ce1
# ╟─000b06f8-0810-11eb-2874-c745ba1bc512
# ╟─bfd38a60-2119-11eb-0488-f7453efa43ca
# ╟─307e92fe-0811-11eb-11e6-5f13b941e4e8
# ╟─5e637a50-2361-11eb-3364-89e469213200
# ╟─7c7b4112-2115-11eb-1d2f-310cb359a316
# ╟─9b3f9eb8-2115-11eb-1e6a-ebf3cdc9fbf8
# ╟─eb722828-2378-11eb-373d-61f66135913e
# ╟─bb129380-2115-11eb-14ae-37160b69391a
# ╟─30e60daa-241b-11eb-13fe-7dc84e7ac80e
# ╠═3ffe15ec-2116-11eb-1eb9-73b0fa23a1b9
# ╠═fb522bc6-0811-11eb-0268-6f5341dc5b6a
# ╠═9cbbba3c-2116-11eb-3391-bb1e3aa219a6
# ╟─091e7840-0812-11eb-2321-0502dd0ff199
# ╟─26613fa0-0812-11eb-28d1-61defedc57fa
# ╟─9c61a6ce-211a-11eb-1dcf-2391a2932d4d
# ╟─334287f6-0812-11eb-2913-c1dd4d8d55e2
# ╟─4be525b4-241b-11eb-2a82-f3db68189ba2
# ╟─8c592532-0812-11eb-3a68-e59dd173abfa
# ╠═db4fdef4-2116-11eb-0c24-e3d45a26a181
# ╠═83b89ffe-0812-11eb-22cf-cde44d1e7366
# ╟─fefc292e-0812-11eb-20c3-3f3ea9e1eec4
# ╟─a6dae5c8-2119-11eb-0390-27fd43009b09
# ╟─0c1bd1b8-0813-11eb-2384-814ca89a9f43
# ╟─8c8f8b74-2379-11eb-3463-b79d5ae842ea
# ╟─9d3c0ede-2379-11eb-0dcf-6ff49b0844d8
# ╟─af255bdc-2379-11eb-117f-21a1b79a5e6e
# ╟─46e1e06c-0813-11eb-10df-bbe8c050f530
# ╠═f7951598-2116-11eb-242a-0daedde007c5
# ╟─4023cf34-2117-11eb-386c-fbf8630e211b
# ╟─9a8398d8-0812-11eb-0a33-0d4ca7a8ebd6
# ╟─ad1aa746-0812-11eb-27b2-711772f8a9c5
# ╟─b7698f66-0812-11eb-1af5-9d02410c52fb
# ╟─8279a016-2117-11eb-2e5e-9fca571a55eb
# ╟─3b1e6786-237b-11eb-12ef-1109369e12f1
# ╟─598975e0-0813-11eb-2b7f-23ba2c6ecfde
# ╟─774b911c-0813-11eb-27cd-47743e3d1f5c
# ╟─89e69352-237b-11eb-080e-750fb513d927
# ╠═c100f83e-2117-11eb-1cb3-093e187cfa89
# ╠═c8991090-2117-11eb-2eb6-e70d386094cd
# ╠═0dfffd98-0814-11eb-3b02-ebd555daf050
# ╟─abc628b6-237b-11eb-0321-efe0765bc388
# ╠═9f461808-237b-11eb-1e2f-713d90955ce0
# ╟─987db362-0816-11eb-2801-491343f11e4f
# ╟─9db23db2-0816-11eb-2e72-ef10f878f295
# ╟─dfb83d0a-2117-11eb-14eb-d1736ddef6d1
# ╟─002ec5f6-2118-11eb-1619-b97d8d29c51e
# ╟─06b74196-2364-11eb-2d80-5997606efb8a
# ╠═bd7ffaec-2361-11eb-352c-79e84e4b838f
# ╟─50e8d6d2-0814-11eb-10f1-19f8082ee113
# ╟─bae5c6c6-0814-11eb-304d-5dbbe8c8cd8c
# ╟─c293f17c-241b-11eb-02de-e1587cf7c885
# ╟─c8377568-0814-11eb-3735-91ddfc6c9b63
# ╟─d72cc3ac-237b-11eb-29cd-f703999dbe41
# ╟─2f6f93a0-0815-11eb-3ae0-879e54a304f2
# ╟─fb4503e4-237b-11eb-31aa-dd10671bf55a
# ╟─528234c4-237c-11eb-333d-cbadf4d0cc44
# ╠═0c3ecfd6-0815-11eb-23cc-e59e2acc127b
# ╠═55f76e64-2118-11eb-3bc7-3f7f56755418
# ╟─0adcae86-2121-11eb-0536-e90acc24da14
# ╠═201d48aa-2121-11eb-22f4-1141493bfda8
# ╟─90bd5f2c-2118-11eb-075b-370bf5360767
# ╟─4022102e-0815-11eb-1ebc-2315d2fac4a5
# ╟─c579237a-0815-11eb-3918-5746487895ba
# ╟─02eac800-2119-11eb-1c62-4998e986c114
# ╟─d566ea42-0815-11eb-3371-2d8412317e65
# ╟─0911fcb6-2359-11eb-25fa-2f6c3d883eb5
# ╠═2805d82a-2354-11eb-3c73-5d96f8232478
# ╟─015a3ba4-237d-11eb-2a29-6727a68c4e01
# ╟─6b3ef4e2-0816-11eb-04e9-5d2628ba015a
# ╟─15c448a0-237d-11eb-275d-eb40aed5ed69
# ╟─0b8114be-241c-11eb-16d5-d95a74e4ff07
# ╟─2140f53c-241c-11eb-3673-2d2572d1e02a
# ╠═53cbbfa6-2119-11eb-289e-99920c357f31
# ╠═49419468-0815-11eb-129c-d9e85501505a
# ╟─700b11ce-2119-11eb-3a02-29b782f3f255
# ╟─f82c0962-2120-11eb-2406-0b72dc0c2791
# ╠═ea1addc6-2120-11eb-26ca-ad6b9c879f58
# ╟─3f735628-219f-11eb-2b36-631692509fc0
# ╠═3308a0e4-219f-11eb-3826-6b4c9b57a070
# ╟─df875dc6-2355-11eb-16b5-3f9ce65f7464
# ╟─092a1cae-2356-11eb-274a-7324b8b7af62
# ╠═1c34e2de-2356-11eb-20fc-516e16336e1c
# ╟─41de2f7c-2356-11eb-25e6-b55954faa64f
# ╠═4e8cf1c2-2356-11eb-1217-751c94fa199b
# ╟─65199f9e-2356-11eb-2d25-231560b2b430
# ╠═888df394-2356-11eb-3b32-cdad1d29c3de
# ╟─8dbeeee2-2356-11eb-0cf7-c39a48e7d6c1
# ╠═b4dac396-2356-11eb-1b0d-ef9253ae770d
# ╟─d28d2f48-2356-11eb-0c49-abd17c2e4428
# ╟─dad9c668-2357-11eb-0511-5beb70514c0e
# ╟─c4cde596-2359-11eb-3993-e3b004598eba
# ╠═2e5b5058-2359-11eb-0c14-c33622fd6f95
# ╟─f3c68d94-2359-11eb-09c4-115cc05ea45a
# ╠═3e136a08-2359-11eb-20e1-ad45247c8bc6
# ╟─32ea1308-211b-11eb-0609-c927629fddc1
# ╟─434b7f8e-211b-11eb-1d79-d145a543ff21
# ╟─5a538468-211b-11eb-2e40-731ca94282a3
# ╟─61f1d062-211b-11eb-2d6b-5ba00a82b140
# ╟─44345760-211c-11eb-2894-2d76a6e59b7d
# ╟─9c3e00a0-211c-11eb-0d24-0974b267f0cc
# ╟─a21f5db6-211c-11eb-2656-230adf866acc
# ╟─387a9eec-211d-11eb-35b0-7fca10ef0707
# ╟─e51760fe-211d-11eb-16ef-c1ab109c7685
# ╟─f7d5a818-211d-11eb-2509-d366e47fb5d9
# ╟─00470672-211e-11eb-36e3-f18173ef4942
# ╟─99867742-211d-11eb-2cec-634e3f119b1e
# ╟─c32d0322-211d-11eb-0d5d-5791738ae06b
# ╟─d294b7f6-211d-11eb-2da2-3932d4010b75
# ╟─8e88102e-211f-11eb-08b0-25d26b7c979a
# ╟─126c5c2e-2120-11eb-01cb-e1527c392270
# ╟─186348ea-2120-11eb-0d24-b97dbec770f6
# ╟─500f3b5a-2120-11eb-1da2-3551d9c5ce68
# ╟─2ccf07b2-218e-11eb-0886-25ff48a23fc7
# ╟─d1f63e02-237d-11eb-080c-9d8a8eacaba5
# ╟─5de93b7c-218e-11eb-2959-cb5afe584452
# ╟─c7b352cc-218e-11eb-0a27-0923abf09149
# ╟─4634c270-218f-11eb-31f3-cd260dbbd765
# ╟─a30219c6-218f-11eb-1d99-5bb6666dd66d
# ╟─b266cb3c-218f-11eb-3715-5b2b300ad91c
# ╟─134358ee-2190-11eb-09a8-15a0596ed3af
# ╟─1883044e-2190-11eb-3a72-2dd77cd7e3a6
# ╟─51e42d22-2121-11eb-2dcb-d10dc4a8c175
# ╟─5b5bb68c-2191-11eb-058e-a996bd60129c
# ╟─ce4fb7bc-2191-11eb-0ee1-0f66e6726aec
# ╟─ded2509a-2191-11eb-2cb2-49f4beccf3b3
# ╟─53643586-2192-11eb-012a-8ff065f98252
# ╟─60059db6-2192-11eb-3665-2de54f462cc0
# ╟─68bb8e20-2192-11eb-2b19-5fe8c1da71d7
# ╟─4e5cb39a-2199-11eb-0b57-9399f8fa8ed5
# ╟─92856378-2199-11eb-20ea-a53639455ddd
# ╟─96f8f74e-2199-11eb-39aa-8f38820650b8
# ╟─aa3c65e8-2199-11eb-0008-bf48f9663081
# ╟─fae0f830-2188-11eb-27a4-31eacb3727c8
# ╟─dc316668-21a3-11eb-3054-295c6c65b2ed
# ╟─0fa93186-21a4-11eb-2ef8-39908e25ef88
# ╟─14d09d0a-21a4-11eb-08cf-efd9c7e74a0b
# ╟─c602fcb4-21a4-11eb-11c4-d727462a6808
# ╟─d9aff334-21a4-11eb-0c95-2fbf1c3c10ff
# ╟─df94996c-21a4-11eb-08d2-f794ef346ee1
# ╟─011622b4-2366-11eb-232d-57f58db3a782
# ╟─12e34044-2366-11eb-0d97-2b7302bfa53c
# ╟─17c2c10c-2366-11eb-25ae-1343710f8d59
# ╟─c536fe8e-2366-11eb-00b1-2d8bf072eead
# ╟─ec6871fe-2366-11eb-26e8-a34fa5eabf65
# ╟─f3fe5c26-2366-11eb-258a-078178c03542
# ╟─588694ae-2367-11eb-35e9-edcfe0da0f60
# ╟─7ad8414e-2367-11eb-3ccd-ff9250beada3
# ╟─8356ad10-2367-11eb-357e-b7d1a1535aa3
# ╟─982ea49a-2367-11eb-0086-c79c74a48a8e
# ╟─b1134452-2367-11eb-0168-2f7a501756d5
# ╟─7b5ca94a-236a-11eb-33da-e74167314cec
# ╠═89cdec52-236a-11eb-0a23-7bcb536cba3f
# ╠═a2603b56-236a-11eb-12c9-dfb7ec6a8eb8
# ╟─bec5b2dc-236a-11eb-1e33-a5cd16fc7e85
# ╟─0892d848-236b-11eb-2138-85ed007216d2
# ╟─1fdb9f58-236b-11eb-3841-4db2e710fb44
# ╟─4aba4d96-236b-11eb-0d13-c98e09173376
# ╟─8d99dd3c-236d-11eb-0912-150801074f01
# ╠═9f43fb8a-236d-11eb-0434-8114e302107e
# ╠═a5b6081e-236d-11eb-0270-6dcc0a947109
# ╠═aff8025a-236d-11eb-0fc0-b9ad3e171fcc
# ╠═1b56b776-236e-11eb-1446-55f4d2ad8409
# ╟─dde9c9c6-23da-11eb-22da-1f882f72046e
# ╟─ea088e20-23da-11eb-286d-83bc9f95dc1f
# ╟─3ba8c894-23db-11eb-2b4d-1de6ca3a3de0
# ╟─15012916-23db-11eb-06c2-c91a960183a2
# ╟─7f96c230-23dc-11eb-1403-c99cc5cd26cb
# ╟─83cc936e-23dc-11eb-1684-3fb0a5fb9073
# ╟─9c36d5cc-23dc-11eb-124f-1b4ca1935466
# ╟─d5dea5b8-23dc-11eb-3c75-c39e786b99f5
# ╠═38fa8252-23db-11eb-21e8-051caa85ea07
# ╟─f0e1955a-23dc-11eb-1a78-3fa61c4a27fa
# ╠═c8c2d99a-23db-11eb-0b55-6b1fb47e43b6
# ╠═d83bf792-2414-11eb-0fb4-03b09292aada
# ╠═6148235a-23dc-11eb-20a1-23fc3ba7865d
# ╟─aeb25750-2413-11eb-125a-bf525fd2ee03
# ╠═85716854-23de-11eb-3361-17e1b3f936b3
# ╟─d89716dc-2413-11eb-27f9-add2453ece31
# ╠═25a9d31e-23de-11eb-0c4a-8f31e3b64f7d
# ╟─e6746a3e-2413-11eb-3d6d-61bd0c68935e
# ╟─2cc9c902-23dd-11eb-18bd-b917e082f429
# ╟─7665f478-23dd-11eb-21f6-83c9b6d4f480
# ╟─a15e1a96-23dd-11eb-10a0-9b033b73ed99
# ╟─1d423494-2414-11eb-042f-21dfdca12f30
# ╟─2a1df75a-2414-11eb-2ea9-bf1ef1c36661
# ╟─2e041e1c-2414-11eb-0296-039a3628cb1d
# ╟─d67ba664-23dd-11eb-2e18-0bb6c0ed3358
# ╟─e52c0596-23dd-11eb-3272-29e1a1683d34
# ╟─e977bc3c-23dd-11eb-0dbb-29ce3d980810
# ╟─8943c796-2414-11eb-038c-6fdd32ee430f
# ╟─8f81bd90-2414-11eb-0cea-db483e649146
# ╟─5366898c-2415-11eb-31a6-d3d95eb3ed59
# ╟─3332db8e-2415-11eb-29fd-ed23a78e4904
# ╠═0456e864-2415-11eb-02ab-e1734d7d178a
# ╟─4bf51c22-2415-11eb-32c3-413d6205fe32
# ╟─abf8a2dc-2416-11eb-0ce3-6d5f62dd8958
# ╟─e772b5a0-2416-11eb-384d-c378edd31c79
