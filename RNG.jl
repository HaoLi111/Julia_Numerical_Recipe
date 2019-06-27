# rng

#random number generators
#Computers are not capable of generating true random numbers
#but can generate sequences with statistical randomness


# 1 Julia's implemented solution
rand(100)

# LCP psuedo solutions

function rng_Park_Miller1998(n;x1=3)
    x=zeros(n)
    x[1] = x1
    u = zeros(n)
    for i in 2:n
        x[i] =mod(16807*x[i-1],2147483647)#7^5 \ 2^31-1 31th mason prime
    end
    u = x./2147483647
    return u
end
# implemented in Matlab 4 1990

rng_Park_Miller1998(100;x1=3)

function rng_randu(n;x1=3)
    x = zeros(n)
    x[1]=x1
    for i in 2:n
        x[i] = mod(65539*x[i-1],2147483648)
    end
    u = x./2147483648
    return u
end

rng_randu(100)


# iterative psudo solutions

function rng_LMap(n;x1=.4)
    x = zeros(n)
    x[1] = x1
    for i in 2:n
        x[i]=1-2*x[i-1]^2
    end
    return((x./2) .+.5)
end

rng_LMap(100)

# self - avoiding solutio

function rng_Halton(n;x1 = 3)
    b = zeros(Int(ceil(log(n)/log(x1))))
    u = zeros(n)
    for j in 1:n
        i = 1
        b[1] = b[1]+1
        while b[i]>(x1-1+eps())
            b[i]=0
            i=i+1
            b[i]=b[i]+1
        end

        u[j]=0
        for k=1:length(b)
            u[j] = u[j]+b[k]*Float64(x1)^(-k);
        end
    end
    return u
end

rng_Halton(100)
