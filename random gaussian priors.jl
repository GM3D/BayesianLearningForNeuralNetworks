
versioninfo()
using LinearAlgebra

using Plots; gr()

using Distributions

H = 10000

omega = 1.0
sigma = 1.0
sigma_v = omega / sqrt(H)
d0 = Normal(0.0, sigma)
d1 = Normal(0.0, sigma_v)

a = rand(d0, H);
u = rand(d0, H);
b = rand(d0);
v = rand(d1, H);

plot([a, v])

h1(x) = tanh.(a + u * x)
h2(x) = sign.(a + u * x)

f1(x) = b + dot(v, h1(x))
f2(x) = b + dot(v, h2(x))

x = -5:0.01:5

plot(x, [f1.(x), f2.(x)])

savefig("gaussian_prior_H10000.png")
