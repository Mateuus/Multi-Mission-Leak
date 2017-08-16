/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/

//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_worldspace = [0,0,0];
life_respawned = true;
player playMove "amovpercmstpsnonwnondnon";
closeDialog 0;
[0] spawn life_fnc_setPain;
[false] spawn life_fnc_brokenLeg;

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};

//Uh, onDeath handles this.
//if(life_removeWanted) then {
//	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
//};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

[] spawn life_fnc_sessionUpdate;

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.

	life_corpse setVariable["Revive",nil,TRUE];
	life_corpse setVariable["name",nil,TRUE];
	life_corpse setVariable["Reviving",nil,TRUE];
	deleteVehicle life_corpse;
};

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {[] call life_fnc_loadGear;};
	case civilian: {
		[] call life_fnc_civFetchGear;
	};
	case independent: {
		[] call life_fnc_medicLoadout;
	};
};

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["can_revive", nil, true];

[] call life_fnc_equipGear;
//[] call life_fnc_spawnMenu;

life_alive = true;
[] call life_fnc_sessionUpdate;
[] spawn
{
	waitUntil {isNull (findDisplay 7300)};
	[] spawn life_fnc_hudUpdate;
};