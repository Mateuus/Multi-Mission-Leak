/*
	File: fn_revivednoFee.sqf
	Author: Bryan "Tonic" Boardwine
	(Bloodwyn)

	Description:
	THANK YOU JESUS I WAS SAVED! And its for free!
*/

private["_medic","_dir"];
_medic = param [0,"Unknown Medic",[""]];
[lhm_save_gear] spawn lhm_fnc_loadDeadGear;
//_oldGear = [lhm_corpse] call lhm_fnc_fetchDeadGear;
//[_oldGear] spawn lhm_fnc_loadDeadGear;
lhm_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[lhm_corpse],"lhm_fnc_corpse",nil,FALSE] call lhm_fnc_mp;
_dir = getDir lhm_corpse;


if(LHM_disease > 1) then {
	[] call LHM_fsm_fnc_disease;
};

lhm_is_arrested = 0;
[5] call SOCK_fnc_updatePartial;

closeDialog 0;
lhm_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy lhm_deathCamera;

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL lhm_corpse);
lhm_corpse setVariable["Revive",nil,TRUE];
lhm_corpse setVariable["name",nil,TRUE];
[[lhm_corpse],"lhm_fnc_corpse",true,false] call lhm_fnc_mp;
deleteVehicle lhm_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;

[] spawn {
waitUntil {isNull (findDisplay 38500) || isNull (findDisplay 7300)}; // wait for spawn and death screen
	if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) then {
		diag_log "::lhm Client:: reinitializing Survival Functions...";
		[] execVM "core\init_survival.sqf";
		[] call lhm_fnc_hudSetup;
	};

};