# Root finder functions for 1d func
# Newton's Method, Linear Approximation
# Note that you can also find root by applying optimizer on an Error function
# ϵ(x,...)




# Newton's Method
# f1 is δf╱δx
function solve_Newton(f,f1,par;nlim = 1e4,ϵ=1e-3)
    for i in 1:nlim
        par1 = par - f(par)/f1(par)
        if ϵ>abs(par1 -par)
            return(par1)
        end
        par=par1
    end
    println("Warning! unconverged after" * string(nlim) *"Iterations.")
    return(par1)
end


# Linear Approximation
function solve_Linear_Approx(f,par1,par2;nlim = 1e4,ϵ=1e-3)
    #must follow :x1 * x2<0
    #             par1<par2
    for i in 1:nlim
        x1 = f(par1)
        x2 = f(par2)
        global par3 = par1+(par2 - par1)*abs(x1/(x1-x2))
        if abs(par3-par1)<ϵ
            if abs(par3 - par2)<ϵ
                return par3
            end
        else
            if (par3*par1)>0
                par1=par3
            else (par3*par2)>0
                par2=par3
            end
        end
    end
    println("Warning! unconverged after"*string(nlim)*"iterations.")
    return par3
end


#----------------------------------------------------------------
using Plots
x = 1:.1:4
y = sin.(x)
plot(x,y)
plot!(x,zeros(length(x)))

f(x) = sin(x)
f1(x) = cos(x)


solve_Newton(f,f1,3)

solve_Linear_Approx(f,3,4)
#----------------------------------------------------------------
