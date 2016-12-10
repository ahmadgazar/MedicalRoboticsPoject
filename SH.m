T = [1,0,0,0; 0,0,-1,0; 0,1,0,0; 0,0,0,1];
% 
% %qi di ai alphai
% L1 = Link([ pi/2, 0, 0 , pi/2, 1]);
% L2 = Link([ pi/2, 0, 0 , pi/2, 1]);
% L3 = Link([ 0, 0, 0 ,0, 1]);
% L4 = Link([ 0, 3, 0 , -pi/2, 0]);
% L5 = Link([ 0, 0, 3, pi/2, 0]);
% L6 = Link([ 0, 2, 0 ,0, 1]);
% R = SerialLink([L1,L2,L3,L4,L5,L6], 'name', 'SteadyHand','base',T);
% R.plotopt = {'workspace', [-10 10 -10 10 -10 10]};
% R.plot([2 2 2 0 0 2]);


L11 = Link([ pi/2, 0, 0 , pi/2, 1]);
L21 = Link([ pi/2, 0, 0 , pi/2, 1]);
L31 = Link([ pi/2, 0, 0 , pi/2+pi/8, 1]);
L41 = Link([ 0, 10, 0 ,pi/2, 0]);
L51 = Link([ 0,0,5,-pi/2,0]);
L61 = Link([ 0,0,0,0,1]);


R1 = SerialLink([L11,L21,L31,L41,L51,L61], 'name', 'SteadyHand','base',T);
figure;
R1.plotopt = {'workspace', [-20 20 -20 20 -20 20]};
R1.plot([3,3,3,pi/2,0,5]);
