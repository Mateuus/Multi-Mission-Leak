/*
Created by: TheRick
fn_airSiren.sqf
*/
private["_pole"];
_pole = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _pole) exitWith {};
if(isNil {_pole getVariable "medairAlarm"}) exitWith {};
while {true} do {
	if(!(_pole getVariable "medairAlarm")) exitWith {};
	if(isNull _pole) exitWith {};
	if(playerSide == independent) then
	{
	[[5,"<t size='1.2'><t color='#FF0000'>Po¿ar!</t></t><br/><br/><t size='1'>Wszystkie jednoski, maja udac sie do remizy!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
	_pole say3D "medAirSiren";
	sleep 34;
	_pole setVariable ["medairAlarm",false,true];
	if(!(_pole getVariable "medairAlarm")) exitWith {};
};