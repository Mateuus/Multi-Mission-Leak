#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Description: Crafting System
	Author: EdgeKiller
	Edit: Max "Maxos" Seßler
*/
private["_dialog","_item","_itemInfo","_matsNeed","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight"];
disableSerialization;
_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_matsNeed = 0;
_klb = "";
_config = [_itemFilter] call life_fnc_craftCfg;
_newItem = _item;
{
	if(_item == _x select 0)then
	{
		_klb = _x select 1;
		_matsNeed = _x select 2;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
			if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};
		};
	};
} foreach (_config);

if (!(_klb == "")) then {
	_BPK = LICENSE_VALUE(_klb,"civ");
	if (_BPK == false) exitWith {hint "Du hast nicht das benötigte Wissen!"};	
}; 

if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};
//Some checks
if((count _matsNeed) == 0) exitWith {};
if((_itemFilter == "auto") or (_itemFilter == "eat") or (_itemFilter == "metal") or (_itemFilter == "technik")) then {
	_weight = M_CONFIG(getText,"VirtualItems",_Item,"weight");;
};
if(_itemFilter == "aufsätze" && !(player canAdd _newItem) || currentWeapon player != "") exitWith {
	hint localize "STR_NOTF_NoRoom";
};
if(_itemFilter == "magazine" && !(player canAdd _newItem) || currentWeapon player != "") exitWith {
	hint localize "STR_NOTF_NoRoom";
};
if((_itemFilter == "auto") or (_itemFilter == "eat") or (_itemFilter == "metal") or (_itemFilter == "technik")) then{
	_itemName1 = M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
	_itemName = localize _itemName1;
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};
_upp = format["Crafting %1",_itemName];
closeDialog 0;
//Setup our progress bar.
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
if(_itemFilter == "waffen") then{
	player addWeapon _newItem;
	hint "Schauen wir und das ding mal an";
};
if(_itemFilter == "magazine") then{
	player addItem _newItem;
	hint "Ich habe mal meinen neuen Aufsatz in meinen Rucksack gepackt";
};
if(_itemFilter == "aufsätze") then{
	player addItem _newItem;
	hint "Ich habe mal meinen neuen Aufsatz in meinen Rucksack gepackt";
};
if(_itemFilter == "kleidung") then{
	player addUniform _newItem;
	hint "Mal schauen ob es passt";
};
if(_itemFilter == "westen") then{
	player addVest _newItem;
	hint "Mal schauen ob sie passt";
};
if(_itemFilter == "metal") then{
	[true,_newItem,1] call life_fnc_handleInv;
};
if(_itemFilter == "auto") then{
	[true,_newItem,1] call life_fnc_handleInv;
};
if(_itemFilter == "eat") then{
	[true,_newItem,1] call life_fnc_handleInv;
};
if(_itemFilter == "technik") then{
	[true,_newItem,1] call life_fnc_handleInv;
};
5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
life_is_processing = false;