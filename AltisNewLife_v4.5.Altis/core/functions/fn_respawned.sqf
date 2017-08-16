#include <macro.h>
private["_handle"];
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
argent_liquide = 0;
life_drug = 0;
life_drink = 0;
life_pain = 0;
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";
life_corpse SVAR["Revive",nil,TRUE];
life_corpse SVAR["name",nil,TRUE];
life_corpse SVAR["Reviving",nil,TRUE];
player SVAR["Revive",nil,TRUE];
player SVAR["name",nil,TRUE];
player SVAR["Reviving",nil,TRUE];
switch(playerSide) do
{
case west: {
_handle = [] spawn life_fnc_copLoadout;
};
case civilian: {
_handle = [] spawn life_fnc_civLoadout;
};
case independent: {
_handle = [] spawn life_fnc_medicLoadout;
};
case east: {
_handle = [] spawn life_fnc_adacLoadout;
};
waitUntil {scriptDone _handle};
};

if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse SVAR["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	deleteVehicle life_corpse;
};

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};
if(!isNil "life_copRecieve") then {
[[player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
life_copRecieve = nil;
};
if(life_removeWanted) then {
[[steamid],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
};
[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate;

_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];