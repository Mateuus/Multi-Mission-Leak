#include <macro.h>

/*
	File: fn_craftAction.sqf
	Author: EdgeKiller

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_craftSites","_site","_vehicle","_itemInfo","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_nearCar","_vehicleCheck","_trunkCar","_trunk","_vehCheck","_invAmount","_weight"];
disableSerialization;
_dialog = findDisplay 666;
if(!((player distance (getMarkerPos "CraftingArea1") < 10) OR  (player distance (getMarkerPos "CraftingArea2") < 10) OR  (player distance (getMarkerPos "CraftingArea3") < 10))) exitWith  {hint "How can I do this without the right tools? Go to a crafting zone";};
if((lbCurSel 669) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[669,(lbCurSel 669)];
_nearCar = nearestobject[player,"LandVehicle"];
_vehicleCheck = false;
_craftSites = ["craft_1","craft_2","craft_3"];

{
    if(player distance (getmarkerpos _x) < 40) then {
        _site = _x;
    };
} foreach _craftSites;

if(_nearcar iskindof "LandVehicle") then {
    if(_nearCar in life_ogVehicles) then {
    _vehicleCheck = true;
    _trunkCar = _nearCar getvariable "Trunk";
    _trunk = _trunkCar select 0;
    };
};
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_matsNeed = 0;
_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == (_x select 0))then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
			_matsNum = _matsNeed select _i+1;
			_str = ITEM_VARNAME(_matsNeed select _i);			
			if((GVAR_MNS _str) < _matsNum) then {
                if(!_vehicleCheck) exitwith {_allMaterial = false;};
                if(!(([_trunk,_matsNeed select _i,_matsNum] call life_fnc_itemInVeh) select 0)) exitWith {
                    _allMaterial = false;
                };
            };
		};
	};
} foreach _config;
if(!_allMaterial) exitWith {hint localize "STR_PM_NoMaterial";};
//Some checks
if((count _matsNeed) == 0) exitWith { hint "You do not have the required materials.";};
if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint localize "STR_CRAFT_AR_Backpack";
};
if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint localize "STR_CRAFT_AR_Uniform";
};

if(_itemFilter == "ammo" && !(player canadd _item)) exitwith{
        hint "Inventory full";
};

if(_itemFilter == "attach" && !(player canadd _item)) exitwith{
        hint "Inventory full";
};

if(_itemFilter == "vest" && vest player != "") exitwith {
        hint "You are wearing a vest. You can't wear two vests, or make space in your backpack - Thanks Arma";
};

if(_itemFilter == "vehicle") then {
    if(count nearestObjects[getmarkerpos _site,["Car","Air","Ship"],10] > 0) exitwith {
        hint "A vehicle is too close to the spawn point (the map marker)";
    };
};

if(_itemFilter == "item") then {
	_weight = M_CONFIG(getNumber,"VirtualItems",_item,"weight");
	if (life_carryWeight + _weight > life_maxWeight) exitWith { hint localize "STR_NOTF_NoRoom";};
};
if(_itemFilter == "weapon" && !(player canAdd _item) && (currentWeapon player != "")) exitWith {hint localize "STR_NOTF_NoRoom";};
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
	_handledItem = M_CONFIG(getText,"VirtualItems",_oldItem select _i,"variable");
	if(!([false,_oldItem select _i,_oldItem select (_i+1)] call life_fnc_handleInv)) then {
        if(!_vehicleCheck) exitwith {_removeItemSuccess = false;};
        _vehCheck = [_trunk,_oldItem select _i,_oldItem select (_i+1),true] call life_fnc_itemInVeh;
        if(!(_vehCheck select 0)) exitWith {_removeItemSuccess = false;};
        _invAmount = _trunk select (_vehcheck select 1) select 1;
        _weight = ([_oldItem select _i] call life_fnc_itemWeight) * (_oldItem select (_i+1));
        if((_oldItem select (_i+1)) == _invAmount) then {
            _trunk set [(_vehCheck select 1),-1];
            _trunk = _trunk - [-1];
        } else {
            _trunk set [(_vehCheck select 1),[(_oldItem select _i),(_invAmount - (_oldItem select (_i+1)))]];
        };
        _nearCar setvariable ["Trunk",[_trunk,(_oldItem select (_i+1)) - _weight],true];
    };
};
if(!_removeItemSuccess) exitWith {hint "Failed to remove items"; life_is_processing = false;};
[] call life_fnc_p_updateMenu;
life_is_processing = true;
while{true} do
{
	sleep  0.3;
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
    }else {
        hint "You are wearing a vest. You can't wear two vests";
        life_is_processing = false;
    };
};

if(_itemFilter == "ammo") then{
    if(player canAdd _newItem) then{
        player addMagazine _newitem;
    }else{
        hint "Inventory full";
    };
};

if(_itemFilter == "attach") then{
    if(player canAdd _newItem) then{
        player addItem _newitem;
    }else{
        hint "Inventory full";
    };
};

if(_itemFilter == "item") then{
	_handledItem = M_CONFIG(getText,"VirtualItems",_newitem,"variable");
    if(_newitem == "plastic") then {
        [true,_handledItem,3] call life_fnc_handleInv;
    } else {
        [true,_handledItem,1] call life_fnc_handleInv;
    };
};
if(_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player addUniform _newItem;
	}else{
		hint localize "STR_CRAFT_AR_Uniform";
		life_is_processing = false;
	};
};

if(_itemFilter == "vehicle") then {
    _vehicle = createVehicle [_item, (getMarkerPos _site), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _site));
	_vehicle setDir (markerDir _site);
	_vehicle setPos (getMarkerPos _site);
	[[_vehicle,0],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
	_vehicle disableTIEquipment false;
    [[_vehicle,"vehicle_side","civ",true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
    _vehicle allowDamage true;
    life_ogVehicles pushBack _vehicle;
    [[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
    [[(getPlayerUID player),playerSide,_vehicle,0,0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
    
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
				_handledItem = M_CONFIG(getText,"VirtualItems",_oldItem select _i,"variable");
				[true,_handledItem,_oldItem select _i+1] call life_fnc_handleInv;
			};
			life_is_processing = false;
		};
	};
};
5 cutText ["","PLAIN"];
titleText[format[localize "STR_CRAFT_Process",_itemName],"PLAIN"];
life_is_processing = false;