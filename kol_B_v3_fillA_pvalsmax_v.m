function [ pvalsmax, pvalsimag ] = kol_B_v3_fillA_pvalsmax_v(ell, epsi,B, eta, N)

kvals=linspace(0.001,1.0,100);

for i=1:length(kvals)
    
    k = kvals(i) ; 
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
    
    pmax = p(ind1) ; 

    pvals(i)=pmax;
        
end

pvalsmax  = max(real(pvals)) ;

ind = find ( abs(real(pvals) - pvalsmax) < 1e-10) ;

pvalsimag = imag(pvals(ind)) ;

end