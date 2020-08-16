syms t
P0=[0;0;0;1];
P=zeros(4,10);
Ax=pi/3;
Ay=0;
wx=5*pi/6;
wy=5*pi/6;
deltax=2*pi/3;
deltay=0;
phi=0;
a0=Ax*sin(wx*t);
a1=Ay*sin(wy*t+deltay);  %defining angles according to motor number.
a2=Ax*sin(wx*t+2*deltax);
a3=Ay*sin(wy*t+3*deltay);
a4=Ax*sin(wx*t+4*deltax);
a5=Ay*sin(wy*t+5*deltay);
a6=Ax*sin(wx*t+6*deltax);
a7=Ay*sin(wy*t+7*deltay);
a8=Ax*sin(wx*t+8*deltax);
a9=Ay*sin(wy*t+9*deltay);

A0_1=Transform(a0,pi/2,0,30); %deifning transforms .
A1_2=Transform(a1,-pi/2,0,30);
A2_3=Transform(a2,pi/2,0,30);
A3_4=Transform(a3,-pi/2,0,30);
A4_5=Transform(a4,pi/2,0,30);
A5_6=Transform(a5,-pi/2,0,30);
A6_7=Transform(a6,pi/2,0,30);
A7_8=Transform(a7,-pi/2,0,30);
A8_9=Transform(a8,pi/2,0,30);
A9_10=Transform(a9,-pi/2,0,30);
x=zeros(1,11);
y=zeros(1,11);
z=zeros(1,11);
for i=0:0.1:10
P(:,1)=double(subs(A0_1,t,i))*P0;
P(:,2)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*P0;
P(:,3)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*P0;
P(:,4)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*P0;
P(:,5)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*P0;
P(:,6)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*double(subs(A5_6,t,i))*P0;
P(:,7)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*double(subs(A5_6,t,i))*double(subs(A6_7,t,i))*P0;
P(:,8)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*double(subs(A5_6,t,i))*double(subs(A6_7,t,i))*double(subs(A7_8,t,i))*P0;
P(:,9)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*double(subs(A5_6,t,i))*double(subs(A6_7,t,i))*double(subs(A7_8,t,i))*double(subs(A8_9,t,i))*P0;
P(:,10)=double(subs(A0_1,t,i))*double(subs(A1_2,t,i))*double(subs(A2_3,t,i))*double(subs(A3_4,t,i))*double(subs(A4_5,t,i))*double(subs(A5_6,t,i))*double(subs(A6_7,t,i))*double(subs(A7_8,t,i))*double(subs(A8_9,t,i))*double(subs(A9_10,t,i))*P0;
x(1,2:end)=P(1,:);
y(1,2:end)=P(2,:);
z(1,2:end)=P(3,:);

fig=plot3(y,x,z,'o-','LineWidth',4,'color','0,0,0','MarkerSize',4,...
    'MarkerEdgeColor','[0,0,1]');
xlim([-300,300]);
ylim([-300,300]);
zlim([-300,300]);
pause(0.1)
hold on

delete(fig)
end
function A=Transform(th,al,d,a)
A=[cos(th)  -sin(th)*cos(al)     sin(th)*sin(al)    a*cos(th);
   sin(th)    cos(th)*cos(al)  -cos(th)*sin(al)    a*sin(th);
   0             sin(al)                cos(al)           d;
   0                0              0                     1];
end
