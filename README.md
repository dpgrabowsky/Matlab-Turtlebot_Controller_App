# Matlab Turtlebot_Controller_App

The main purpose of app code is to facilitate path creation and motion planning for a turtlebot 2 following the turtlebot 2s motion model. 
Then using the generated path/motion commands, easily send them to a Turtlebot2 using ROS. 

## App Details
![app_img](https://user-images.githubusercontent.com/25622095/58124531-6dff9a00-7bdc-11e9-80e0-ff4f7fc678c3.PNG)

**Waypoint Control**: Module that controls adding, removing, saving, and loading waypoints. Most functions require at least 3 waypoints to be added to the map. Waypoints are entered by adding x,y coordinates (Note that the robot assumes its starting potison is x=0, y=0, theta=0)

**Generate Path**: Once the waypoints are added, the generate path button can be used to create a series of commands to follow the waypoint path as genereated by a purepursuit controller and motion model.

- The purepursuit controller generates linear and angular velocity commands which are applied for *command interval* seconds to a     'simulated' turtelbot via a motion model. The new position is then fed to the purepursuit controller until a path is generated that reaches all waypoints. 

- Finally the predicted path is plotted. 

**Saving Commands**: Once a path has been genereated, the commands used to follow that path can be saved.

**ROS Connect**: To apply the motion commands to a live Turtlebot you must be connected to a ROS network with the Turtlebot, enter the IP of this connection here. 

**ROS Publish Control**: This module publishes motion commands over a ros network to the /mobile_base/velocity_commands topic to move the turtlebot along the generated path. Commands and waypoints MUST be loaded to start this. 

**Toggle Live Plot**: This check box control whether plotting will occur while commands are being sent over ros. The plot will show the predicted Turtlebot moving along the path. **NOTE THAT PLOTTING CONSUMES COMPUTATION RESOURCES AND MAY AFFECT PERFORMANCE**
