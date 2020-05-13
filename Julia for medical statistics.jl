# JULIA FOR MEDICAL STATISTICS
# ============================


# Package import
# --------------

using DataFrames
using Distributions
using Gadfly
using HypothesisTests
using StatsBase
using Statistics
using Random
using CSV
using Query


# Creating a dataframe object
# -------------------------------

groups = ["Placebo", "Interventions"]  # Creating list objects
stages = ["I", "II", "III", "IV"]  # Creating list objects

Random.seed!(12);  # For reproducible results
# Creating the dataframe object with variables: ID, Group, Stage, Age,
# Cholesterol and with 100 subjects
df = DataFrame(ID = range(1, stop = 100), Group = StatsBase.sample(groups, 100),
    Stage = StatsBase.sample(stages, 100), Age = rand(18:55, 100),
    Cholesterol = round.(rand(Distributions.Normal(7,2), 100), digits = 1))

DataFrames.categorical!(df, :Group)  # Setting variables as categorical
DataFrames.categorical!(df, :Stage)


# Slicing
# -------

df[1:3, :]  # Rows 1, 2, and 3, for all columns

df[1:3, :Age]  # Rows 1, 2, and 3, for only the Age column (returns a vector)

df[1:3, [:Group, :Age]]  # Rows 1, 2, and 3, for Group and Age columns

df[[1, 3], [:Group, :Age]]  # Rows 1 and 3 for Group and Age columns

df[!, :Age] == df[:, :Age]  # Alternative syntax

df[df.Age .> 50, :]  # Show all column but only if Age value is larger than 50

df[(df.Age .> 50) .& (df.Group .== "Placebo"), :]  # Show all columns but only if Age is larger than 50 AND Group us Placebo

df[in.(df.Age, Ref([20, 30, 40])), :]  # Show all columns but only for selected Age values

placebo = df[(df.Group .== "Placebo"), :]  # Creating a sub-dataframe object
intervention = df[(df.Group .!= "Placebo"), :]  # Creating a sub-dataframe object


# Summary statistics
# --------------------

StatsBase.describe(df[!, :Age]) # Summary statistics of Age values

StatsBase.summarystats(df[!, :Age])  # Summary statistics of Age values

Statistics.std(df[!, :Age])  # Standard deviation of the Age values

StatsBase.mean_and_std(df[!, :Age])  # Mean and standrad deviation of the Age values

Statistics.quantile(df[!, :Age], [0.25, 0.75])  # First and third quartile of the Age values

StatsBase.iqr(df[!, :Age])  # Interquartile range of the Age values

StatsBase.span(df[!, :Age])  # Range of the Age values

StatsBase.describe(df[!, [:Age, :Cholesterol]], :AVE => StatsBase.mean, :STD => StatsBase.std)  # Mean and std of selected columns

unique(df[!, :Group])  # Sample space elements of Group variable

StatsBase.countmap(df[!, :Group])  # Frequency of sample space elements of Group variable


# Data visualization
# ------------------

Gadfly.set_default_plot_size(1200px, 600px)  # Set default plot size

# Bar chart of Groups
Gadfly.plot(
    df,
    x = "Group",
    color = "Group",
    Geom.histogram,
    Guide.title("Frequency count of groups"),
    Guide.ylabel("Count")
)

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
