/*
File : fn_civShowAHWLicense.sqf
Edit : G00golplexian

Beschreibung : Fuegt eine 'AHW-Mitgliedskarte' hinzu
*/

private["_target", "_message"];

_target = cursorObject;

if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

_message = format["<img size='10' color='#FFFFFF' image='images\ahwcart.paa' /><br/><br/><t size='1.5'>%1</t><br/>ist Premium Mitglied beim AHW.<br/>",name player];
[player, _message] remoteExecCall ["life_fnc_LicenseShown",_target];