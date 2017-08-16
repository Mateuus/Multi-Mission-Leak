/*
	File: fn_medicSiren.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Starts the paramedic siren sound for other players
*/
private["_vehicle","_clip"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_logic = param[1];
if(isNull _vehicle) exitWith {};
hideObject _logic;
while {true} do
{
	if(count (crew (_vehicle)) == 0) exitWith {};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle || isNull _logic) exitWith {};
	_logic say3D "SirenMedic"; sleep 15;
};