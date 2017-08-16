 
 
 
 
 
 
 
private["_shell","_bootTime","_bootString","_callUser"]; 
_callUser = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
if (life_isRebooting) exitWith{ 
[[1,"The server is already running a restart sequence and will ignore your request."],"life_fnc_broadcast",_callUser,false] spawn life_fnc_MP; 
[["The server is already running a restart sequence and will ignore your request."],"life_fnc_localChatMessage",_callUser,false] spawn life_fnc_MP; 
}; 
life_isRebooting = true; 
 
_bootString = "<t align='center' size='2' color='#ff0000'>Server Maintenance</t><br />The server will reboot for maintenance in <t underline='true'>%1 minute(s)</t>! We recommend that you press Y and click ""SYNC DATA"".  Reboot lasts less than a minute."; 
[[1, format[_bootString, 30]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 30]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 25]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 25]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 20]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 20]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 15]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 15]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 10]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 10]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 5]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 5]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 240; 
[[1, format[_bootString, 1]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Maintenance: The server will reboot for maintenance in %1 minute(s)! We recommend that you press Y and click ""SYNC DATA"". Reboot lasts less than a minute.", 1]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 45; 
 
life_shuttingDown = true; 
publicVariableServer "life_shuttingDown"; 
 
if (isServer && ASY_UsingHeadless) then 
{ 
[[],"DB_fnc_saveVehicles", HC1, false] spawn BIS_fnc_MP; 
} 
else 
{ 
_hand = [] spawn DB_fnc_saveVehicles; 
}; 
sleep 35; 
 
 
[] call ASY_fnc_doRestart;