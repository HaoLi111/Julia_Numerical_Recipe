#numerical 1d integration


#integrate func below
f(x) =sin(x)
#over
xmin = -π
xmax = π
#with number of divisions (linear)
n=1000

#Trapeziod rule
Δ = (xmax - xmin)/n
xseq = range(xmin,xmax,length = n+1)
s_trapeziod = Δ/2 *(sum(f.(xseq))+sum(f.(xseq[2:end-1])))

#error of trapeziod estimation for constinuous second differentiable f
#e_trapeziod = (xmax - xmin)^3/12*n^2 * max(abs(f))
# see this slide for more info
# https://slideplayer.com/slide/6419579/


#Mid-point rule
s_Midp = sum(f.(xseq[2:end] - xseq[1:end-1]))*Δ

# n has to be even, t.s., n+1 is odd, there are n+1 terms to play with
iseven(n)

s_Simpson = Δ/3 * sum([[1]; repeat([4; 2; 4; 1], Int(n/4))] .* f.(xseq))
