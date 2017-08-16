 
 
 
 
 
 
 
private["_shell","_bootTime","_bootString","_callUser"]; 
_callUser = [_this,0,objNull,[objNull]] call BIS_fnc_param; 
 
life_isRebooting = true; 
 
_bootString = "<t align='center' size='2' color='#ff0000'>Server Patch</t><br />The server will be restarting in <t underline='true'>%1 minute(s)</t> to apply an Asylum patch! We recommend that you press Y and click ""SYNC DATA"".  Due to a Bohemia bug, you will need to restart your Arma client to apply our patch."; 
[[1, format[_bootString, 10]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Patch: The server will be restarting in %1 minute(s) to apply an Asylum patch! We recommend that you press Y and click ""SYNC DATA"". Due to a Bohemia bug, you will need to restart your Arma client to apply our patch.", 10]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 300; 
[[1, format[_bootString, 5]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Patch: The server will be restarting in %1 minute(s) to apply an Asylum patch! We recommend that you press Y and click ""SYNC DATA"". Due to a Bohemia bug, you will need to restart your Arma client to apply our patch.", 5]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
sleep 240; 
[[1, format[_bootString, 1]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 
[[format["Server Patch: The server will be restarting in %1 minute(s) to apply an Asylum patch! We recommend that you press Y and click ""SYNC DATA"". Due to a Bohemia bug, you will need to restart your Arma client to apply our patch.", 1]],"life_fnc_localChatMessage",true,false] spawn life_fnc_MP; 
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
diag_log format["Attempting to reboot by executing '%1'...", "ExecProcess AsylumRestart.bat"]; 
_shell = "Arma2Net.Unmanaged" callExtension "ExecProcess AsylumRestart.bat"; 
sleep 20; 
};