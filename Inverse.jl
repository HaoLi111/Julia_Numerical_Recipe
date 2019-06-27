# Inverse and soln of matrix
# Gaussian
# generally JL handles eqns and invs


# we use Finverse to denote function to find inverse
# 🙈

function Finverse_Gaussian(x)
    n = Int(sqrt(length(x)))
    x = reshape(x,n,n)
    I = zeros(n,n)
    for i in 1:n
        I[i,i] =1
    end
    for i in 1:(n-1)
        for j in (i+1):n
            m = x[j,i]/x[i,i]
            x[j,i:end] = x[j,i:end].-x[i,i:end].*m
            I[j,:] = I[j,:].-I[i,:].*m
        end
    end
    for i in n:-1:2
        for j in (i-1):-1:1
            m = x[j,i]/x[i,i]
            x[j,i]=0
            I[j,:] =I[j,:] .- I[i,:].*m
        end
    end
    for i in 1:n
        I[i,:] = I[i,:]./x[i,i]
    end
    return I
end

function Fsolve_Gaussian(x,b)
    n=length(b)
    x = reshape(x,n,n)
    for i in 1:(n-1)
        for j in (i+1):n
            m = x[j,i]/x[i,i]
            x[j,i:end] = x[j,i:end].-x[i,i:end].*m
            b[j] = b[j]-b[i]*m
        end
    end
    return b
end

Fsolve_Gaussian([1 2 3; 4 5 6;7 8 9],[1;2;3])
[1 2 3; 4 5 6;7 8 9]*[1 ,-2, 0]




#Finverse_Gaussian([1 2;6 7])

#[1 2;6 7]*Finverse_Gaussian([1 2;6 7])


# safer version of Gaussian solve -judge and shift terms with 0


#function Fsolve_Gaussian_safely(x,b)
#    n=length(b)
#    for j in 1:(n-1)
#    end
#end

x = [1 2 3;4 5 6;7 8 9]

function LU(x)
    n=Int(sqrt(length(x)))
    for j in 1:(n-1)
        for i in (j+1):n
            m = x[i,j] / x[j,j]
            x[i,(j+1):n] = x[i,(j+1):n].-m.*x[j,(j+1):n]
            x[i,j] = m
        end
    end
    return x
end
LU(x)
