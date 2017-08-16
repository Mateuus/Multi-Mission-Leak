/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	All simple processing
*/

private["_tempNum","_tub","_typeA","_typeB","_double","_itemInfo","_amount","_sleep","_old","_new"];
if(DS_mining)exitwith{};
_itemInfo = [];
_amount = 0;
_sleep = 0.3;
if((DS_infoArray select 13) > 22)then {_sleep = 0.2};
_tub = DS_className select 0;
_typeA = DS_className select 1;

switch(_typeA)do
	{
	case "oilu": {_itemInfo = ["DS_item_oilp","DS_item_oilu","Processing Oil","oilp"]};
	case "diamondu": {_itemInfo = ["DS_item_diamondp","DS_item_diamondu","Processing Diamonds","diamondp"]};
	case "copperu": {_itemInfo = ["DS_item_copperp","DS_item_copperu","Processing Copper","copperp"]};
	case "rocku": {_itemInfo = ["DS_item_rockp","DS_item_rocku","Processing Rocks","rockp"]};
	case "saltu": {_itemInfo = ["DS_item_saltp","DS_item_saltu","Processing Salt","saltp"]};
	case "ironu": {_itemInfo = ["DS_item_ironp","DS_item_ironu","Processing Iron","ironp"]};
	case "sandu": {_itemInfo = ["DS_item_sandp","DS_item_sandu","Processing Sand","sandp"]};
	case "woodu": {_itemInfo = ["DS_item_woodp","DS_item_woodu","Processing Lumber","woodp"]};
	case "weedu": {_itemInfo = ["DS_item_weedp","DS_item_weedu","Processing Weed","weedp"]};
	case "heroinu": {_itemInfo = ["DS_item_heroinp","DS_item_heroinu","Processing Heroin","heroinp"]};
	case "cocaineu": {_itemInfo = ["DS_item_cocainep","DS_item_cocaineu","Processing Cocaine","cocainep"]};
	case "illegalRelicu": {_itemInfo = ["DS_item_illegalRelicp","DS_item_illegalRelicu","Polishing Relics","illegalRelicp"]};
	case "wheatu": {_itemInfo = ["DS_item_wheatp","DS_item_wheatu","Baking Bread","wheatp"]};
	default {_itemInfo = []};
	};

if(_itemInfo isEqualTo [])exitwith{};

_amount = missionNamespace getVariable (_itemInfo select 1);
_old = [(_itemInfo select 1)] call DS_fnc_itemStringConfig;
_new = [(_itemInfo select 0)] call DS_fnc_itemStringConfig;

if(_amount == 0)exitwith{};//DF

disableSerialization;
_upp = (_itemInfo select 2);
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

DS_mining = true;

while{true} do
	{
	sleep _sleep;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _tub > 10) exitWith {};
	if(!isNull objectParent player) exitWith {};
	};

DS_mining = false;
if(player distance _tub > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]};
if(!isNull objectParent player) exitWith {hint "You can not process while inside a vehicle."; 5 cutText ["","PLAIN"]};

"progressBar" cutText ["","PLAIN"];
titleText[format["You have processed %1 %2 into %1 %3",_amount,_old,_new],"PLAIN"];

[_typeA,false,_amount] call DS_fnc_handleInventory;
[(_itemInfo select 3),true,_amount] call DS_fnc_handleInventory;

if(((DS_infoArray select 13) == 22)&&(_typeA in ["oilu","diamondu","copperu","rocku","saltu","ironu","sandu","woodu","wheatu"]))then {
	_tempNum = (DS_infoArray select 14) + _amount;
	if(_tempNum > 299)then {
		[0] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [14,_tempNum];
	};
};

if(((DS_infoArray select 15) == 25)&&(_typeA in ["illegalRelicu"]))then {
	_tempNum = (DS_infoArray select 16) + _amount;
	if(_tempNum > 299)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if(((DS_infoArray select 15) == 27)&&(_typeA in ["cocaineu","heroinu","weedu"]))then {
	_tempNum = (DS_infoArray select 16) + _amount;
	if(_tempNum > 499)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if(((DS_infoArray select 15) == 40)&&(_typeA in ["cocaineu","heroinu","weedu"]))then {
	_tempNum = (DS_infoArray select 16) + _amount;
	if(_tempNum > 999)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};

if(((DS_infoArray select 15) == 43)&&(_typeA in ["illegalRelicu"]))then {
	_tempNum = (DS_infoArray select 16) + _amount;
	if(_tempNum > 499)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};