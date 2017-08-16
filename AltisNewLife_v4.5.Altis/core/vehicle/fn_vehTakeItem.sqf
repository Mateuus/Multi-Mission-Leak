#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if((life_trunk_vehicle GVAR ["trunk_in_use",false]) && (life_trunk_vehicle GVAR ["trunk_in_use_by",false] != name player)) exitWith {
    closeDialog 0; 
    hint "Inventaire en cours d'utilisation";
};
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {hint "Ce vehicule n'est plus la ou a été détruit."};
if(!alive player) exitwith {closeDialog 0;};
if((lbCurSel 3502) == -1) exitWith {hint "Vous devez selectionner un objet !";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Format de nombre invalide";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Vous devez en mettre au moins 1 !";};
_index = [_ctrl,((life_trunk_vehicle GVAR "Trunk") select 0)] call TON_fnc_index;
_data = (life_trunk_vehicle GVAR "Trunk") select 0;
_old = life_trunk_vehicle GVAR "Trunk";
if(_index == -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {hint "Ce vehicule ne contient pas autant d'objet"};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Votre inventaire est plein !"};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl == "money") then
{
	if(_num == _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	argent_liquide = argent_liquide + _num;
	life_trunk_vehicle SVAR["Trunk",[_data,(_old select 1) - _weight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num == _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle SVAR["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	}
		else
	{
		hint "Impossible d'ajouter à votre inventaire, vous êtes deja plein ?";
	};
};