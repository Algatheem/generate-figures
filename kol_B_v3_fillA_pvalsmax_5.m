function [ pvalsmax,pvalsimag] = kol_B_v3_fillA_pvalsmax_5(k,ell,epsi,B,eta,N,beta,alpha,gamma)

A=kol_B_v3_fillA_gamma_1(k,ell,epsi,B,eta,N,beta,alpha,gamma);

p=eig(A) ;
preal = real(p) ;
pimag = imag(p) ;
pmax=max(preal) ;

jj = find ( abs(preal - pmax) < 1e-10) ;

if length(jj) == 1
    jj1 = jj ;
elseif imag(p(jj(1))) > 0
    jj1 = jj(1) ;
else
    jj1 = jj(2) ;
end

pvals=p(jj1) ;

pvalsmax  = real(pvals) ;
pvalsimag = imag(pvals) ;

end