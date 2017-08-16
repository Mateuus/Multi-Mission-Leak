private ["_target","_message"];  

_target = cursorTarget;  

if(playerSide != civilian) exitWith  
{  
    hint "You're not a civilian!";  
};  

params [
	["_civ","",[""]],
	["_licenses",(localize "STR_Cop_NoLicenses"),[""]]
];

if( isNull _target) then {_target = player;};  
if( !(_target isKindOf "Man") ) then {_target = player;};  
if( !(alive _target) ) then {_target = player;};  

_message = format["<br/><t size='2.5'>%1</t><br/><t size='1'>Civilian Of Altis</t>", name player];
_message = format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2",_civ,_licenses];

[player, _message] remoteExec ["life_fnc_passeportCiv",_target];
[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];