#include <macro.h>
/*
	File: fn_vAH_loadInventory.sqf
	Author: Fresqo
	Description: Loads players items from person and auction house and displays it in game UID
	- The load i gear is from Tonics base code pretty sure
*/
waitUntil {createDialog "AH_vsell";};

disableSerialization;
_dialog = findDisplay 15600;
_myInvListbox = _dialog displayCtrl 15601;

lbClear _myInvListbox;
playerInventoryArray = [];
_magazines = magazines player;
_items = items player;
_weapons = currentWeapon player;
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _magazines;

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _items;

if (_weapons!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _weapons) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_weapons,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_weapons,1]];
	};
};

if (_backpack!="") then {
	playerInventoryArray pushBack [_backpack,1];
};

if (_vest!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _vest) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_vest,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_vest,1]];
	};
};

if (_uniform!="") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 == _uniform) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_uniform,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_uniform,1]];
	};
};

 private["_allmine","_val","_name"];  
 //{   _val = missionNameSpace getVariable _x;   if (_val > 0) then {_name = [_x,1] call life_fnc_varHandle; playerInventoryArray pushBack [_name,_val,3,"ymenu"]};  } foreach ("true" configClasses (missionConfigFile >> "ANL_VItems")); 
 { _val = ITEM_VALUE(configName _x); if (_val > 0) then {	_y = configName _x;	_name = _y;	playerInventoryArray pushBack [_name,_val,3,"ymenu"];	}; } foreach ("true" configClasses (missionConfigFile >> "ANL_VItems"));

playerInventoryArray pushback ["yolo"];
private["_uid","_type","_status","_stat","_itemDisplayName","_pic","_item","_price","_priceDisplay","_time","_timeDisplay","_id","_toDel"];
_uid = getPlayerUID player;
_price = 0;
{if(_x select 5 == _uid && _x select 1 == 0) then {playerInventoryArray pushBack [_x select 3 select 0,_x select 2,_x select 7,"ymenu",_x select 8,_x select 4,_x select 0]};} forEach all_ah_items; //GET Y MENU AND THEIR STATUS
{if(_x select 5 == _uid && _x select 1 == 1) then {playerInventoryArray pushBack [_x select 3 select 0,_x select 2,_x select 7,"imenu",_x select 8,_x select 4,_x select 0]};} forEach all_ah_items; //GET I MENU AND THEIR STATUS

_index = -1;
if (count playerInventoryArray == 1) then {
		_myInvListbox lbAdd format ["Vous n'avez pas d'objet dans votre inventaire ou a marché noir !"];
	} else {
{
	_status = [_x,2,3,[3]] call BIS_fnc_param;
	switch (_status) do {
		case 0: {_stat = ": A VENDRE"}; //AH: for sale
		case 1: {_stat = ": EXPIRE"}; //AH: expired
		case 2: {_stat = "VENDU"}; //sold
		case 3: {_stat = ": Dans mon inventaire"}; //MY INV
	};
	_type = [_x,3,"",[""]] call BIS_fnc_param;
	_item = _x select 0;
	_id = [_x,6,0,[0]] call BIS_fnc_param;
	_index = _index + 1;
	if (_item == "yolo") then {
			_myInvListbox lbAdd format ["-------------------- OBJETS DU MARCHE NOIR -----------------------"];
			_myInvListbox lbSetData [(lbSize _myInvListbox)-1,format ["%1",[_x select 0]]];
		} else {
	switch (_type) do {
		case "imenu": {
			_itemDisplayName = ([_item] call life_fnc_fetchCfgDetails) select 1;
			_pic = [_item] call life_fnc_fetchCfgDetails select 2;
			_price = [_x,5,0,[0]] call BIS_fnc_param;
			_time = [_x,4,0,[0]] call BIS_fnc_param;
			_time = round (_time / 3);
			if (_time <= 0) then {_price = 0; if (_status == 1) then {_toDel = round(_time + 216); _timeDisplay = format[": Supprimé dans %1 heure",_toDel]} else {_timeDisplay = "";};} else {_timeDisplay = format[": Expire dans %1 heure",_time]};
			if (_price == 0) then {_priceDisplay = ""} else {_priceDisplay = format[": Prix %1€",[_price]call life_fnc_numberText];};
			};
		case "ymenu": {
			//_itemDisplayName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
			//_pic = [([_item,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
			_itemDisplayName = localize ITEM_NAME(_item);
			_pic = M_CONFIG(getText,"ANL_VItems",_item,"icon");
			_price = [_x,5,0,[0]] call BIS_fnc_param;
			_time = [_x,4,0,[0]] call BIS_fnc_param;
			_time = round (_time / 3);
			if (_time <= 0) then {_price = 0; if (_status == 1) then {_toDel = round(_time + 216); _timeDisplay = format[": Supprimé dans %1 heure",_toDel]} else {_timeDisplay = "";};} else {_timeDisplay = format[": Expires in %1 Hrs",_time]};
			if (_price == 0) then {_priceDisplay = ""} else {_priceDisplay = format[": Prix %1€",[_price]call life_fnc_numberText];};			
			};
		default {
			_itemDisplayName = ([_item] call life_fnc_fetchCfgDetails) select 1;
			_pic = [_item] call life_fnc_fetchCfgDetails select 2;
			_price = [_x,5,0,[0]] call BIS_fnc_param;
			_time = [_x,4,0,[0]] call BIS_fnc_param;
			_time = round (_time / 3);
			if (_time <= 0) then {_price = 0; if (_status == 1) then {_toDel = round(_time + 216); _timeDisplay = format[": Supprimé dans %1 heure",_toDel]} else {_timeDisplay = "";};} else {_timeDisplay = format[": Expire dans %1 heure",_time]};
			if (_price == 0) then {_priceDisplay = ""} else {_priceDisplay = format[": Prix de l'enchere %1€",[_price]call life_fnc_numberText];};
			};
	};
	
	_itemQuantity = _x select 1;
	
	_myInvListbox lbAdd format ["(%2) %1 %3 %4 %5",_itemDisplayName,_itemQuantity,_stat,_priceDisplay,_timeDisplay];
	_myInvListbox lbSetPicture [_index, _pic];
	_myInvListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
	_myInvListbox lbSetData [(lbSize _myInvListbox)-1,format ["%1",[_x select 0,_type,_status,_itemQuantity,_id]]];
			};
} forEach playerInventoryArray;};

while {true} do
{
	uiSleep 1;
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 1;
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 1;
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 1;
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 1;
	((findDisplay 15600) displayCtrl 15660) ctrlSetText "";
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 0.1;
	((findDisplay 15600) displayCtrl 15660) ctrlSetText "";
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 0.1;
	((findDisplay 15600) displayCtrl 15660) ctrlSetText "";
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 0.1;
	((findDisplay 15600) displayCtrl 15660) ctrlSetText "";
	if (isNull (findDisplay 15600)) exitWith {};
	uiSleep 0.1;
	((findDisplay 15600) displayCtrl 15660) ctrlSetText "";
	if (isNull (findDisplay 15600)) exitWith {};
};