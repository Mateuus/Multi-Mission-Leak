#include <macro.h>
/*
Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_coplevel","_rang"];

_target = cursorTarget;

if(playerSide != west) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_coplevel = player getVariable "rank";

switch ( _coplevel ) do
{
	case 1: { _rang = "Recruit"; };
	case 2: { _rang = "Officer"; };
	case 3: { _rang = "Sergeant"; };
	case 4: { _rang = "Lieutenant"; };
	case 5: { _rang = "Captain"; };
	case 6: { _rang = "Major"; };
	case 7: { _rang = "General"; };
	case 8: { _rang = "Chief"; };
	case 9: { _rang = "Commissioner"; };
	default {_rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\marke.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Tanoa Police Department</t>", name player, _rang];
[_message, { hintSilent parseText (_this); }] remoteExec ["BIS_FNC_CALL", _target, false];
