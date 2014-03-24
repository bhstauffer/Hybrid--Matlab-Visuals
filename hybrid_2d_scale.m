hybrid_read;

scale=(max(qx)-min(qx))/(max(qz)-min(qz));

x2=linspace(min(qx),max(qx),scale*200);
z2=linspace(min(qz),max(qz),200);
[X,Z]=meshgrid(qz,qx);
[X2,Z2]=meshgrid(z2,x2);

if (choice==2||choice==3||choice==4 || choice==5)
    comp=input('Plot component "1-X", "2-Y", "3-Z" - ');
for i=1:nt
    f3=reshape(f2(i,:,2,:,comp),[nx,nz]);
    f3=interp2(X,Z,f3,X2,Z2);
    f3=f3.';
    imagesc(f3);
    colorbar;
    g(i)=getframe;
end
end
if (choice==1)
    for i=1:nt
        f3=reshape(f2(i,:,2,:),[nx,nz]);
        f3=interp2(X,Z,f3,X2,Z2);
        f3=f3.';
        imagesc(f3);
        colorbar;
        g(i)=getframe;
    end
end