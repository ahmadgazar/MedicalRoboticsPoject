MWS = get_param('MedicalRoboticsProject','ModelWorkspace');
%MWS = get_param('SecondaryController','ModelWorkspace');

MWS.assignin('Kx',5);
MWS.assignin('Ky',1.5);
MWS.assignin('Kz',2);

MWS.assignin('x',3);
MWS.assignin('y',3);
MWS.assignin('z',3);

MWS.assignin('xg',4);
MWS.assignin('yg',4);
MWS.assignin('zg',4);

MWS.assignin('K1',1);
MWS.assignin('K2',1);
MWS.assignin('K3',1);
MWS.assignin('K4',1);
MWS.assignin('K5',1);
MWS.assignin('K6',1);

MWS.assignin('F1',0);
MWS.assignin('F2',-0.5);
MWS.assignin('F3',0);
