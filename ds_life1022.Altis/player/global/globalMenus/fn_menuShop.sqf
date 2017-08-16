/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the players shop menus (Gets rid of hundreds of crappy add actions)
*/

private ["_dialog","_title","_shopList","_img","_className","_name","_vehicleList","_toolTip","_spawn","_shopArray","_shopType","_infoArray"];

disableSerialization;

_special = false;
if((count(_this select 3) > 2))then{_special = true};

//Detecting the scrolled item when it's coming from an action
if(_special)then {
	closeDialog 0;
	sleep 0.2;
};

if(!dialog)then {
	if(!(createDialog "shopMenu"))exitWith{};
};

DS_spawnPoint = (_this select 3) select 0;
_shopArray = (_this select 3) select 1;

_dialog = findDisplay 666667;
_title = _dialog displayCtrl 1100;
_shopList = _dialog displayCtrl 1500;
_vehicleList = _dialog displayCtrl 1501;
_shopType = 0;
_infoArray = [];

//Text
_title ctrlSetStructuredText parseText "<t size='1.6' color='#848484'>Darkside Shop Management</t>";

//List
lbClear _shopList;

{
	_infoArray = [_x] call DS_fnc_shopInfoConfig;
	_name = _infoArray select 0;
	_img = _infoArray select 1;
	_toolTip = _infoArray select 2;
	if(([_img] call DS_fnc_strLen) < 15)then{_img = format ["extras\icons\%1.jpg",_img];};
	
	_index = _shopList lbAdd format ["%1",_name];
	_shopList lbSetPicture [_index,_img];
	_shopList lbSetTooltip [_index,_toolTip];
	_shopList lbSetData [_index,str(_x)];
} forEach _shopArray;

ctrlShow [777,false];
ctrlShow [778,false];
ctrlShow [66653,false];
ctrlShow [66654,false];
ctrlShow [1212,false];
ctrlShow [1213,false];
ctrlShow [1214,false];
ctrlShow [1215,false];
ctrlShow [1216,false];
ctrlShow [1217,false];
ctrlShow [1218,false];
ctrlShow [1219,false];