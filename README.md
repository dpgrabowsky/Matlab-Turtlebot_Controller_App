# Matlab Turtlebot_Controller_App

The main purpose of app code is to facilitate path creation and motion planning for a turtlebot 2 following the turtlebot 2s motion model. 
Then using the generated path/motion commands, easily send them to a Turtlebot2 using ROS. 

## App Details
![image](https://user-images.githubusercontent.com/25622095/65834970-baf02d00-e2ae-11e9-8bd6-d96218086f4f.png)

**General Use**

Step 1: Using the waypoint control module, add at least 3 waypoints according to their x and y locations relative to the starting location and orientation of the robot (0,0 facing the positive x-axis).

Step 2: Choose method of path generation (Toggle Live PP):

    a) Live Pure-Pursuit (PP): Path/MotionCommands are generated according to pure-pursuit algorithm on the fly according to feedback from wheel endcoders
    
    b) Offline Pure-Pursuit (PP): Path/MotionCommands are generated offline assuming that Turtlebot kinematic motion model represents perfect motion.

Step 3: Choose hyper-parameters for Pure-Pursuit (Desired Linear Velocity, Look Ahead Distance, Command Intervals) 

Step 4 (optional): If using offline-pure-pursuit, press the generate path button. 

Step 5: Connect the app to the ros netwrok:

    a) Enter the IP address of the ROS master in the masterIP textbox. 
    
    b) Enter the IP address of the the computer running the APP in the myIP textbox.
    
    c) Press the R.O.S. Connect button and wait for text confirming sucessful connection. 

Step 6: When ready, press the Start button udner the R.O.S. Publish Control module, this will start publishing generated velocity messages to follow the path. 

Step 7. When done, press the Reset button. This will reset the pure-pursuit controller, and publish a message to the Turtlebot to reset the stored odometry. 


**Waypoint Control**: Module that controls adding, removing, saving, and loading waypoints. Most functions require at least 3 waypoints to be added to the map. Waypoints are entered by adding x,y coordinates (Note that the robot assumes its starting potison is x=0, y=0, theta=0)

**Generate Path**: Once the waypoints are added, the generate path button can be used to create a series of commands to follow the waypoint path as genereated by a purepursuit controller and motion model.

- The purepursuit controller generates linear and angular velocity commands which are applied for *command interval* seconds to a     'simulated' turtelbot via a motion model. The new position is then fed to the purepursuit controller until a path is generated that reaches all waypoints. 

- Finally the predicted path is plotted. 

**Saving Commands**: Once a path has been genereated, the commands used to follow that path can be saved.

**ROS Connect**: To apply the motion commands to a live Turtlebot you must be connected to a ROS network with the Turtlebot, enter the IP of this connection here. 

**ROS Publish Control**: This module publishes motion commands over a ros network to the /mobile_base/velocity_commands topic to move the turtlebot along the generated path. Commands and waypoints MUST be loaded to start this. 

**Toggle Live PP**: Check box determines if pure pursuit should be done 'live' using [x,y,theta] values obtained from /odom topic. If checked, then any pre-generated paths/commands will be ignored. 

**Toggle Live Plot**: This check box control whether plotting will occur while commands are being sent over ros. The plot will show the predicted Turtlebot moving along the path. **NOTE THAT PLOTTING CONSUMES COMPUTATION RESOURCES AND MAY AFFECT PERFORMANCE**

**Toggle Plot Odom**: This check box allows for values saved from the /odom topic to be plotted while following a pre-generated path. If using live pure-pursuit this check box will have no effect as the predicted and odom values will be the same. 
