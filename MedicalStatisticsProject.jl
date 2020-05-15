# Package import
# --------------

using DataFrames  # A package for data manipulation
using Distributions  # A package for using statistical
# distributions
using Gadfly  # A package for creating graphs and plots
using HypothesisTests  # A package with many statisical
# tests
import StatsBase  # A package with useful statistical
# functions
import Statistics  # Built-in Julia package with
# common statistical tests
import Random  # A package to create random values
import CSV  # Package to import and export CSV files
using Query

# Importing dataframe
# -----------------------

# Import csv file from internal drive
df = CSV.read("JuliaForMedicalStatistics.csv")

# Display the first five samples
first(df, 5)

# Display all the variable names (as symbols)
print(names(df))

# Display the dimensions of the dataframe object
size(df)

# Create a split dataframe on the sample space elements
# of the Group variable
df_split = DataFrames.groupby(df, :Group)

# Summary statistics
# --------------------

# Summary statistics of Age variable
StatsBase.summarystats(df.Age)

# Mean and standard deviation of Age variable split
# by the Group variable
DataFrames.combine(
    df_split,
    :Age => Statistics.mean,
    :Age => Statistics.std
)

# We can apply a self-created function too
DataFrames.combine(
    df_split,
    :Age => mean_std
)

# Mean of CholesterolDelta split by Group variable
DataFrames.combine(df_split, :CholesterolDelta => mean_std)

# Calculation on variables
DataFrames.combine(x -> x[:CholesterolBefore] - x.CholesterolAfter, df_split)

# Use a do block to calculate summary statistics
DataFrames.combine(df_split) do df
    (average = Statistics.mean(df.Age),
    standard_dev = Statistics.std(df.Age),
    variance = Statistics.var(df.Age))
end


# Data queries
# --------------

# Create a dataframe object of all subjects older than 49 and
# only include the Group and CholesterolDelta variables
older_dplyr =
    df |> @filter(_.Age >= 50) |>
    @map({_.Group, _.CholesterolDelta}) |> DataFrames.DataFrame

older_linq = @from i in df begin
    @where i.Age >= 50
    @select {i.Group, i.CholesterolDelta}
    @collect DataFrames.DataFrame
end




# Data visualization
