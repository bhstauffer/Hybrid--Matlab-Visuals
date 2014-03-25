hybrid_read;
if (choice==2||choice==3||choice==4 || choice==5)
    comp=input('Plot component "1-X", "2-Y", "3-Z" - ');
for i=1:nt
    f3=reshape(f2(i,:,2,:,comp),[nx,nz]);
    f3=f3.';
    imagesc(f3);
    caxis([-0.05 0.05]); %Set color axis scaling here.
    colorbar;
    g(i)=getframe;
end
end
if (choice==1)
    for i=1:nt
        f3=reshape(f2(i,:,2,:),[nx,nz]);
        f3=f3.';
        imagesc(f3);
        caxis([-0.05 0.05]); %Set color axis scaling here.
        colorbar;
        g(i)=getframe;
    end
end