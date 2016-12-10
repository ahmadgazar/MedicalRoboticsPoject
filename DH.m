%% DH transformation matrices and direct kinematics of a serial robot (SCARA example)
%% 5 Nov 2012 (DH frames assigned as in lecture slides 09_DirectKinematics, A. De Luca)

clear all
clc

%% Define symbolic variables

syms alpha d a theta
syms q1 q2 q3 q4 q5 q6 
 
%% number of joints of robot

N=6;

%% Insert DH table of parameters of the robot

DHTABLE = [pi/2,0,q1,pi/2; pi/2,0,q2,pi/2; pi/2+pi/8,0,q3,pi/2; pi/2,0,10,q4; -pi/2 ,5,0,q5; 0,0,q6,0];
         
         
         
%% Build the general Denavit-Hartenberg trasformation matrix

TDH = [ cos(theta) -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) a*cos(theta);
        sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
          0             sin(alpha)             cos(alpha)            d;
          0               0                      0                   1];

%% Build transformation matrices for each link
% First, we create an empty cell array

A = cell(1,N);

% For every row in 'DHTABLE' we substitute the right value inside
% the general DH matrix
for i = 1:N
    alpha = DHTABLE(i,1);
    a = DHTABLE(i,2);
    d = DHTABLE(i,3);
    theta = DHTABLE(i,4);
    A{i} = subs(TDH);
    fprintf('R%d%d',i-1,i)
    A{i}
   
end

%% Direct kinematics

disp('Direct kinematics of the robot in symbolic form (simplifications may need some time)')

disp(['Number of joints N=',num2str(N)])

% Note: 'simplify' may need some time

T = eye(4);
z0 = [0;0;1];
ja = z0;
for i=1:N
   for j=1:i 
      fprintf('T%d%d',j-1,j)
   end
   T = T*A{i};
   T = simplify(T)
   fprintf('Z%d',i)
   if i< N  
     z = T(1:3,1:3)*z0 % JAi(q) = zi-1 
     ja = horzcat(ja,z);
   end 
end

% output TN matrix

T0N = T
R = T0N*[0 0 1 0;
        1 0 0 0;
        0 1 0 0;
        0 0 0 1];

% output ON position

p = T(1:3,4)

% output xN axis

n=T(1:3,1)

% output yN axis

s=T(1:3,2)

% output zN axis

a=T(1:3,3)


%% Angular Jacobian
ja
%% linear Jacoboian
v = [q1,q2,q3,q4,q5,q6];
jl = simplify(jacobian(p,v))
