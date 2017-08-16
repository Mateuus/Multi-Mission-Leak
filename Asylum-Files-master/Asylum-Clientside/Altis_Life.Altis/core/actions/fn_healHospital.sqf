/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(!([50] call life_fnc_debitCard)) exitWith {};
titleText["The doctor is healing you... don't be scared...","PLAIN"];
sleep 7;
if(player distance (_this select 0) > 5) exitWith {titleText["You need to be within 5m while the doctor is healing you.","PLAIN"]};
titleText["You are now fully healed!","PLAIN"];
//[[19, player, format["Healed at the hospital"]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

player setVariable["can_revive", nil, true];
player setDamage 0;
[0] call life_fnc_setPain;
[false] call life_fnc_brokenLeg;