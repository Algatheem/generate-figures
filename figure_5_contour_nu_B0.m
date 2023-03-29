
clear all
close all

Bvals    = linspace( 0.3, 0.8, 100);
epsivals = linspace(0.01, 0.4, 100);  % values of nu 

etavals=2*epsivals;   % magnetic Prandtl number of P = 1/2

ell=0;
N=8;

for iepsi=1:length(epsivals)
    
    disp(iepsi)

    for iB=1:length(Bvals)

        [pvalsmax,pvalsimag]= kol_B_v3_fillA_pvalsmax_v(ell, epsivals(iepsi),Bvals(iB),etavals(iepsi),N);

        prealcontour(iepsi,iB)=pvalsmax ;

        pimagcontour(iepsi,iB)=pvalsimag ;

    end

end

%% plotting section

figure(1)
set( gca                       , ...
    'FontName'   , 'Helvetica' , ...
    'FontSize'   , 15        );
colormap jet
shading flat
pcolor(epsivals,Bvals,prealcontour');
xlabel('$\nu$','Interpreter','LaTex','fontsize',14)
ylabel('$B_0$','Interpreter','LaTex','fontsize',14)
title('Re p','fontsize',14)
shading flat
colorbar
hold on
cvals = [10^-6  10^-6] ;
contour(epsivals, Bvals,prealcontour', cvals,'w-');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
set( gca                       , ...
    'FontName'   , 'Helvetica' , ...
    'FontSize'   , 10        );
colormap jet
shading flat
pcolor(epsivals,Bvals,pimagcontour');
xlabel('$\nu$','Interpreter','LaTex','fontsize',14)
ylabel('$B_0$','Interpreter','LaTex','fontsize',14)
title('Im p','fontsize',14)
shading flat
colorbar
hold on
 
