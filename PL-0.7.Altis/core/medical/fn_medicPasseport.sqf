/*
	Montrer son passeport 
@Author : Heimdall @AltisAurore.fr
*/

private["_target","_message"];

_target = cursorTarget;

if(playerSide != civilian) exitWith
{
    hint "Tu n'es pas un citoyen !";
};

if( isNull _target) then {_target = player;};

if( !(_target isKindOf "Man") ) then {_target = player;};

if( !(alive _target) ) then {_target = player;};

_message = format["<img size='10' color='#FFFFFF' image='icons\civ.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1'>Citoyen d'Altis</t>", name player];

[[player, _message],"life_fnc_passeportCiv",_target,false] spawn life_fnc_MP;