#include <macro.h>
private["_vehicle","_veh_data"];
if(dialog) exitWith {};

_vehicle = cursorTarget;
if (isNull _vehicle) then { _vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; };
if (isNull _vehicle) then { _vehicle = [_this,3,Objnull,[Objnull]] call BIS_fnc_param; };

if(isNull _vehicle OR !(_vehicle isKindOf "Car" OR _vehicle isKindOf "Air" OR _vehicle isKindOf "Ship" OR _vehicle isKindOf "House_F" OR (typeOf _vehicle) == "Land_TentA_F" OR (typeOf _vehicle) == "Land_TentDome_F")) exitWith {};

if (life_is_processing) exitWith { hint "Vous ne pouvez pas faire deux choses en meme temps."; };
if((_vehicle GVAR ["trunk_in_use",false])) exitWith {hint "Le coffre de ce véhicule est en cours d'utilisation, une seule personne à la fois."};
_vehicle SVAR["trunk_in_use",true,true];
_vehicle SVAR["trunk_in_use_by",name player,true];
if(!createDialog "TrunkMenu") exitWith {"Failed Creating Dialog";};
disableSerialization;
if(_vehicle isKindOf "House_F") then {
	ctrlSetText[3501,format["Stockage - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format["Stockage - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};
if(_vehicle isKindOf "House_F" OR ((typeOf cursorTarget) IN ANL_containers)) then {
	private["_mWeight"];
	_mWeight = 0;
	//{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle GVAR["containers",[]]);
    if((typeOf _vehicle) IN (life_containers_classnames)) then {
	_mWeight = 10000;
	} else {
		{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (_vehicle getVariable["containers",[]]);
	};	
	_veh_data = [_mWeight,(_vehicle GVAR["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};
if(_vehicle isKindOf "House_F" && {count (_vehicle GVAR ["containers",[]]) == 0} && !((typeOf _vehicle) IN ANL_containers)) exitWith  {hint "Vous devez installer des conteneurs afin de disposer des capacités de stockage !"; closeDialog 0; _vehicle SVAR["trunk_in_use",false,true];};
if(_veh_data select 0 == -1 && {(!(_vehicle isKindOf "House_F")) && !((typeOf cursorTarget) IN ANL_containers)}) exitWith {closeDialog 0; _vehicle setVariable["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};
ctrlSetText[3504,format["Poids : %1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;
_vehicle spawn
{
	waitUntil {isNull (findDisplay 3500)};
	_this SVAR["trunk_in_use",false,true];
	//if(_this isKindOf "House_F") then {
	if(_this isKindOf "House_F" && !((typeOf _this) IN ANL_containers)) then {
	[[_this],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
 	};
	if ((typeOf _this) IN ANL_containers) then {
	[[_this],"TON_fnc_updateCompaniesContainer",false,false] spawn life_fnc_MP;
	};
};