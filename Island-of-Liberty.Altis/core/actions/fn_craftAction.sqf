#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_xpNeed","_boat","_dir","_name","_time","_data","_flag","_addExpAmount","_profName","_dialog","_exit","_item","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_vehspawn","_vehicle"];

disableSerialization;

_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_boat = false;
_exit = false;
_dtime = 0.4;
_addExpAmount = 5;
_profName = "";
_vehspawn = getMarkerPos "vehcraft";
_dir = markerDir "vehcraft";
if (_item isKindOf "ship") then {_vehspawn = getMarkerPos "boatcraft"; _boat = true;_vehspawn set [2,0.2]; _dir = markerDir "boatcraft"}; 

_itemFilter = lbData[673,(lbCurSel 673)];

_matsNeed = 0;

_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == SEL(_x,0))then
	{
		_matsNeed = SEL(_x,1);
		_xpNeed = SEL(_x,2);
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_matsNum = SEL(_matsNeed,_i+1);
			if (ITEM_VALUE(SEL(_matsNeed,_i)) < _matsNum) exitWith {_allMaterial = false;};
		};
	};
} foreach (_config);

if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};

//Some checks
if((count _matsNeed) == 0) exitWith {};

if(_itemFilter == "vehicle" && (player distance _vehspawn > 20)) exitWith {hint localize "STR_PM_Nospoint"};
if(_itemFilter == "vehicle" && (count(nearestObjects[_vehspawn,["Car","Ship","Air"],10]) > 0)) exitWith {hint localize "STR_Shop_Veh_Block"};

if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint localize "STR_CRAFT_AR_Backpack";
};

if(_itemFilter == "vest" && vest player != "") exitWith{
		hint localize "STR_CRAFT_AR_Vest";
};

if(_itemFilter == "misc" && backpack player == "") exitWith{
		hint localize "STR_CRAFT_AR_Misc";
};

if (_itemFilter == "misc" && !(player canAddItemToBackpack _item)) exitWith {
hint localize "STR_PM_Noroom";
};

if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint localize "STR_CRAFT_AR_Uniform";
};

if(_itemFilter == "item") then {
	_weight = ([_item] call life_fnc_itemWeight);
	if ((life_carryWeight + _weight) > life_maxWeight) exitWith {_exit = true;};
};
if(_exit) exitWith {
	hint localize "STR_NOTF_NoRoom";
};

if(_itemFilter == "weapon" && (!(player canAdd _item) || currentWeapon player != "")) exitWith {
	hint localize "STR_NOTF_NoRoom";
};

if(_itemFilter == "weapon" && (!(player canAdd _item) && currentWeapon player != "")) then {
	hint localize "STR_NOTF_NoRoom";
};

_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then{
	_itemName = localize M_CONFIG(getText,"VirtualItems",_newItem,"displayName");
} else {
	_itemInfo = [_newItem] call life_fnc_fetchCfgDetails;
	_itemName = SEL(_itemInfo,1);
};


//Setup our progress bar.
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = SEL(_oldItem,_i);
	if(!([false,_handledItem,SEL(_oldItem,_i+1)] call life_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;call life_fnc_statusBar;};
[] call life_fnc_p_updateMenu;

life_is_processing = true;

while{true} do
{
	sleep  _time;
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

if(_itemFilter == "vest") then{
	if(vest player == "") then{
		player addVest _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Vest";
		life_is_processing = false;
	};
};

if(_itemFilter == "misc") then{
	if(backpack player != "") then{
		if (player canAddItemToBackpack _newItem) then {
		player addItemtoBackpack _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Misc";
		life_is_processing = false;
	};
	};
};

if(_itemFilter == "item") then{
	[true,_newItem,1] call life_fnc_handleInv;
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
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = SEL(_oldItem,_i);
				[true,_handledItem,SEL(_oldItem,_i+1)] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};

};

if(_itemFilter == "vehicle") then {
		
		_vehicle = createVehicle [_newItem,[0,0,999], [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"};
		_vehicle allowDamage false;
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal _vehspawn);
		_vehicle setDir _dir;
		if (_boat) then {_vehicle setPosASL _vehspawn;} else {_vehicle setPos _vehspawn;};
		[_vehicle,0] call life_fnc_colorVehicle;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
		[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
		_vehicle allowDamage true;
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
		[(getPlayerUID player),playerSide,_vehicle,0] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
};

5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
call life_fnc_statusBar;
life_is_processing = false;