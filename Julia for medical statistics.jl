# JULIA FOR MEDICAL STATISTICS
# ============================


# Introduction
# ------------

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
# to a language such as Python, which is a language
# where the code is interpreted as it is executed.
# The compilation of code is one of the reasons why Julia
# is so fast at code execution.

# Everthing in Julia is a type.  Unlike C and other
# strongly typed languages, Julia infers the type
# as required and makes use of multiple dispatch
# for type inference.  This does not prevent you from
# specifying types.  Specifying type does indeed help to
# speed up code execution even further as the compiled
# code is optimized when compiled.

# Julia is easy to learn and use.  The syntax is very
# simuilar to Python.

# Below, we start by importing some packages which we
# will use in this file.


# Package import
# --------------

# Hit SHIFT+ENTER (SHIFT+RETURN) at the end of a line of code
# to execute it.  Some of the packages might need precompilation
# before it is ready to use.

using DataFrames  # A package for data manipulation
using Distributions  # A package for using statistical distributions
using Plots  # A package for creating graphs and plots
plotly()  # USing Plotly as the backend
using HypothesisTests  # A package with many statisical tests
using StatsBase  # A packahe with useful statistical functions
using Statistics  # built-in Julia package with common statistical tests
using Random  # A package to create random values
using CSV  # Package to import and export CSV files
using Query  # A package to manipulate data

# Creating a dataframe object
# -------------------------------

# Julia has different collections.  Below, we use a list object.
# List obejcts are indicated by the square bracket notation.  Elements
# of a list are separated by commas.  Lists are mutable (the individual
# elements can be altered at a later stage).  We can also use a mix
# of element types such as integers, strings, and so on.  Note that
# we are using strings elements below.  Strings are denoted by the
# use of double quotes (single quotes denote characters).
# The assigment operator, =, assigns what is to the right of it (a list
# object in our two examples below) to what is to its left (in this case,
# a computer variable name).
# Computer variable names are chosen by us.  Keep them short-and-sweet,
# but indicative of what content they hold.  Don't use illegal characters
# or actual Julia keywords (functions).  Lowercase letter are preferred.
# Use underscore to concatenate word together (called snake-case), i.e.
# my_variable_name.

# Creating list objects
groups = ["Placebo", "Interventions"]
stages = ["I", "II", "III", "IV"]

# The seed! function in the Random package seeds the pseudorandom
# number generator so that we get back the same "random" numbers
# everytime the code is run.  Below, we seed it with the integer 12.
# The semi-colon suppresses any results from being displayed.

Random.seed!(12);  # For reproducible results

# The DataFrame function from the DataFrames package creates a dataframe
# object.  We have variable names and the data point values for that
# viriable as arguments.

# Creating the dataframe object with variables: ID, Group, Stage, Age,
# Cholesterol and with 100 subjects
df = DataFrames.DataFrame(
ID = range(1, stop = 100),
Group = StatsBase.sample(groups, 100),
Stage = StatsBase.sample(stages, 100),
Age = rand(18:55, 100),
Cholesterol = round.(rand(Distributions.Normal(7,2), 100), digits = 1)
)

# We can change the type of column to categorical instead of the
# string type that they initially hold.
DataFrames.categorical!(df, :Group)  # Setting variables as categorical
DataFrames.categorical!(df, :Stage)


# Slicing
# -------

# Slicing is the ability to select only certain data point values
# in a collection based on using references to the index (row and
# column number of a value).

# Rows 1, 2, and 3, for all columns
df[1:3, :]

# Rows 1, 2, and 3, for only the Age column (returns a vector)
df[1:3, :Age]

# Rows 1, 2, and 3, for Group and Age columns
df[1:3, [:Group, :Age]]

# Rows 1 and 3 for Group and Age columns
df[[1, 3], [:Group, :Age]]

# Alternative syntax
df[!, :Age] == df[:, :Age]

# Show all column but only if Age value is larger than 50
df[df.Age .> 50, :]

# Show all columns but only if Age
# is larger than 50 AND Group us Placebo
df[(df.Age .> 50) .& (df.Group .== "Placebo"), :]

# Show all columns but only for selected Age values
df[in.(df.Age, Ref([20, 30, 40])), :]

# We can create new dataframe object (sub-dataframes) that
# contain only a subset of the original data

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

# Median age (using alternative syntax)
Statistics.median(df[:, "Age"])

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
StatsBase.describe(df[!, [:Age, :Cholesterol]], :AVE => StatsBase.mean, :STD => StatsBase.std)

# Sample space elements of Group variable
unique(df[!, :Group])

# Frequency of sample space elements of Group variable
StatsBase.countmap(df[!, :Group])

# Median age of only the subjects older than 50 in the placebo group
Statistics.median(df[(df.Age .> 50) .& (df.Group .== "Placebo"), :][!, :Age])


# Data visualization
# ------------------

#Gadfly.set_default_plot_size(1200px, 600px)  # Set default plot size
Plots.theme(:ggplot2)

# Bar chart of Groups
Plots.histogram(df.Age,
bins = 10,
fillalpha = 0.5,
linewidth = 0,
title = "Frequency distributionof age",
xlabel = "Age",
ylabel = "Frequency")

# Box-and-whisker plot of Age by Group
Gadfly.plot(
    df,
    x = :Group,
    y = :Age,
    Geom.boxplot,
    Guide.title("Age by group"),
    Theme(default_color="MidnightBlue", boxplot_spacing=100px)
)



# Density plot of Age by Group
p = Gadfly.plot(
    df,
    x = :Age,
    color = :Group,
    Geom.density,
    Guide.title("Age distribution by group")
)
p  # Plot
Gadfly.draw(SVG("density.svg", 1600px, 900px), p)  # Save the file to disk

# Linear model
Gadfly.plot(
    df,
    x = "Age",
    y = "Cholesterol",
    color = :Group,
    Geom.point,
    layer(Stat.smooth(method=:lm, levels=[0.95]), Geom.line, Geom.ribbon(fill=true)),
    Guide.title("Cholesterol as predicted by age foreach group"),
    Theme(point_size = 10px, alphas=[0.5])
)


# Inferential statistics
# ----------------------

Statistics.mean(placebo.Cholesterol)
Statistics.mean(intervention.Cholesterol)

HypothesisTests.ci(OneSampleTTest(placebo.Cholesterol))

HypothesisTests.pvalue(EqualVarianceTTest(placebo.Cholesterol, intervention.Cholesterol))


# Importing dataframe
# -----------------------

df = CSV.read("data.csv");  # Import csv file from internal drive
first(df, 5)  # Display the first five samples
print(names(df))  # Display all the variable names (as symbols)
size(df)  # Display the dimensions of the dataframe object

df_split = groupby(df, :Group)  # Create a split dataframe on the sample space elements of the Group variable

# Summary statistics
# --------------------

StatsBase.summarystats(df.CholesterolDelta)  # Summary statistics of Age variable

DataFrames.combine(df_split, :Age => Statistics.mean)  # Mean of Age variable split by the Group variable

DataFrames.combine(df_split, :CholesterolDelta => Statistics.mean)  # Mean of CholesterolDelta split by Group variable

DataFrames.combine(x -> x[:CholesterolBefore] - x.CholesterolAfter, df_split)  # Calculation on variables

# Use a do block to calculate summary statistics
DataFrames.combine(df_split) do df
    (average = Statistics.mean(df.Age),
    standard_dev = Statistics.std(df.Age),
    variance = Statistics.var(df.Age))
end


# Data queries
# --------------

# Create a dataframe object of all subjects older than 49 an donly include the Group and CholesterolDelta variables
older_dplyr = df |> @filter(_.Age >= 50) |> @map({_.Group, _.CholesterolDelta}) |> DataFrame
older_linq = @from i in df begin
    @where i.Age >= 50
    @select {i.Group, i.CholesterolDelta}
    @collect DataFrame
end




# Data visualization
