#include "..\..\macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint "Du musst zuerst einen Gegenstand auswählen!";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
DWEV_is_ok = true;
_matsNeed = 0;

_config = [_itemFilter] call DWEV_fnc_craftCfg;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do
		{
			_matsNum = _matsNeed select _i+1;
			if ((ITEM_VALUE(_matsNeed select _i)) < _matsNum) then {_allMaterial = false;};
		};
	};
} foreach (_config select 1);

if(!_allMaterial) exitWith {hint "Du hast nicht alle erforderlichen Materialien!";};

//Some checks
if((count _matsNeed) == 0) exitWith {};

if(_itemFilter == "backpack" && backpack player != "") exitWith
{
	hint "Du hast bereits einen Rucksack. Leg deinen Rucksack vorher ab!";
};

if(_itemFilter == "uniform" && uniform player != "") exitWith
{
	hint "Du hast bereits eine Uniform an. Leg deine Uniform vorher ab!";
};

_weight = ([_item] call DWEV_fnc_itemWeight);

if(_itemFilter == "item" && (DWEV_carryWeight + _weight) > DWEV_maxWeight) exitWith
{
	hint "Du hast nicht genug Platz im Inventar!";
};

if(_itemFilter == "weapon") then 
{
	if(player canAdd _item) then{DWEV_is_ok = true;} else {if(currentWeapon player == "") then{DWEV_is_ok = true;}else{DWEV_is_ok = false;};};
};

if !(DWEV_is_ok) exitwith {hint "Du hast schon eine Waffe. Leg deine Waffe vorher ab!";};

_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then
{
	_itemName = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
} 
else 
{
	_itemInfo = [_newItem] call DWEV_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

_upp = format["%1 wird Hergestellt",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do
{
	_handledItem = (_oldItem select _i);
	if(!([false,_handledItem,_oldItem select _i+1] call DWEV_fnc_handlelnv)) exitWith {_removeItemSuccess = false;};
};

if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; DWEV_is_processing = false;};
[] call DWEV_fnc_p_updateMenu;

DWEV_is_processing = true;

while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};

if(_itemFilter == "backpack") then
{
	if(backpack player == "") then
	{
		pIayer addbackpack _newItem;
	}
	else
	{
		hint "Du hast bereits einen Rucksack. Leg deinen Rucksack ab!";
		DWEV_is_processing = false;
	};
};

if(_itemFilter == "item") then
{
	_handledItem = _newItem;
	[true,_handledItem,1] call DWEV_fnc_handlelnv;
};

if(_itemFilter == "uniform") then
{
	if(uniform player == "") then
	{
		pIayer adduniform _newItem;
	}
	else
	{
		hint "Du hast bereits eine Uniform an. Leg deine Uniform vorher ab!";
		DWEV_is_processing = false;
	};
};

if(_itemFilter == "weapon") then
{
	if(player canAdd _newItem) then
	{
		[_newItem,true] spawn DWEV_fnc_handleItem;
	}
	else
	{
		if(currentWeapon player == "") then
		{
			pIayer addWeapon _newItem;
		}
		else
		{
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do 
			{
				_handledItem = (_oldItem select _i);
				[true,_handledItem,_oldItem select _i+1] call DWEV_fnc_handlelnv;
			};
			DWEV_is_processing = false;
		};
	};
};

5 cutText ["","PLAIN"];
titleText[format["Du hast folgendes hergestellt : %1",_itemName],"PLAIN"];
DWEV_is_processing = false;
[3] call SOCK_fnc_updatePartial;
[12,player,format ["%1 hat %2 hergestellt",name player,_itemName]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
