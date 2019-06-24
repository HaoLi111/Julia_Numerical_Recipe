# Fourier Transform and visualization of which

using Plots
# idk why I just like to load plot function first
# - weired isn't it
gr()
# rotation factor

W_rotate(N::Int)=exp(-2*im*π/N)

W_rotate.(1:10)
plot(1:100,W_rotate.(1:100))#takes long if runned for the 1st time
plot(W_rotate.(1:100))#

#Amplitute can be calcd with abs(x::Complex)
abs(1+im)


# DFT and visualization


function dft(x::Array)
    n = length(x)
    r = Array{Any,1}(missing,n)
    #Note how sum is used to aggregate results after broadcasting
    for i in 1:n
        r[i]=sum(x.*exp(1).^(-(i-1)*collect(0:(n-1)).*(2*π*im/n)))
    end
    return(r)
end

x=1:.1:2π
y =sin.(x)
plot(x,y)
plot(1:length(x),dft(y))
plot(1:length(x),abs.(dft(y)))
plot(1:length(x),real.(dft(y)))
# FFT and visualization of FFT


function idft(x::Array)
    n = length(x)
    r = Array{Any,1}(missing,n)
    #Note how sum is used to aggregate results after broadcasting
    for i in 1:n
        r[i]=sum(x.*exp(1).^(+(i-1)*collect(0:(n-1)).*(2*π*im/n)))#change - to+
    end
    return(r)
end

#below inspired by
#https://www.mathworks.com/matlabcentral/answers/3187-fft-recursive-code-problem


function p2_fft_rec(f)
  n = length(f)
  if (n == 1)
    return(f)
  else
    a= p2_fft_rec(f[1:2:n])
    b= p2_fft_rec(f[2:2:n]).*exp(1).^(-2/n*π*im.*collect(0:1:(n/2)-1))
    return append!(a+b,a-b)
  end
end


function p2_fft(x)
  n = length(x)
  N = 2^(ceil(log2(n)))
  x = append!(x,repeat([0],Int64(N - n)))
  return(p2_fft_rec(x)[1:n])
end



#p2_fft(collect(1:4))
#inspired by
#https://in.mathworks.com/help/signal/ug/power-spectral-density-estimates-using-fft.html

function p2_psd_fft(x)
  N = length(x)
  xdft = p2_fft(x)[1:Int(N/2+1)]
  psdx = (1/N/N) * abs.(xdft).^2
  psdx[2:end] = 2*psdx[2:end]
  freq = 0:1:(N/2)
  return(Dict("freq"=>freq,"psdx"=>psdx,"psd_est"=>10*log10.(psdx)))
end
