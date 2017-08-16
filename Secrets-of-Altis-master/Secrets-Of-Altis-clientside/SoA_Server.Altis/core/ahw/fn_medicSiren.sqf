private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_02_unarmed_F","C_Offroad_01_F","C_Van_01_box_F","C_SUV_01_F"])) exitWith {hint "Das kleine Martinshorn ist für dieses Fahrzeug nicht verfügbar!"};

while {true} do
{
	if(!(_vehicle getVariable "siren")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	[_vehicle,"Martinshorn"] remoteExecCall ["say3D",0];
	sleep 2.95;
	if(!(_vehicle getVariable "siren")) exitWith {};
};
