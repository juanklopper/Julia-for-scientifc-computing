# F RATIO SIMULATION BY REASSIGNMENT UNDER THE NULL HYPOTHESIS

## Packages

using DataFrames
using Random
using Distributions
using StatsBase
using StatsPlots


## F distribution

StatsPlots.plot(Distributions.FDist(2, 297), fill = (0, 0.5, :deepskyblue), label = "F")


## Data

n = 300
n_group = Int(n / 3)

id = 1:n

group = vcat(
    repeat(["I"], n_group),
    repeat(["II"], n_group),
    repeat(["III"], n_group)
)

μ1 = 98
μ2 = 100
μ3 = 105
σ1 = 20
σ2 = 15
σ3 = 10

Random.seed!(12)
mass = vcat(
    rand(Distributions.Normal(μ1, σ1), n_group),
    rand(Distributions.Normal(μ2, σ2), n_group),
    rand(Distributions.Normal(μ3, σ3), n_group)
)

df = DataFrames.DataFrame(
    ID = id,
    Group = group,
    Mass = mass
)

group_I = filter(r -> r.Group == "I", df)
group_II = filter(r -> r.Group == "II", df)
group_III = filter(r -> r.Group == "III", df)

mass_all = collect(df.Mass)
mass_I = collect(group_I.Mass)
mass_II = collect(group_II.Mass)
mass_III = collect(group_III.Mass)


## Summary statistics

StatsBase.describe(mass_I)
StatsBase.describe(mass_II)
StatsBase.describe(mass_III)


## Data visualization

@df df boxplot(string.(:Group), :Mass, label = "Mass")

## Test statistic

mean_mass = mean(mass_all)
mean_mass_I = mean(mass_I)
mean_mass_II = mean(mass_II)
mean_mass_III = mean(mass_III)

p_mean = 1
p_fit = 3

ss_mean = sum((mean_mass .- mass).^2)
ss_fit_I = sum((mean_mass_I .- mass_I).^2)
ss_fit_II = sum((mean_mass_II .- mass_II).^2)
ss_fit_III = sum((mean_mass_III .- mass_III).^2)

ss_fit = ss_fit_I + ss_fit_II + ss_fit_III

f_ratio = ((ss_mean - ss_fit) / (p_fit - p_mean)) / ((ss_fit) / (n - p_fit))


## Simulation

f_ratio_sampling = []

reassign = 20000

for i in 1:reassign
    shuffle_mass = Random.shuffle(mass)
    mean_shuffle_mass = mean(shuffle_mass)
    ss_mean_reassign = sum((mean_shuffle_mass .- shuffle_mass).^2)

    new_group_I = shuffle_mass[1:100]
    mean_new_group_I = mean(new_group_I)
    new_group_II = shuffle_mass[101:200]
    mean_new_group_II = mean(new_group_II)
    new_group_III = shuffle_mass[201:300]
    mean_new_group_III = mean(new_group_III)

    fit_I = sum((mean_new_group_I .- new_group_I).^2)
    fit_II = sum((mean_new_group_II .- new_group_II).^2)
    fit_III = sum((mean_new_group_III .- new_group_III).^2)
    ss_fit_reassign = fit_I + fit_II + fit_III

    reassign_f_ratio = ((ss_mean_reassign - ss_fit_reassign) / (p_fit - p_mean)) / ((ss_fit_reassign) / (n - p_fit))

    append!(f_ratio_sampling, reassign_f_ratio)
end

StatsPlots.histogram(f_ratio_sampling, nbins = 60, fillalpha = 0.5, label = "F sampling")


## p value

sum(f_ratio_sampling .> f_ratio) / reassign

StatsBase.countmap(f_ratio_sampling .> f_ratio)