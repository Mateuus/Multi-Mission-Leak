/* 
filename: fn_diagFPS 
 
Author: Blackd0g 
 
Description: gets Diag FPS from server and broadcast it! 
*/ 
while {true} do { 
 // Server Diag FPS 
 if (showServerFPS) then { 
  serverFPS = str(round diag_fpsmin); 
  publicVariable "serverFPS"; 
  diag_log format ["lhm Server: FPS %1",serverFPS]; 
 }; 
 uisleep 60; 
};