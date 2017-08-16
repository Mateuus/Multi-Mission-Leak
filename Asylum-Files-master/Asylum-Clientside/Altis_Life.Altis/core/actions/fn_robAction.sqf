/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(isPlayer _target) then
{
	//if(_target getVariable["robbed",false]) exitWith {};
	_uid = getPlayerUID _target in life_bounty_uid;
	[[player,17 in life_honortalents && (_uid || 22 in life_honortalents),18 in life_honortalents && (_uid || 22 in life_honortalents)],"life_fnc_robPerson",_target,false] spawn life_fnc_MP;
	//_target setVariable["robbed",TRUE,TRUE];
};