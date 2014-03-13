hybrid_read;
if (choice==2||choice==3||choice==4)
    comp=input('Plot component "1-X", "2-Y", "3-Z" - ');
    figure
    for i=1:nt
        plot(qz,reshape(f2(i,2,2,:,comp),[1,nz]));
        g(i)=getframe;
    end
    movie(g,1,2);
end
if (choice==1)
    figure
    for i=1:nt
        plot(qz,reshape(f2(i,2,2,:),[1,nz]));
        g(i)=getframe;
    end
    movie(g,1,2);
end
    