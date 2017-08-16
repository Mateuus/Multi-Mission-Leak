/*
	file: fn_hasOrgan.sqf
	author: [midgetgrimm] - www.grimmlife.com
	
*/
private["_organThief"];
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {}; //if not the thief get bent

	[1,format["%1 has cut out a kidney from %2.",name _organThief,name player]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];//lets people know you are stealing kidneys
	[_organThief,"kidney",1] call tanoarpg_fnc_handleInv;//put stolen kidney into inventory of thief
	[getPlayerUID _organThief,name _organThief,"919"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];//add to wanted list
	sleep 600;//no more organ theft for at least 5 minutes, so they cant just do it over and over, can do whatever time you want
	_organThief setVariable["hasOrgan",false,true];//allow them to be able to take organs again- setting a variable
