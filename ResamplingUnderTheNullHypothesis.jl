# RESEAMPLING UNDER THE NULL HYPOTHESIS


## In this tutorial

# - Seeding the pseudo-random number generator for reproducible results
# - Creating a DataFrame
# - Sample from a set of categorical values using StatsBase
# - Sample from a normal distribution using Distributions
# - Making sub-DataFrames using the filter function (conditional selection)
# - Extracting vectors from DataFrames
# - Summary statistics of a continuous numerical variable using StatsBase
# - Histogram using PlotlyJS
# - Shuffle a vector
# - Calculate a p-value using HypothesisTests


## Packages

using DataFrames
using Random
using Distributions
using StatsBase
using PlotlyJS
using HypothesisTests


## Data

n = 1000 # Sample size

Random.seed!(12)
df = DataFrames.DataFrame(
    ID = 1:n,
    Group = StatsBase.sample(["I", "II"], n),
    Mass = rand(Distributions.Normal(100, 10), n)
)


## Making sub-DataFrames

group_I = filter(row -> row.Group == "I", df)
group_II = filter(row -> row.Group == "II", df)


## Extracting vectors from a DataFrame

mass = collect(df.Mass)

mass_I = collect(group_I.Mass)
mass_II = collect(group_II.Mass)

n_I = length(mass_I)
n_II = length(mass_II)


## Descriptive statistics

StatsBase.describe(mass_I)
describe(mass_II)


## Data visualization

PlotlyJS.plot(
    df,
    x = :Mass,
    color = :Group,
    kind = "histogram",
    marker = attr(
        opacity = 0.5
    ),
    Layout(
        title = "Histogram of mass per group",
        barmode = "overlay"
    )
)

## Difference in means (test statistic)

difference_in_means = mean(mass_I) - mean(mass_II)

## Reassignment under the null hypothesis

means = []
resamples = 5000

for i in 1:resamples
    shuffled_mass = Random.shuffle(mass)
    new_group_I = shuffled_mass[1:n_I]
    new_group_II = shuffled_mass[n_I + 1:n]
    append!(means, mean(new_group_I) - mean(new_group_II))
end

PlotlyJS.plot(
    [
        histogram(
            x = means,
            opacity = 0.7
        )
    ],
    Layout(
        title = "Distribution of means"
    )
)

## Probability of difference in means

(sum(means .< difference_in_means) + sum(means .> -difference_in_means)) / resamples

HypothesisTests.pvalue(EqualVarianceTTest(mass_I, mass_II))