%clear; close all;
%%%%%%%%%%%%%%%%%%%READ PARA.DAT%%%%%%%%%%%%%%%%%%%%%%%
para='para.dat';coord='c.coord.dat';np='c.np.dat';b1='c.b1.dat';
E='c.E.dat'; up='c.up.dat';aj='c.aj.dat';
int='int32';real='float32';

choice=input('1-Density, 2-B, 3-B Contour, 4-E, 5-Velocity - ');

if (choice==2)
    fn=b1;
end
if (choice==1)
    fn=np;
end
if (choice==3)
    fn=aj;
end
if (choice==4)
    fn=E;
end
if (choice==5)
    fn=up;
end

[fid,message]=fopen(para,'r','n');
fread(fid,1,int);
nx=fread(fid,1,int);ny=fread(fid,1,int);nz=fread(fid,1,int);
%dx=fread(fid,1,real);dy=fread(fid,1,real);delz=fread(fid,1,real);
%hr=fread(fid,1,int);

fread(fid,6,int);fread(fid,1,real);fread(fid,1,int);
dt=fread(fid,1,real);nout=fread(fid,1,int);
fread(fid,2,int);
dir=setstr(fread(fid,hr,'uchar'));
fread(fid,2,int);
vtop=fread(fid,1,real);vbottom=fread(fid,1,real);
fread(fid,2,int);
Ni_max=fread(fid,1,int);
fread(fid,2,int);
mion=fread(fid,1,real);m_pu=fread(fid,1,real);m_heavy=fread(fid,1,real);
fread(fid,2,int);
np_top=fread(fid,1,real);np_bottom=fread(fid,1,real);
fread(fid,2,int);
b0_top=fread(fid,1,real);b0_bottom=fread(fid,1,real);
fread(fid,2,int);
vth_top=fread(fid,1,real);vth_botom=fread(fid,1,real);
fread(fid,2,int);
alpha=fread(fid,1,real);beta=fread(fid,1,real);fread(fid,1,int);
fclose(fid);
nt=int32(nt/nout);
%%%%%%%%%%%%%%%%%%%%%%%%READ C.COORD.DAT%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fid,message]=fopen('c.coord.dat','r','n');
fread(fid,10,int);
qx=fread(fid,nx,real);fread(fid,2,int);
qy=fread(fid,ny,real);fread(fid,2,int);
qz=fread(fid,nz,real);
fclose(fid);
qx=reshape(qx,[1,nx]);
qy=reshape(qy,[1,ny]);
qz=reshape(qz,[1,nz]);
%%%%%%%%%%%%%%%%%%%%%%%%%READ CHOSEN FILE%%%%%%%%%%%%%%%%%%%%%%%%%%
[fid,message]=fopen(fn,'r','n');
if (choice==1)
f2=zeros(nt,nx,ny,nz);
for i=1:nt
    fread(fid,4,int);
    f=fread(fid,nx*ny*nz,real);
    fread(fid,1,int);
    f=reshape(f,[nx,ny,nz]);
    f2(i,:,:,:)=f;
end
end
if (choice==2 || choice==3 || choice==4)
f2=zeros(nt,nx,ny,nz,3);
for i=1:nt
    fread(fid,4,int);
    f=fread(fid,nx*ny*nz*3,real);
    fread(fid,1,int);
    f=reshape(f,[nx,ny,nz,3]);
    f2(i,:,:,:,:)=f;
end
end
