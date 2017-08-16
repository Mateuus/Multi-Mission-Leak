/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];
disableSerialization;

_gangName = ctrlText ((findDisplay 2520) displayCtrl 2522);
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"; };
_badChar = false;

{
	if (!(_x in _allowed)) exitWith { _badChar = true; };
} foreach _chrByte;

if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar"; };

if(life_atmcash < (call life_gangPrice)) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney", [((call life_gangPrice) - life_atmcash)] call life_fnc_numberText];};

[player, _gangName] remoteExecCall ["life_fnc_gangCreateRequest",2];

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;
