# JULIA FOR MEDICAL STATISTICS
# ============================


# Introduction
# -------------

# This new version of JULIA FOR MEDICAL STATISTICS
# aims to show you how to use Julia for common
# tasks in medical statistics such
# as data imports, data manipulation, plotting,
# and inferential test.

# I assume a basic understanding of statistical
# analysis.

# Along the way, I will showcase Julia syntax and
# some coding paradigms.

# Julia is a computer language for scientic computing.
# It is a compiled language, which means that code
# is compiled before execution.  This is in contrast
# to a language such as Python, where the code is
# interpreted as it is executed.
# The compilation of code is one of the reasons why Julia
# is so fast.

# Everthing in Julia is a type.  Unlike C and other
# strongly typed languages, Julia infers the type
# as required and makes use of multiple dispatch
# for type inference.  This does not prevent you from
# specifying types.  Specifying a type does indeed help
# to speed up code execution even further as the
# compiled code is optimized when compiled.

# Julia is easy to learn and use.  The syntax is very
# simuilar to Python.

# Below, we start by importing some packages which we
# will use in this file.


# Package import
# --------------

# Hit SHIFT+ENTER (SHIFT+RETURN) at the end of a line
# of code to execute it.  Some of the packages might
# need precompilation before it is ready to use.
# Below, we use the import statement instead of the
# using statement.  That means that we will have to
# reference the package name to gain access to its
# functions.

# A package for data manipulation
import DataFrames

# A package for using statistical distributions
import Distributions

# A package for creating graphs and plots
using Gadfly

# A package with many statisical tests
using HypothesisTests

# A package with useful statistical functions
import StatsBase

# Built-in Julia package with common statistical tests
import Statistics

 # A package to create random values
import Random

# Package to import and export CSV files
import CSV

# A package to manipulate data
using Query

# Simulating data
# ---------------

# Julia has different collections.  Below, we use a
# list object.  List obejcts are indicated by the
# square bracket notation.  Elements
# of a list are separated by commas.  Lists are
# mutable (the individual elements can be altered at
# a later stage).  We can also use a mix of element
# types such as integers, strings, and more.
# Note that we are using strings elements below.
# Strings are denoted by the use of double quotes
# (single quotes denote characters).  The assigment
# operator, =, assigns what is to the right of it
# (a list object in our two examples below) to what
# is to its left (in this case, a computer variable
# name).  Computer variable names are chosen by us.
# Keep them short-and-sweet, but indicative of what
# content they hold.  Don't use illegal characters
# or actual Julia keywords (functions).  Lowercase
# letters are preferred.  Use underscore to
# concatenate word together (called snake-case), i.e.
# my_variable_name.

# In this tutorial we recreate some of the data
# published in the paper below:
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5724841/

# The seed! function in the Random package seeds
# the pseudorandom number generator so that we get
# back the same "random" numbers everytime the code
# is run.  Below, we seed it with the integer 12.
# The semi-colon suppresses any results from being
# displayed.
Random.seed!(12);

age = rand(30:65, 46)

gender = StatsBase.sample(["Female", "Male"], StatsBase.Weights([0.6, 0.4]), 46)

group = repeat(["Placebo"], 23)

append!(group, repeat(["Active"], 23))

hdl_cholesterol_before = rand(Distributions.Normal(1.24, 0.31), 23)

append!(hdl_cholesterol_before, rand(Distributions.Normal(1.24, 0.29), 23))

hdl_cholesterol_after = rand(Distributions.Normal(1.4, 0.35), 23)

append!(hdl_cholesterol_after, rand(Distributions.Normal(1.46, 0.42), 23))

weight_before = rand(Distributions.Normal(79.2, 16.5), 23)

append!(weight_before, rand(Distributions.Normal(72.1, 12), 23))

weight_after = rand(Distributions.Normal(79.3, 16.8), 23)

append!(weight_after, rand(Distributions.Normal(72.8, 12.6), 23))

dbp_before = rand(Distributions.Normal(71, 12.2), 23)

append!(dbp_before, rand(Distributions.Normal(73, 8), 23))

dbp_after = rand(Distributions.Normal(73.5, 8.2), 23)

append!(dbp_after, rand(Distributions.Normal(73.0, 8.2), 23))

# The for loop in Julia allows for constrained
# iteration.  Below, we iterate over the for loop
# 100 times (using a unit range object).  The aim
# is to add an element to an instantiated empty
# array based on a ternary operator.  A ternary
# operator functions as an if-else statement.
# It starts with a conditional.  If the conditional
# is true, the the value after the ? is returned.
# Else the value after the : is returned.
# The push! function adds the specified value to
# specified collection.
# The randn() function returns a random value from
# the standard normal distribution.

bmi_before = []

for i = 1:46
    placebo_bmi_before = rand(Distributions.Normal(26.8, 5))
    active_bmi_before = rand(Distributions.Normal(26.7, 3.7))
    push!(bmi_before, group[i] == "Placebo" ? placebo_bmi_before : active_bmi_before)
end

bmi_after = []

for i = 1:46
    placebo_bmi_after = rand(Distributions.Normal(27.0, 5.2))
    active_bmi_after = rand(Distributions.Normal(27.2, 5.2))
    push!(bmi_after, group[i] == "Placebo" ? placebo_bmi_after : active_bmi_after)
end

# The DataFrame function from the DataFrames package
# creates a dataframe object.  We have variable names
# and the data point values for that variable as
# arguments.

# Creating the dataframe object with variables.
df = DataFrames.DataFrame(
    ID = range(1, stop = 46),
    Age = age,
    Gender = gender,
    Group = group,
    HDLCholesterolBefore = hdl_cholesterol_before,
    HDLCholesterolAfter = hdl_cholesterol_after,
    HDLCholesterolDelta = hdl_cholesterol_before .- hdl_cholesterol_after,
    WeightBefore = weight_before,
    WeightAfter = weight_after,
    WeightDelta = weight_before .- weight_after,
    DBPBefore = dbp_before,
    DPBAfter = dbp_after,
    DBPDelta = dbp_before .- dbp_after,
    BMIBefore = bmi_before,
    BMIAfter = bmi_after,
    BMIDelta = bmi_before .- bmi_after
)

# We can change the type of column to categorical
# instead of the string type that they initially
# hold.

# Setting variables as categorical (must use
# symbol notation)
DataFrames.categorical!(df, :Group)

DataFrames.categorical!(df, :Gender)


# Slicing
# -------

# Slicing is the ability to select only certain
# data point values in a collection based on using
# references to the index (row and column number
# of a value).

# Rows 1, 2, and 3, for all columns
df[1:3, :]

# Rows 1, 2, and 3, for only the Age column (returns
# a vector)
df[1:3, :Age]

# Rows 1, 2, and 3, for Group and Age columns
df[1:3, [:Group, :Age]]

# Rows 1 and 3 for Group and Age columns
df[[1, 3], [:Group, :Age]]

# Alternative syntax
df[!, :Age] == df[:, :Age]

# Show all column but only if Age value is larger
# than 50
df[df.Age .> 50, :]

# Show all columns but only if Age
# is larger than 50 AND Group us Placebo
df[(df.Age .> 50) .& (df.Group .== "Placebo"), :]

# Show all columns but only for selected Age values
df[in.(df.Age, Ref([20, 30, 40])), :]

# We can create new dataframe object (sub-dataframes)
# that contain only a subset of the original data

# Creating a sub-dataframe object
placebo = df[(df.Group .== "Placebo"), :]

# Creating a sub-dataframe object
intervention = df[(df.Group .!= "Placebo"), :]


# Summary statistics
# --------------------

# Between the StatsBase and the Statistics packages, we find all
# the useful statistical tests that we use everyday.

# Summary statistics of Age values
# The results are displayed in the REPL
StatsBase.describe(df[!, :Age])

# Summary statistics of Age values (printing in the IDE)
StatsBase.summarystats(df[!, :Age])

# Median age
Statistics.median(df[:, :Age])

# Standard deviation of the Age values
Statistics.std(df[!, :Age])

# Mean and standrad deviation of the Age values
StatsBase.mean_and_std(df[!, :Age])

# Variance in the age
Statistics.var(df[!, :Age])

# First and third quartile of the Age values
Statistics.quantile(df[!, :Age], [0.25, 0.75])

# Interquartile range of the Age values
StatsBase.iqr(df[!, :Age])

Statistics.quantile(df[!, :Age], 0.75) - Statistics.quantile(df[!, :Age], 0.25)

# Range of the Age values
StatsBase.span(df[!, :Age])

# Mean and std of selected columns
StatsBase.describe(df[!, [:Age, :HDLCholesterolDelta]], :AVE => StatsBase.mean, :STD => StatsBase.std)

# Sample space elements of Group variable
unique(df[!, :Group])

# Frequency of sample space elements of Group variable
StatsBase.countmap(df[!, :Group])

# Median age of only the subjects older than 50 in the placebo group
Statistics.median(df[(df.Age .> 50) .& (df.Group .== "Placebo"), :][!, :Age])

# Functions are created with the function keyword.
function mean_std(x)
    return (Statistics.mean(x), Statistics.std(x))
end

# Mean and standard deviation of the Age values
mean_std(df.Age)

# Data visualization
# ------------------

# Set default plot size
Gadfly.set_default_plot_size(800px, 600px)

# Box-and-whisker plot of Age by Group
plot(
    df,
    x = :Group,
    y = :Age,
    Geom.boxplot,
    Guide.title("Age by group"),
    Theme(default_color="MidnightBlue", boxplot_spacing=100px)
)


# Density plot of Age by Group
p = plot(
    df,
    x = :Age,
    color = :Group,
    Geom.density,
    Guide.title("Age distribution by group")
)

# Save the file to disk
Gadfly.draw(SVG("density.svg", 1600px, 900px), p)

# Linear model
plot(
    df,
    x = "Age",
    y = "HDLCholesterolAfter",
    color = :Group,
    Geom.point,
    layer(
        Stat.smooth(method = :lm, levels = [0.95]),
        Geom.line,
        Geom.ribbon(fill = true),
    ),
    Guide.title("HDL as predicted by age for each group"),
    Theme(point_size = 10px, alphas = [0.5]),
)


# Inferential statistics
# ----------------------

# Below we answer the research question as to
# whether the cholesterol values for each
# group are from different distributions.
# We begin by summarizing the CholesterolDelta
# variable for the two groups.
StatsBase.describe(placebo.HDLCholesterolDelta)
StatsBase.describe(intervention.HDLCholesterolDelta)

# We can also calculate the confidence interval
# around the means.
HypothesisTests.confint(HypothesisTests.OneSampleTTest(placebo.HDLCholesterolDelta))
HypothesisTests.confint(HypothesisTests.OneSampleTTest(intervention.HDLCholesterolDelta))

# We can plot the two sample densities
plot(
    df,
    x = :HDLCholesterolDelta,
    color = :Group,
    Geom.density,
    Guide.title("Age distribution by group"),
)

pvalue(ExactOneSampleKSTest(placebo.HDLCholesterolDelta, Distributions.Normal()))
pvalue(ExactOneSampleKSTest(intervention.HDLCholesterolDelta, Distributions.Normal()))

# Below, we create QQ plots for the two groups
p1 = plot(x = placebo.HDLCholesterolDelta, y=Distributions.Normal(), Stat.qq, Geom.point)
p2 = plot(x = intervention.HDLCholesterolDelta, y=Distributions.Normal(), Stat.qq, Geom.point)

# The assumptions for the use of tparametric tests are
# not satisfied.

# We make use of the non-parametric Mann-Whitney-U test
pvalue(MannWhitneyUTest(placebo.HDLCholesterolDelta, intervention.HDLCholesterolDelta))
pvalue(TwoSampleTTest(placebo.HDLCholesterolDelta, intervention.HDLCholesterolDelta))
# We see a p-value of alrger than 0.05 and we cannot reject
# our null-hypothesis.
