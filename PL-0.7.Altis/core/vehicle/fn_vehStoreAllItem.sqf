#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreAllItem.sqf
	Author: Skrow & Skyfezzer

	Description:
  Utilisé dans le coffre d'un véhicule, prend tout les items selectionnés et le place dans l'inventaire du véhicule si celui-ci à de la place.
*/
private["_ctrl","_itemsStored","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_itemsToStore", "_itemsToStore_float"];
disableSerialization;

if((lbCurSel 3503) == -1) exitWith {hint "Vous devez selectionner un item.";};
_ctrl = ctrlSelData(3503);
if(_ctrl == "money") exitWith {hint "Cela ne fonctionne pas avec de l'argent."};
//Lingot d'or
if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" || life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Vous pouvez uniquement ranger cet objet dans un véhicule terrestre !"};

//Trafic de faux-billets
if(_ctrl == "bois" && {(life_trunk_vehicle isKindOf "Air")}) exitWith {hint "Vous pouvez uniquement ranger cet objet dans un véhicule terrestre !"};
if(_ctrl == "feuillehumide" && {(life_trunk_vehicle isKindOf "Air")}) exitWith {hint "Vous pouvez uniquement ranger cet objet dans un véhicule terrestre !"};
if(_ctrl == "feuilleseche" && {(life_trunk_vehicle isKindOf "Air")}) exitWith {hint "Vous pouvez uniquement ranger cet objet dans un véhicule terrestre !"};
if(_ctrl == "argentsale" && {(life_trunk_vehicle isKindOf "Air")}) exitWith {hint "Vous pouvez uniquement ranger cet objet dans un véhicule terrestre !"};
if(life_trunk_vehicle isKindOf "House_F") then{
	_mWeight = 0;
	{
		_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);
	} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
}	else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight);
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;
_itemsToStore_float = ((_totalWeight select 0) - (_totalWeight select 1))  / _itemWeight;
_itemsToStore = round _itemsToStore_float;
if (_itemsToStore_float < _itemsToStore) then {
	_itemsToStore = _itemsToStore - 1;
};
if ((_itemsToStore == -1) OR (_itemsToStore == 0)) exitWith {hint "Votre coffre est plein!";};
_itemsStored = 0;
while{ (_itemsStored < _itemsToStore) } do {
	if !([false,_ctrl,1] call life_fnc_handleInv) exitWith {};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then	{
		_inv set[count _inv,[_ctrl, 1]];
	}	else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + 1]];
	};
	_itemsStored = _itemsStored + 1;
};
if (0 != _itemsStored) then {
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + (_itemWeight * _itemsStored)],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
