/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid

if(isNil "life_arrestspam") then {life_arrestspam = false;};

if(life_arrestspam) exitWith { hint "Stop spamming the button."; };

[] spawn
{
	life_arrestspam = true;
	sleep 10;
	life_arrestspam = false;
};


[[_unit,player,false],"life_fnc_wantedBounty",false,false] call GTA_fnc_remoteExec;

//--- Add experience
[ "arrest", "Cleaning the Mean Streets" ] call GTA_fnc_addExp;

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[[_unit,false],"life_fnc_gtaJail",_unit,false] call GTA_fnc_remoteExec;
[[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["nametag_title",name _unit], profileName]],"life_fnc_broadcast",true,false] call GTA_fnc_remoteExec;

[[format[localize "STR_NOTF_Arrested_1", _unit getVariable["nametag_title",name _unit], profileName]],"GTA_fnc_logIt",false,false] call GTA_fnc_remoteExec;