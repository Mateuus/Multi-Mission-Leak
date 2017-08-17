//Pre-Checks
if(playerSide != west) exitWith {}; 
if(!([false,"panicbutton",1] call life_fnc_handleInv)) exitWith {
hint localize "STR_NopanicButton";
};
if((player getVariable "restrained")) exitWith {}; 


if(!life_callBackup) exitWith {systemChat "You're not able to make a new call again so fast!"};
[true,"panicbutton",1] call life_fnc_handleInv;
"panic" remoteExec ["playSound",west];
_backupTime = 60;
[player,_backupTime,false] remoteExec ["life_fnc_backupCall",west];
life_callBackup = false;
[_backupTime] spawn
{
	_backupTime = _this select 0;
	uiSleep 240 + _backupTime; // 5 minute timer on how often you can request backup
	life_callBackup = true;
};
[false,"panicbutton",1] call life_fnc_handleInv;
