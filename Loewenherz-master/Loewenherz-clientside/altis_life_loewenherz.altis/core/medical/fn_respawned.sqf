/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
lhm_use_atm = TRUE;
lhm_hunger = 100;
lhm_thirst = 100;
lhm_carryWeight = 0;
lhm_cash = 0; //Make sure we don't get our cash back.
lhm_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

lhm_corpse setVariable["Revive",nil,TRUE];
lhm_corpse setVariable["name",nil,TRUE];
lhm_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new lhm'
switch(playerSide) do
{
	case west: {
		[] spawn lhm_fnc_loadGear; // load old gear
	};
	case civilian: {
		[] spawn lhm_fnc_civLoadout;
	};
	case independent: {
		[] spawn lhm_fnc_medicLoadout;
	};
	case east: {
		[] spawn lhm_fnc_loadGear;
	};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull lhm_corpse) then {
	private["_containers"];
	lhm_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[lhm_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody lhm_corpse;
};

//Destroy our camera...
lhm_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy lhm_deathCamera;

//Bad boy
if(lhm_is_arrested == 1) exitWith {
	hint localize "STR_Jail_Suicide";
	lhm_is_arrested = 0;
	[player,TRUE] spawn lhm_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

if(lhm_is_arrested == 2) exitWith {
	hint localize "STR_Jail_Suicide";
	lhm_is_arrested = 0;
	[player] spawn lhm_fnc_jailCombatlog;
	[] call SOCK_fnc_updateRequest;
};

if(LHM_disease > 1) then {
	[] call LHM_fsm_fnc_disease;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "lhm_copRecieve") then {
	[[player,lhm_copRecieve,true],"lhm_fnc_wantedBounty",false,false] call lhm_fnc_mp;
	lhm_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(lhm_removeWanted) then {
	[[getPlayerUID player],"lhm_fnc_wantedRemove",false,false] call lhm_fnc_mp;
};

[] call SOCK_fnc_updateRequest;
//[] call lhm_fnc_hudUpdate; //Request update of hud.

[] spawn {
waitUntil {isNull (findDisplay 38500) || isNull (findDisplay 7300) && spawningCam}; // wait for spawn and death screen
	if(isNull hud_lhmHealth || isNull  hud_lhmWeight || isNull hud_lhmStamina || IsNull hud_lhmRun || isNull hud_lhmAlcohol  || isNull hud_lhmBuffs) then {
		diag_log "::lhm Client:: reinitializing Survival Functions...";
		[] execVM "core\init_survival.sqf";
		[] call lhm_fnc_hudSetup;
	};

};