# determinant

function Fdet(x)
    n = Int(sqrt(length(x)))
    if n==2
        return(x[1,1]*x[2,2] - x[1,2]*x[2,1])
    elseif isodd(n)
        Sign = repeat([1,-1],Int(ceil(n/2)))[1:n].*x[1,:]

        #println(s)
    else
        Sign = repeat([1,-1],Int(round(n/2))).*x[1,:]
    end
    s=0
    for i in 1:n
        s+=Sign[i] * Fdet(x[2:n,append!(collect(1:(i-1)),collect((i+1):n))])
    end
    return s
end


Fdet([10 20 10;4 5 6;2 3 5])

Fdet([1 4;2 3])
