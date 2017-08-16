/*
    Show cop license to target player
*/
 
private["_target","_message"];
 
_target = cursorTarget;
 
if( isNull _target) then {_target = player;};
 
if( !(_target isKindOf "Man") ) then {_target = player;};
 
if( !(alive _target) ) exitWith { hint "Je crois qu'il t'a mis un vent"; };
 
_message = format["<img size='10' color='#FFFFFF' image='icons\cop.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1'>Gendarme d'Altis</t>", name player];
 
[player, _message] remoteExecCall ["life_fnc_civLicenseShown",_target];