/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	For police to kick crappy public slot cops (Ran on public cop)
*/
private["_display","_text","_units","_charge","_civvalue","_player","_sleep","_copName"];

_copName = _this select 0;

if(isServer)exitWith{};

systemchat "You are being kicked from the police force by a ranking officer, talk to the police on TS if you disagree with this action";
hint "You are being kicked from the police force by a ranking officer, talk to the police on TS if you disagree with this action";

firedCops pushBack (getPlayerUID player);
publicVariable "firedCops";

sleep 3;
	
["officerKick",false,true] call BIS_fnc_endMission;

[[0,format["%1 has been fired from the police force by Officer %2",(name player),_copName]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;