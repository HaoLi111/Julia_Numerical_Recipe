# Monte-Carlo Applications

# Type 1
# path like integration
# ∫₀¹ e
# todo


# Type 2
# Volume-like integration


# E.g. evaluate π

# 1. generate n points within a unit □
#    enclosed by xlim<-[0 1]
#    and         ylim<-[0 1]

n = 1000
x = rand(n)
y = rand(n)

# 2. Judge # of pts in the unit ◷
s = 0
for i in 1:n# I hate for loop , there's a simpler version below
    if (x[i]^2 + y[i]^2)<=1
        global s+=1
    end
end
s

# Area of ▧ / Area of ◍  = 4/π
π_est = 4s/n
π_est


# Vectorize? replace 2 with
#even faster?
@time size(zeros(n)[x.^2+y.^2 .<=1])
#0.000070 seconds (27 allocations: 42.813 KiB)
#Compared with

s=0
@time for i in 1:n
    if (x[i]^2 + y[i]^2)<=1
        global s+=1
    end
end
#0.000220 seconds (7.75 k allocations: 136.734 KiB)

π_est = 4s/n
π_est


plot(x,y;seriestype="scatter")
plot!(0:.01:1,sqrt.(1 .-(0:.01:1).^2))
