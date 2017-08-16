 
 
 
 
 
 
 
private["_shell","_bootTime","_bootString","_callUser"]; 
_callUser = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
life_isRebooting = true; 
 
_bootString = "<t align='center' size='2' color='#ff0000'>Server Restarting</t><br />The server is having issues and will be restarting in <t underline='true'>%1 minute</t>! We recommend that you press Y and click ""SYNC DATA"".  This will be a hard restart, so you will need to join the server again from the server selection screen."; 
[[1, format[_bootString, 1]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Restarting: The server is having issues and will be restarting in %1 minute! We recommend that you press Y and click ""SYNC DATA"". This will be a hard restart, so you will need to join the server again from the server selection screen.", 1]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 45; 
 
if (isServer && ASY_UsingHeadless) then 
{ 
[[],"DB_fnc_saveVehicles", HC1, false] spawn BIS_fnc_MP; 
} 
else 
{ 
_hand = [] spawn DB_fnc_saveVehicles; 
}; 
sleep 35; 
 
while {true} do 
{ 
diag_log format["Attempting to reboot by executing '%1'...", "ExecProcess AsylumHardRestart.bat"]; 
_shell = "Arma2Net.Unmanaged" callExtension "ExecProcess AsylumHardRestart.bat"; 
sleep 20; 
};