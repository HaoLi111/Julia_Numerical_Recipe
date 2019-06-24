#Eulers

function dyn_update_Euler(f,Δt;par)
    return(par .+ f(par).*Δt)
end

function dyn_update_RT4(f,Δt;par)
    #todo

end

function dyn_update_advMidP(f,Δt;par)
    #todo
end
