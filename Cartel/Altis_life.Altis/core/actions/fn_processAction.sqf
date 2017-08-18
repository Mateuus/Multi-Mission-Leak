#include <macro.h>
/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_vals","_delayInt","_check"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;

if(isNull _vendor OR _type == "" OR (player distance _vendor > 6)) exitWith {};
if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if (side player == west) exitWith {hint "You cannot preform this action as an officer."};


_itemInfo = switch (_type) do
{
	case "oil": {[["oilu"],"oilp",13,"Processing Oil",0];};
	case "diamond": {[["diamond"],"diamondc",10,"Processing Diamonds",0]};
	case "heroin": {[["heroinu"],"heroinp",11,"Processing Heroin",4]};
	case "copper": {[["copperore"],"copperr",6,"Processing Copper",0]};
	case "iron": {[["ironore"],"ironr",20,"Processing Iron",0]};
	case "gold": {[["goldore"],"goldr",30,"Smelting Gold",0]};
	case "sand": {[["sand"],"glass",7,"Processing Sand",0]};
	case "salt": {[["salt"],"saltr",7,"Processing Salt",0]};
	case "cocaine": {[["cocaine"],"cocainep",17,"Processing Cocaine",2]};
	case "marijuana": {[["cannabis"],"marijuana",6,"Processing Marijuana",0]};
	case "cement": {[["rock"],"cement",11,"Mixing Cement",0]};
	case "log": {[["log"],"lumber",11,"Sawing Wood",0]};
	case "meth": {[["eph","hydro","phos"],"meth",37,"Cooking Meth",3]};
	case "steel" : {[["coalore","ironore"],"steel",25,"Forging Steel",0]};
	case "moonshine" : {[["corn"],"moonshine", 10, "Distilling Liquor",0]};
	case "plate" : {[["plateMetal"],"plate",0,"Pressing Plate",0]};
	case "shank" : {[["plate"],"shank",0,"Making Shank",0]};
	default {[]};
};
_capture = if(_itemInfo select 4 > 0) then {true} else {false}; //determines if our output should be affected by the gang controlling the territory in question...

if(count _itemInfo == 0) exitWith {hint "You don't have the items necessary"};


_oldItem = [];
_vals = [];
life_action_inUse = true;
{_oldItem = _oldItem + [_x];} foreach (_itemInfo select 0);
if(count _oldItem == 0) exitWith {hint "You don't have the items necessary"};
{_vals = _vals + [missionNamespace getVariable ([_x,0] call life_fnc_varHandle)];} foreach _oldItem;
_oldVal = _vals select 0;
{if (_x < _oldVal) then {_oldVal = _x};} foreach _vals;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
if(_type in ["meth","heroin","cocaine","plate","shank"]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if(_oldVal == 0) exitWith {};
_cost = _cost * _oldVal;

if((!_hasLicense)&&(life_atmcash < _cost)) exitWith { //mind your cash variable please!
	hint "You do not have enough money available to process without a license!";
	life_action_inUse = false;
};


disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;




{
	if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false;
	};
} foreach _oldItem;

_delayInt = _oldVal * 0.03;
while{true} do {
	sleep _delayInt;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vendor > 10) exitWith {};
};

if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if(!(alive player)) exitWith {hint "You need to be alive to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if((!_hasLicense)&&(life_atmcash < _cost)) exitWith {hint "You do not have enough money available to process without a license!"; life_is_processing = false; life_action_inUse = false;};


_oldOldVal = _oldVal;
_toSelect = if(_capture) then {life_capture_list select ((_itemInfo select 4) -1)} else {nil};
if(_capture) then {
	if((_toSelect select 2) == 1) then {
		if(!((_toSelect select 0) == (group player getVariable["gang_name",""]))) then {
			if(_type == "meth") then { _oldVal = floor(_oldVal * 0.9);  } else {_oldVal = floor(_oldVal * 0.8); };
		};
	};
};
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
	5 cutText ["","PLAIN"];
	{[true,_x,_oldVal] call life_fnc_handleInv;} foreach _oldItem;
	life_is_processing = false;
	life_action_inUse = false;
};

5 cutText ["","PLAIN"];
if (_hasLicense) then {
	_out = format["You have processed your goods into %1",_itemName];
	if(_capture) then {
	if((_toSelect select 2) == 1) then {
		if((_toSelect select 0) == (group player getVariable["gang_name",""])) then { _out = _out + format[", as a member of %1 you retain all of your product",group player getVariable["gang_name",""]]; }
		else {
			_out = _out + format[", You retain %2 after the owners of %3 took a cut of %4 %1.",_itemName,_oldVal,_toSelect select 0,_oldOldVal - _oldVal]; 
			/*_index = [_newItem,sell_array] call fnc_index;
			_price = (sell_array select _index) select 1;
			_marketprice = [_newItem] call life_fnc_marketGetSellPrice;
			if(!isNil "_marketPrice") then {
			if(!(_marketprice in [0,-1])) then
			{
				_price = _marketprice;
			};
			};
			if(isNil "_price") then { _price = (sell_array select _index) select 1; };
			if(_price == 0) then {_price = (sell_array select _index) select 1; };
			_price = round (_price * (_oldOldVal - _oldVal));
			*/
			
			// !READ!
			//The above is price calculation for the dynamic market on my mission, you will need to edit this and determine the price to be sent to the gang yourself!
			_price = 1; //placeholder
			[[5,nil,(_toSelect select 0),_price],"TON_fnc_updateGang",(false),false] spawn life_fnc_MP;
		};
	};
	};
	titleText[_out,"PLAIN"];
	life_action_inUse = false;
} else {
	titleText[format["You have processed your goods into %1 for $%2",_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	["atm","take",_cost] call life_fnc_handlePaper;
	life_action_inUse = false;
};

if(_type == "plate") then {
_check = life_bail_amount;
life_bail_amount = life_bail_amount - (0.015 * _check);
};

life_is_processing = false;
life_action_inUse = false;