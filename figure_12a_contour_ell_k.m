clear all
close all
 
kvals   = linspace(0,     0.15, 100);
ellvals = linspace(-0.15, 0.15, 100);

alpha = 0.0 ;  % beta effect not used here
beta  = 0.0 ; 

epsi = 0.75 ; % value of nu 
eta  = 0.75 ;

gamma=pi/2 ; % specify angle for horizontal field

B = 0.2;
N = 16;

for ik=1:length(kvals)

    disp(ik)
    for iell=1:length(ellvals)

        [pvalsmax, pvalsimag] = kol_B_v3_fillA_pvalsmax_5(kvals(ik),ellvals(iell),epsi,B,eta,N,beta,alpha,gamma);

        pvalsmaxreal(ik,iell)=pvalsmax ;
        pvalsmaximag(ik,iell)=pvalsimag ;

    end
end

%% figure 12(a)

Delta=(eta*epsi)+B^2;
slope=(eta^2*Delta)/(epsi*eta+2*eta^2-epsi*eta^3-B^2*(1+eta^2));
kvalsline=sqrt(slope)*ellvals;

figure(1)
set( gca                       , ...
    'FontName'   , 'Helvetica' , ...
    'FontSize'   , 15        );
colormap jet
shading flat
pcolor(ellvals,kvals,pvalsmaxreal);
xlabel('$\ell$','Interpreter','LaTex','fontsize',14)
ylabel('$k$','Interpreter','LaTex','fontsize',14)
title('Re p','fontsize',14)
shading flat
colorbar
hold on
cvals = [0  0] ;
contour(ellvals, kvals,pvalsmaxreal,cvals, 'w-');

% plot theoretical straight lines

plot(ellvals,  kvalsline, 'b')
plot(ellvals, -kvalsline, 'b')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


