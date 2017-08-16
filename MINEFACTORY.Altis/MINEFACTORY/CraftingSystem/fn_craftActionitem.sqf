#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: PierreAmyf
*/

private["_dialog","_item","_itemInfo","_matsNeed","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];
disableSerialization;
_dialog = findDisplay 766;
if((lbCurSel 769) == -1) exitWith {hint  "Du musst zuerst einen Gegenstand auswählen!";};
_item = lbData[769,(lbCurSel 769)];
_allMaterial = true;
_itemFilter = lbData[773,(lbCurSel 773)];
_matsNeed = 0;
_config = [_itemFilter] call life_fnc_MineFactory_CraftitemConfig;
_newItem = _item;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
			if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};
		};
	};
} foreach (_config);
if(!_allMaterial) exitWith {hint  "Du hast nicht genug Material";};
//Some checks
if((count _matsNeed) == 0) exitWith {};
if(_itemFilter == "material") then {
	_weight = M_CONFIG(getText,"VirtualItems",_Item,"weight");;
};
if(_itemFilter == "material") then{
	_itemName1 = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
	_itemName =  _itemName1;
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};
_upp = format["Crafting %1",_itemName];
closeDialog 0;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_removeItemSuccess = true;
_invSize = count _matsNeed;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
	if(!([false,_matsNeed select _i,_matsNeed select _i+1] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
[] call life_fnc_p_updateMenu;
life_is_processing = true;
while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(player != vehicle player) exitWith {};
};
if(_itemFilter == "material") then{
	[true,_newItem,1] call life_fnc_handleInv;
};

5 cutText ["","PLAIN"];
titleText[format[ "Sie haben %1 hergestellt",_itemName],"PLAIN"];
life_is_processing = false;