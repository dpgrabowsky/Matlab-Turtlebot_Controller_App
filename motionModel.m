function finalPose=motionModel(u,d_t,pose)
%input: control(u), time to execute(d_t),  x,y,theta (pose)
%u(1): linear velocity
%u(2): angular velocity
%all angle expected to be in radians
%all velocitys expected to be in m/s


v=u(1);
w=u(2);

agentPose=pose;
theta=pose(3);
r=v/w;


s=sin(theta);
c=cos(theta);
s_th=sin(theta+w*d_t);
c_th=cos(theta+w*d_t);
if(w<.05)
    %basically robot is going straight
    agentPose(1)=agentPose(1)+(v*c_th)*d_t;
    agentPose(2)=agentPose(2)+(v*s_th)*d_t;
    agentPose(3)=agentPose(3)+(w)*d_t;
else
    %robot is turning
    agentPose(1)=agentPose(1)+(-r*s)+(r*s_th);
    agentPose(2)=agentPose(2)+(r*c)-(r*c_th);
    agentPose(3)=agentPose(3)+w*d_t;
    
end
finalPose=agentPose;
end