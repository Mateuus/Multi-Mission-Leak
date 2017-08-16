private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren2"}) exitWith {};
if(!(typeOf _vehicle in ["C_Van_01_box_F","I_Truck_02_covered_F","I_Truck_02_box_F"])) exitWith {hint "Das große Martinshorn ist für dieses Fahrzeug nicht verfügbar!"};

while {true} do
{
    if(!(_vehicle getVariable "siren2")) exitWith {};
    if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren2",false,true]};
    if(!alive _vehicle) exitWith {};
    if(isNull _vehicle) exitWith {};
    [_vehicle,"martinshorngross"] remoteExecCall ["say3D",0];
    sleep 3.18;
    if(!(_vehicle getVariable "siren2")) exitWith {};
};