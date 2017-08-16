#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;
_ctrl = ctrlSelData(3503);
if((life_trunk_vehicle GVAR ["trunk_in_use",false]) && (life_trunk_vehicle GVAR ["trunk_in_use_by",false] != name player)) exitWith { closeDialog 0;  hint "Inventaire en cours d'utilisation";};
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Format de nombre invalide";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Vous devez en mettre au moins 1 !";};
if(life_trunk_vehicle isKindOf "House_F" OR ((typeOf life_trunk_vehicle) IN ANL_containers)) then {
	_mWeight = 0;
	//{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle GVAR["containers",[]]);
	if((typeOf life_trunk_vehicle) IN ANL_containers) then {
	// Company storage
		_mWeight = 10000;
	} else {
		{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	};
	_totalWeight = [_mWeight,(life_trunk_vehicle GVAR["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle GVAR ["Trunk",[[],0]];
_inv = _veh_data select 0;
if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Tu peux le transporter qu'avec un vehicule terrestre !"};
if(_ctrl == "uranium1" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Tu peux le transporter qu'avec un vehicule terrestre !"}; // Add This
if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(argent_liquide < _num) exitWith {hint "Vous n'avez pas assez d'argent pour stocker dans ce vehicule !"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	argent_liquide = argent_liquide - _num;
	life_trunk_vehicle SVAR["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Le véhicule est plein ou ne peut pas supporter une telle quantité."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible de supprimer les articles de votre inventaire à mettre dans le véhicule.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle SVAR["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
