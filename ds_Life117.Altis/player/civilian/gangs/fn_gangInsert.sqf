#include <macro.h>
/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Attempts to create the gang
*/


private ["_badChar"];
disableSerialization;
if(DS_doingStuff)exitwith{};
_GANGPRICE = 1000;
_gangName = ctrlText (getControl(666673,1400));
_length = (count(toArray _gangName));
_chars = (toArray _gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_ ");
if(_length > 10)exitwith{hint "You gang name is too long, 10 characters is the maximum"};
if(_gangName in ["No Gang","Not In A Gang","Gang","Your Gang Name","your gang name","Police","police"])exitwith{hint "Real creative name bro... Think of a different one..."};
if(_gangName in DS_gangNames)exitwith{hint "There is already a gang created with this name, please select a different one"};
if((player getVariable["cuffed",FALSE]) OR (player getVariable["Escorted",FALSE]) OR (player getVariable["cuffedVeh",FALSE]))exitwith{hint "You cant create a gang while restrained"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chars;
if(_badChar) exitWith {hint "You have an invalid character in your chosen name";};
if(DS_atmcoin < (_GANGPRICE)) exitWith {hint format ["The gang creation price is currently $%1, you do not have enough in your bank to cover this cost",_GANGPRICE];};
DS_gangNames pushBack _gangName;
publicVariable "DS_gangNames";
[[player,_gangName],"HUNT_fnc_addGang",false,false] spawn BIS_fnc_MP;
hint "Creating your gang.....";
closeDialog 0;
DS_doingStuff = true;




























