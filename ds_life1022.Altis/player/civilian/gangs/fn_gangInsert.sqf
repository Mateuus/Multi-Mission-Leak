/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Attempts to create the gang
*/

disableSerialization;

if(DS_doingStuff)exitWith{};

private _dialog = findDisplay 666673;
private _gangNameCtrl = _dialog displayCtrl 1400;
private _gangName = ctrlText _gangNameCtrl;
private _length = (count (toArray _gangName));
private _chars = (toArray _gangName);
private _allowed = toArray ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_ ");

if(_length > 10)exitWith{hint "Your gang name can be no longer than 10 characters"};
if((toLower _gangName) in ["no gang","not in a gang","gang","your gang name","police"])exitWith{hint "Real creative name bro... Think of a different one..."};
if(_gangName in DS_gangNames)exitWith{hint "There is already a gang created with this name, try a different one.\n\n If this is not true, try again in up to 15 minutes as the gang list may not have refreshed yet."};
if((player getVariable["restrained",false])||(player getVariable["escorted",false]))exitWith{hint "You can't create a gang while restrained"};

private _badChar = false;
{if(!(_x in _allowed))exitWith{_badChar = true;};} forEach _chars;
if(_badChar)exitWith{hint "You have an invalid character in your chosen name";};

private _badName = [_gangName] call DS_civ_confirmClanName;
if(_badName)exitwith {
	hint "You can not use this gang name as it belongs to a clan";
};

DS_doingStuff = true;

DS_gangNames pushBack _gangName;
publicVariable "DS_gangNames";

hint "Creating your gang...";
[player,_gangName] remoteExecCall ["HUNT_fnc_addGang",2];
closeDialog 0;