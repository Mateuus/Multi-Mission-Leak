/*
	Will be revised later
*/


if(!("Medikit" in (items player))) exitWith {};
 
 
_unit = cursorTarget;
if (side player in [east,civilian]) then {
player removeItem "Medikit";
};
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uisleep 9;
[[player],"EMonkeys_fnc_healex",_unit,false] call EMonkeys_fnc_mp;
