clc;clear all;close all;

%% 绘制花瓣
[x,theta] = meshgrid((0:50)/50,(0:0.5:750)/750*15*pi-2*pi);
delta = (pi/2)*exp(-theta/(8*pi));
a = 1-(1-mod(4.5*theta,2*pi)/pi).^6/2;  % "4.5"花瓣数控制
y = 2*(x.^2-x).^2.*sin(delta);
b = a.*(x.*sin(delta)+y.*cos(delta));
figure(1)
% 设置背景颜色
backColor = [1 1 1];  % RGB值设定  粉色[1 0.97 0.92] 黑色[0 0 0] 白色[1 1 1]
Hfig(1)=figure(1);
set(Hfig(1), 'color', backColor)
% 视点控制：view([方位角,俯视角])  俯视(-72,88)| 正-俯视(-15,60)| 偏仰视(-75,-26)
view(-15,60)
axis image off        % 去除图像坐标
surface(b.*cos(theta),b.*sin(theta),a.*(x.*cos(delta)-y.*sin(delta)),'EdgeC','n','FaceC','r')  % 染上红色底
light('pos',[-0.55 -0.55 1], 'style','local', 'col',[1 0.75 0.75])     % 勾勒花瓣轮廓
lighting gouraud      % 光滑处理
hold on

%% 绘制花托
[x1,y1]=meshgrid(-2:0.075:2);
H=1.25*sin((x1.^2+y1.^2).^0.5)-1.6355;   % 调整花托的高度
surface(x1/2.25,y1/2.25,H,25*ones(size(H)),'EdgeC','n','FaceC','g');  % "25"调颜色
light('pos',[-0.75 1 -0.75], 'style','local', 'col',[0.75 1 0.75])
lighting gouraud

%% 绘制花枝
% 上枝
[x2,y2]=meshgrid(-0.1:0.001:0.1);
h=15*sin((x2.^2+y2.^2).^0.5)-1.80;
surf(x2/5,y2/5,h,25*ones(size(h)));      % "25"调颜色
% 下枝
h=100;                % 花枝长度
d=0.075;
[A,Z]=meshgrid(0:2*pi/fix(2*pi/(1.2*d)):2*pi,0:h/fix(h/d):h);
LX=cos(A)/40;
LY=sin(A)/40;
h1=surface(LX,LY,Z/40-4.05,'EdgeC','n','FaceC','g');
light('pos',[-0.15 1 -0.15], 'style','local', 'col',[0.85 1 0.85])
lighting gouraud
axis image off
x=-1:d:1;y=-1:d:1;
[X,Y]=meshgrid(x,y);
X(X.^2+Y.^2>1)=NaN;
Y(X.^2+Y.^2>1)=NaN;
h2=surface(X/40,Y/40,X*0-4.05);

%% 坐标等间距化
axis equal
