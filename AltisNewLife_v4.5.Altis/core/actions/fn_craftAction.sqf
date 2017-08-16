#include <macro.h>
private["_dialog","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];
disableSerialization;
_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_CRAFT_selectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_matsNeed = 0;
_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
			//_str = M_CONFIG(getText,"ANL_VItems",ITEM_VARNAME(_matsNeed select _i),"variable");
			_str = ITEM_VARNAME(_matsNeed select _i);			
			if((GVAR_MNS _str) < _matsNum) exitWith {_allMaterial = false;};
		};
	};
} foreach (_config select 1);
if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};
//Some checks
if((count _matsNeed) == 0) exitWith { hint "Vous n'avez pas les materiaux requis !";};
if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint localize "STR_CRAFT_AR_Backpack";
};
if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint localize "STR_CRAFT_AR_Uniform";
};

if(_itemFilter == "item") then {
	_weight = M_CONFIG(getNumber,"ANL_VItems",_item,"weight");
	if (life_carryWeight + _weight > life_maxWeight) exitWith { hint localize "STR_NOTF_NoRoom";};
};
if(_itemFilter == "weapon" && !(player canAdd _item)) exitWith {hint localize "STR_NOTF_NoRoom";};
if(currentWeapon player != "") exitWith {hint "Vous ne pouvez pas crafter avec une arme a la main";};
_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then{
	_itemName = localize (ITEM_NAME(_newitem));
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};
_upp = format["Construction %1", _itemName];
closeDialog 0;
//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace GVAR "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
	//_handledItem = ITEM_VARNAME(_oldItem select _i);
	_handledItem = M_CONFIG(getText,"ANL_VItems",_oldItem select _i,"variable");
	if(!([false,_handledItem,_oldItem select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
[] call life_fnc_p_updateMenu;
life_is_processing = true;
while{true} do
{
	uiSleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};
if(_itemFilter == "backpack") then{
	if(backpack player == "") then{
		player addBackpack _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Backpack";
		life_is_processing = false;
	};
};
if(_itemFilter == "item") then{
	_handledItem = M_CONFIG(getText,"ANL_VItems",_newitem,"variable");
	[true,_handledItem,1] call life_fnc_handleInv;
};
if(_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player addUniform _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Uniform";
		life_is_processing = false;
	};
};
if(_itemFilter == "weapon") then{

	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			hint "Le craft a été annulé vous n'avez pas pu stocker l'arme";
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = M_CONFIG(getText,"ANL_VItems",_oldItem select _i,"variable");
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};
5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
life_is_processing = false;
_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];