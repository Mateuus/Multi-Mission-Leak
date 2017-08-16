/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gives items to a nearby player
*/

private ["_value","_parsed","_item","_unit","_str"];

_value = ctrlText 3131;
_parsed = (parseNumber (_value));
_item = lbData [9009,lbCurSel 9009];

ctrlShow [2001,false];

if(isNil "DS_houseBlock")then{DS_houseBlock = false;};
if(DS_houseBlock)exitWith{hint "You can not give items away at the moment because you have recently robbed something";};

if((lbCurSel 2023) isEqualTo -1)exitWith{hint "You have not selected anybody";ctrlShow[2001,true];};

_unit = lbData [2023,lbCurSel 2023];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{ctrlShow[2001,true];};
//if(_unit isEqualTo player)exitWith{ctrlShow[2001,true];};

_zeroWeight = ["battery","spyDocs","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","pawnee","convoy"];
if((_item in _zeroWeight)&&(_parsed > 1))exitWith {
	hint "The item you're trying to give is weightless, because of this you must give no more than one at a time";
};

//Check for people doing stupid things
if(_parsed < 1)exitWith{hint "You have not entered a valid amount"};
if(player getVariable ["restrained",false])exitWith{hint "You can't do this while restrained"};
if(_parsed > (missionNamespace getVariable (format ["DS_item_%1",_item])))exitWith{hint "You do not have enough of this item type to give"};

[_item,false,_parsed] call DS_fnc_handleInventory;
[_item,_parsed,_unit,player] remoteExec ["DS_fnc_getItem",_unit];

_str = [_item] call DS_fnc_itemStringConfig;

if(_parsed isEqualTo 1)then {
	hint format ["You have given %1 a %2",(name _unit),_str];
	systemChat format ["You have given %1 a %2",(name _unit),_str];
} else {
	hint format ["You have given %1 %2 %3s",(name _unit),_parsed,_str];
	systemChat format ["You have given %1 %2 %3s",(name _unit),_parsed,_str];
};

[] call DS_fnc_compileData;
closeDialog 0;
sleep 0.1;
[] spawn DS_fnc_menuPlayer;