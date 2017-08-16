/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Gives items to a nearby player
*/

private ["_zeroWeight","_value","_unit","_parsed","_held","_str","_longName"];

_value = ctrlText 3131;
_parsed = (parseNumber(_value));
_item = lbData[9009,(lbCurSel 9009)];
ctrlShow[2001,false];
if((lbCurSel 2023) == -1) exitWith {hint "You have not selected anybody";ctrlShow[2001,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
//_held = 0;

_zeroWeight = ["battery","spyDocs","jail10","safeCrackerAdv","jailBreak","steriods","noRecoil","quickCap","pawnee","convoy"];
if((_item in _zeroWeight)&&(_parsed > 1))exitWith
	{
	hint "The item you're trying to give is weightless, because of this you must give no more than one at a time";
	};

//Check for people doing stupid things
if(_parsed < 1)exitwith{hint "You have not entered a valid amount"};
if(isNull _unit)exitwith{ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
if(player getVariable ["cuffed",false])exitwith{hint "Your hands are tied, you can't do this"};
_longName = format ["DS_item_%1",_item];
//_held = missionNamespace getVariable _longName;
if(_parsed > (missionNamespace getVariable _longName))exitwith{hint "You do not have enough of this item type to remove"};
_str = [_item] call DS_fnc_itemStringConfig;
[_item,false,_parsed] call DS_fnc_handleInventory;
if(isNil "_item")exitwith{hint "Some error occurred"};
[[_item,_parsed,player,_unit],"DS_fnc_getItem",_unit,false] spawn BIS_fnc_mp;

if(_parsed == 1)then
	{
	hint format ["You have given %1 a %2",(name _unit),_str];
	systemchat format ["You have given %1 a %2",(name _unit),_str];
	}
	else
	{
	hint format ["You have given %1 %2 %3s",(name _unit),_parsed,_str];
	systemchat format ["You have given %1 %2 %3s",(name _unit),_parsed,_str];
	};

[] call DS_fnc_compileData;
closeDialog 0;
sleep 0.1;
[] spawn DS_fnc_menuPlayer;





















