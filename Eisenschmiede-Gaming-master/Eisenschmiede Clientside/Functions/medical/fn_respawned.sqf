#include "..\script_macros.hpp"
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff

ES_use_atm = true;
ES_hunger = 100;
ES_thirst = 100;
ES_carryWeight = 0;
ES_cash = 0; //Make sure we don't get our ES_cash back.
ES_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

ES_corpse setVariable ["Revive",nil,TRUE];
ES_corpse setVariable ["name",nil,TRUE];
ES_corpse setVariable ["Reviving",nil,TRUE];
player setVariable ["Revive",nil,TRUE];
player setVariable ["name",nil,TRUE];
player setVariable ["Reviving",nil,TRUE];
player setVariable ["copSwitchSkin", false, true];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn ES_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn ES_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn ES_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull ES_corpse) then {
	private "_containers";
	ES_corpse setVariable ["Revive",TRUE,TRUE];
	_containers = nearestObjects[ES_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	deleteVehicle ES_corpse;
};

//Destroy our camera...
ES_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy ES_deathCamera;

//Bad boy
if(ES_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	ES_is_arrested = false;
	[player,TRUE] spawn ES_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "ES_copRecieve") then {
	[player,ES_copRecieve,true] remoteExec ["ES_fnc_wantedBounty",2];
	ES_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(ES_removeWanted) then {
	[getPlayerUID player] remoteExec ["ES_fnc_wantedRemove",2];
};

player enableStamina false;
player allowSprint true;

[] call SOCK_fnc_updateRequest;
[] call ES_fnc_hudUpdate;
if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };