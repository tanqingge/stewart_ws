% definite parameters of the stewart platform
r_B=210;            %[mm]Radius of the circumcircle of the base
r_P=125;            %[mm] Radius of the circumcircle of the platform
length_min=320;     %[mm] least length of the arm
length_max=520;     %[mm] longest length of the arm
alpha_P=20/180*pi;         %[rad] the degree between the points of the platform
alpha_B=20/180*pi;         %[rad] the degree between the points of the base
trans=zeros(3,1);     %[mm] The vector which describes the wanted translational movement of the platform [x, y, z]
orient=zeros(3,1);    %[rad] the vector describe the Euler angle [ phi, theta, psi]
origin_height=[0;0;400];      %[mm] initial height of the platform
%the angle coordinate of the points in platform
theta_P=[alpha_P/2,...
         2*pi/3-alpha_P/2,...
         2*pi/3+alpha_P/2,...
         4*pi/3-alpha_P/2,...
         4*pi/3+alpha_P/2,...
         2*pi-alpha_P/2];
%the angle coordinate of the points in base
theta_B=[pi/3-alpha_B/2,...
         pi/3+alpha_B/2,...
         pi-alpha_B/2,...
         pi+alpha_B/2,...
         5*pi/3-alpha_B/2,...
         5*pi/3+alpha_B/2];
%the coordiante points in platform
% Format:
%       x1      x2 ...
%       y1      y2 ...
%       z1      z2 ...
attach_P=r_P*[[cos(theta_P(1)), sin(theta_P(1)),0]',...
                [cos(theta_P(2)), sin(theta_P(2)),0]',...
                [cos(theta_P(3)), sin(theta_P(3)),0]',...
                [cos(theta_P(4)), sin(theta_P(4)),0]',...
                [cos(theta_P(5)), sin(theta_P(5)),0]',...
                [cos(theta_P(6)), sin(theta_P(6)),0]'];
%the coordiante points in base
% Format:
%       x1      x2 ...
%       y1      y2 ...
%       z1      z2 ...
attach_B=r_B*[[cos(theta_B(1)), sin(theta_B(1)),0]',...
                [cos(theta_B(2)), sin(theta_B(2)),0]',...
                [cos(theta_B(3)), sin(theta_B(3)),0]',...
                [cos(theta_B(4)), sin(theta_B(4)),0]',...
                [cos(theta_B(5)), sin(theta_B(5)),0]',...
                [cos(theta_B(6)), sin(theta_B(6)),0]'];
%the origin vector angle of base
vector_origin=attach_P-attach_B+origin_height;
for i =1 :6
    vec_len(i)=norm(vector_origin(:,i));
    vec_dir(:,i)=vector_origin(:,i)/vec_len(i);
end
roll_min=-pi/4;
roll_max=pi/4;
pitch_min=-pi/4;
pitch_max=pi/4;
yaw_min=-pi/2;
yaw_max=pi/2;
d_threhold=0;    %[mm] describe the distance between two arms
angle_P=pi/3;
angle_B=pi/6;