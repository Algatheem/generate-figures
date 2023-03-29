function A=kol_B_v3_fillA(k,ell,epsi,B,eta,N)

A=zeros(4*N+2);

%do G lines first

m=-N;
for i=1:2:4*N+2      %1,3,5
    
    for j=1:4*N+2
        if i==j           %Gm to Gm compling
            A(i,j)=-epsi*((m+ell)^2+k^2) ; 
        elseif j==i-2              %Gm-1 to Gm compling
            A(i,j)=-k/2+(k/2)*(1/((m+ell-1)^2+k^2));
        elseif j==i+2             %Gm+1 to Gm compling
            A(i,j)=k/2-(k/2)*(1/((m+ell+1)^2+k^2));
        elseif j==i+1              %Hm to Gm compling
            A(i,j)=1i*k*B*(k^2+(m+ell)^2);
        end
    end
    m=m+1 ;
end

%do H lines now

m=-N;
for i=2:2:4*N+2       %2,4,6
    for j=1:4*N+2
        if i==j             %Hm to Hm compling
            A(i,j)=-eta*(k^2+(m+ell)^2);
        elseif j==i-2         %Hm-1 to Hm compling
            A(i,j)= -k/2;
        elseif j==i+2         %Hm+1 to Hm compling
            A(i,j)= k/2;                                       
        elseif j==i-1         %Gm to Hm compling
            A(i,j)=B*1i*k/(k^2+(m+ell)^2);
        end
    end
    m=m+1 ; 
    
end

