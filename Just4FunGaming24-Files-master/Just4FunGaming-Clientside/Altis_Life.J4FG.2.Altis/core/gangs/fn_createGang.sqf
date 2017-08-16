/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];

disableSerialization;

_gangName = ctrlText ((findDisplay 2520) displayCtrl 2522);
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if( _length > 32 ) exitWith {
    hint localize "STR_GNOTF_Over32"
};
_badChar = false;
{
    if( !(_x in _allowed) ) exitWith {
        _badChar = true;
    };
} forEach _chrByte;

if( _badChar ) exitWith {
    hint localize "STR_GNOTF_IncorrectChar";
};

closeDialog 0;

if( !([XY_gangPrice] call XY_fnc_pay) ) exitWith {
    hint "Du hast nicht genügend Geld für die Gründung einer Gang";
};

hint "Gang wird gegründet...";
[player, _gangName] remoteExec ["XYDB_fnc_insertGang", XYDB];