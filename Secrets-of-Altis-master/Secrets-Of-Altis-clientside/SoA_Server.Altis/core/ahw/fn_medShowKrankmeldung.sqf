/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : G00golplexian

Beschreibung : Fuegt eine 'Krankmeldung' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_docs","_docsnamen"];

_target = cursorTarget;
if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

_message = format["<img size='10' color='#FFFFFF' image='images\krankmeldung.paa'/><br/><br/><t size='2'>Krankmeldung</t><br/><br/><t size='1'>%1 wurde krankgeschrieben und darf keine Arbeit verüben!</t><br/><t size='0.5'>Ärzteverband Altis</t>", name player];

[player, _message] remoteExecCall ["life_fnc_LicenseShown",_target];