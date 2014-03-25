hybrid_read;
[X,Z]=meshgrid(qz,qx);
for i=1:nt
    u=reshape(f2(i,:,2,:,1),[nx,nz]);
    v=reshape(f2(i,:,2,:,1),[nx,nz]);
    streamslice(X,Z,u,v);
    g(i)=getframe;
    close;
end