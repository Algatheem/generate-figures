function [pvalsmax] = kol_B_v3_fillA_pvalsmax_v2(k,ell,epsi,B, eta, N)

A=kol_B_v3_fillA(k,ell,epsi,B,eta,N);

p=eig(A) ;
preal = real(p) ;
pimag = imag(p) ;
pmax=max(preal) ;

ind = find ( abs(preal - pmax) < 1e-10) ;

if length(ind) == 1
    ind1 = ind ;
elseif imag(p(ind(1))) > 0
    ind1 = ind(1) ;
else
    ind1 = ind(2) ;
end

pvalsmax = p(ind1) ;

end