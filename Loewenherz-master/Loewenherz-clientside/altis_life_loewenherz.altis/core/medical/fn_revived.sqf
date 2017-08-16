/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = param [0,"Unknown Medic",[""]];

[lhm_save_gear] spawn lhm_fnc_loadDeadGear;
//_oldGear = [lhm_corpse] call lhm_fnc_fetchDeadGear;
//[_oldGear] spawn lhm_fnc_loadDeadGear;

lhm_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[lhm_corpse],"lhm_fnc_corpse",nil,FALSE] call lhm_fnc_mp;

_dir = getDir lhm_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call lhm_revive_fee)] call lhm_fnc_numberText];

if(LHM_disease > 1) then {
	[] call LHM_fsm_fnc_disease;
};

lhm_is_arrested = 0;

player setDamage 0.75; // 25% life
player setFatigue 0;

closeDialog 0;
lhm_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy lhm_deathCamera;

//Take fee for services.
if(lhm_atmcash > (call lhm_revive_fee)) then {
	lhm_atmcash = lhm_atmcash - (call lhm_revive_fee);
} else {
	lhm_atmcash = 0;
};

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

if(LHM_Abzeichen != 0) then {
	player setVariable["Abzeichen",LHM_Abzeichen,true];

};

[[player,"defibrillator"],"lhm_fnc_say3d",(nearestObjects [player,["man"],20]),false]call lhm_fnc_mp;

// spawn visual effects
[] spawn {
	private["_obj"];
	player playMoveNow "Incapacitated";
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [100];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [4];
	"dynamicBlur" ppEffectCommit 4;
	Uisleep 4;
	[60] spawn lhm_fnc_bulletHit;

	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
	_obj setPosATL (getPosATL player);

	player attachTo [_obj,[0,0,0]];
	for "_i" from 1 to 60 step 1 do
	{
		playSound "heartbeat_1";
		Uisleep 1;
	};

	player playMoveNow "amovppnemstpsraswrfldnon";
	detach player;
	deleteVehicle _obj;
};


[] call SOCK_fnc_updateRequest;

[] spawn {
waitUntil {isNull (findDisplay 38500) || isNull (findDisplay 7300)}; // wait for spawn and death screen
	if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) then {
		diag_log "::lhm Client:: reinitializing Survival Functions...";
		[] execVM "core\init_survival.sqf";
		[] call lhm_fnc_hudSetup;
	};
};

