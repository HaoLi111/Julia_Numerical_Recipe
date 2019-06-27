# Improved Newton's Method

# Safe version - disclosed version


#par1 - lower bound
#par2 - upper bound
function solve_Newton_safely(f,f1,par,par1,par2;nlim = 1e4,ϵ=1e-3)
    for i in 1:nlim
        par3 = par - f(par)/f1(par)
        if ϵ>abs(par3 -par)
            return(par3)
        elseif par3<=par1
            par3 = (par+par1)/2
        elseif par3>=par2
            par3 = (par+par2)/2
        end

        par=par3
    end
    println("Warning! unconverged after" * string(nlim) *"Iterations.")
    return(par3)
end

#where f1 is a constant (avoid finding gradient)
function solve_constGrad(f,f1,par;nlim = 1e4,ϵ=1e-3)
    for i in 1:nlim
        par3 = par - f(par)/f1
        if ϵ>abs(par3 -par)
            return(par3)
        end
        par=par3
    end
    println("Warning! unconverged after" * string(nlim) *"Iterations.")
    return(par3)
end


# by cotangent value
# where
# par1 and par2 are 2 starting points( to give 1st gradient value)
function solve_cotangent(f,par1,par2;nlim = 1e4,ϵ=1e-3)
    for i in 1:nlim
        par3 = par2 - f(par2)*(par2 - par1)/(f(par2) - f(par1))
        if ϵ>abs(par3 -par2)
            return(par3)
        end
        par1 = par2;par2 = par3
    end
    println("Warning! unconverged after" * string(nlim) *"Iterations.")
    return(par3)
end

using Plots

x = 0:.1:4
y=sin.(x)
plot(x,y)
plot!([0,4],[0,0])
solve_cotangent(sin,3,4)
