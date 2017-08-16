/*
	File: fn_onTake.sqf
	Author: Mario2002
            new Version by kingwolfi
	
	Description:
	gets called when a player is taking something out of container
*/
private["_item", "_container", "_unit","_owner"];

_unit = [_this,0] call BIS_fnc_param;
_container = [_this,1] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_owner = _container getVariable ["owner", ""];


//in case of called from a players backpack
if(_container isKindOf "Bag_Base") exitWith
{
    //hint format["taken from backpack type=%1 _item=%2 _container=%3", typeof _container,_item, _container];
    if( (backpackContainer player) != _container && ((side _unit) != west) && !(cursortarget getVariable["restrained",FALSE]) && !(cursortarget getVariable["restrainedciv",FALSE])) then
    {
        //Eine Zivi und das Opfer ist nicht gefesselt
        [_unit, _container, _item] call EMonkeys_fnc_onTakePutBackItem;
    };
};
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint "Sie sind nicht berechtigt, Leichen zu plündern!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	[_unit, _container, _item] call EMonkeys_fnc_onTakePutBackItem;
};



//in case of called from a vehicle inventory
if((_container isKindOf "Car") || (_container isKindOf "Ship") || (_container isKindOf "Air")) exitWith
{
    if(_container in EMonkeys_vehic164 || side _unit == west || (locked _container) == 0) then
    {
        //Besitzer oder ein Cop oder Fahrzeug ist aufgeschlossen --> Änderung wird gespeichert
        //hint format["take type=%1 _item=%2", typeof _container,_item];
        
    }
    else
    {
        //unberechtigter Zivi
        [_unit, _container, _item] call EMonkeys_fnc_onTakePutBackItem;
    };
};

if(_owner == "") exitWith
{
	[1,false] call SOCK_fnc_updateRequest;
};