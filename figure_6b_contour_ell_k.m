clear all
close all

kvals =linspace(-0.0,0.15);
ellvals = linspace(-0.02,0.02);

epsi =0.2;  % value of nu 
eta=2*epsi;

B=0.7;

N = 16;

for ik=1:length(kvals)

    disp(ik)
    
    for iell=1:length(ellvals)

        pvalsmax = kol_B_v3_fillA_pvalsmax_v2(kvals(ik),ellvals(iell),epsi,B,eta,N);

        pvalsmaxreal(ik,iell) = real(pvalsmax) ;

    end
end

figure(1)
set( gca                       , ...
    'FontName'   , 'Helvetica' , ...
    'FontSize'   , 10        );
colormap jet
shading flat
pcolor(ellvals,kvals,pvalsmaxreal);
xlabel('$\ell$','Interpreter','LaTex','fontsize',14)
ylabel('$k$',   'Interpreter','LaTex','fontsize',14)
title('Re p','fontsize',14)
shading flat
colorbar
hold on

cvals = [0  0] ;
contour(ellvals, kvals,pvalsmaxreal, cvals, 'w-');

