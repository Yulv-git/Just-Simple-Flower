clc;clear all;close all;

%% ���ƻ���
[x,theta] = meshgrid((0:50)/50,(0:0.5:750)/750*15*pi-2*pi);
delta = (pi/2)*exp(-theta/(8*pi));
a = 1-(1-mod(4.5*theta,2*pi)/pi).^6/2;  % "4.5"����������
y = 2*(x.^2-x).^2.*sin(delta);
b = a.*(x.*sin(delta)+y.*cos(delta));
figure(1)             % �����մ���
% ���ñ�����ɫ
backColor = [1 1 1];  % RGBֵ�趨  ��ɫ[1 0.97 0.92] ��ɫ[0 0 0] ��ɫ[1 1 1]
Hfig(1)=figure(1);
set(Hfig(1), 'color', backColor)
% �ӵ���ƣ�view([��λ��,���ӽ�])  ����(-72,88)| ��-����(-15,60)| ƫ����(-75,-26)
view(-15,60)
axis image off        % ȥ��ͼ������
surface(b.*cos(theta),b.*sin(theta),a.*(x.*cos(delta)-y.*sin(delta)),'EdgeC','n','FaceC','r')  % Ⱦ�Ϻ�ɫ��
light('pos',[-0.55 -0.55 1], 'style','local', 'col',[1 0.75 0.75])     % ���ջ�������
lighting gouraud      % �⻬����
hold on

%% ���ƻ���
[x1,y1]=meshgrid(-2:0.075:2);
H=1.25*sin((x1.^2+y1.^2).^0.5)-1.6355;   % �������еĸ߶�
surface(x1/2.25,y1/2.25,H,25*ones(size(H)),'EdgeC','n','FaceC','g');  % "25"����ɫ
light('pos',[-0.75 1 -0.75], 'style','local', 'col',[0.75 1 0.75])
lighting gouraud      % �⻬����

%% ���ƻ�֦
% ��֦
[x2,y2]=meshgrid(-0.1:0.001:0.1);
h=15*sin((x2.^2+y2.^2).^0.5)-1.80;
surf(x2/5,y2/5,h,25*ones(size(h)));      % "25"����ɫ
% ��֦
h=100;                % ��֦����
d=0.075;
[A,Z]=meshgrid(0:2*pi/fix(2*pi/(1.2*d)):2*pi,0:h/fix(h/d):h);
LX=cos(A)/40;
LY=sin(A)/40;
h1=surface(LX,LY,Z/40-4.05,'EdgeC','n','FaceC','g');
light('pos',[-0.15 1 -0.15], 'style','local', 'col',[0.85 1 0.85])
lighting gouraud      % �⻬����
axis image off        % ȥ��ͼ������
x=-1:d:1;y=-1:d:1;
[X,Y]=meshgrid(x,y);
X(X.^2+Y.^2>1)=NaN;
Y(X.^2+Y.^2>1)=NaN;
h2=surface(X/40,Y/40,X*0-4.05);

%% ����ȼ�໯
axis equal