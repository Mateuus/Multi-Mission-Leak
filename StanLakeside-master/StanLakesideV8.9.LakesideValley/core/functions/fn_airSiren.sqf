/*
Created by: TheRick
fn_airSiren.sqf
*/
private["_pole"];
_pole = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _pole) exitWith {};
if(isNil {_pole getVariable "airAlarm"}) exitWith {};
while {true} do {
	if(!(_pole getVariable "airAlarm")) exitWith {};
	if(isNull _pole) exitWith {};
	[[5,"<t size='1.2'><t color='#FF0000'>Stan Wyjątkowy</t></t><br/><br/><t size='1'>Prosze opuscic teren miasta i udac sie w wyznaczone przez policje miejsce</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	_pole say3D "AirSiren";
	sleep 34;
	_pole setVariable ["airAlarm",false,true];
	if(!(_pole getVariable "airAlarm")) exitWith {};
};