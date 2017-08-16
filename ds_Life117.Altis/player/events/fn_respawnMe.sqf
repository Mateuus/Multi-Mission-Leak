/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	After the player clicks the respawn button, this stuff happens
*/
private ["_chance","_sp","_body","_remains","_time","_reason","_bounty","_nearybyStuff","_donator","_rankStr"];
if(DS_requestedMedic)exitwith{systemchat "You can not respawn because you have requested a Medic"};
if(player distance (getMarkerPos "civ_spawn_1") > 700)then
	{
	player allowDamage true;
	};
closeDialog 0;
if(DS_moral > 700)then{DS_moral = 700};
if(DS_moral < 300)then{DS_moral = 300};
player setVariable ["headShot",false,false];
if(!(player getVariable ["mechanic",false]))then
	{
	[] spawn DS_fnc_setupPlayerActions;
	};
DS_rebelAdv_removed = false;
//player setPos (getMarkerPos "vehSpawn1");

if((count playableUnits) < 40)then{_chance = random 100}else{_chance = random 50};
if((_chance > 30)&&(DS_deadPos distance spawnIsland > 1000)&&(!isOnRoad (DS_deadPos)))then
	{
	_sp = DS_deadPos;
	_body = "Land_HumanSkeleton_F";
	_remains = _body createVehicle _sp;
	_remains setPos _sp;
	if(isOnRoad _remains)then
		{
		deleteVehicle _remains;
		};
	};

//Reset player Variables
DS_requestedMedic = false;
DS_headShot = false;
DS_hunger = 100;
DS_thirst = 100;
DS_safezoneShooting = 0;

DS_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

DS_deadBody setVariable["Revive",false,TRUE];
DS_deadBody setVariable["name",profileName,true];
DS_deadBody setVariable["Reviving",nil,TRUE];
player setVariable["Revive",false,TRUE];
player setVariable["name",profileName,true];
player setVariable["Reviving",nil,TRUE];
player setVariable["DS_sick_infection",false,TRUE];
[12] call DS_fnc_alterStats;
if(playerside == west)then
	{
	player setVariable ["policeAction","",true];
	if((DS_infoArray select 9) < 1)then
		{
		_donator = DS_perkLevel + 5;
		DS_infoArray set [9,_donator];
		[] spawn DS_cop_copDefault;
		};
	};
//Load players gear
switch(playerSide) do
	{
	case west: 
		{
		[] spawn DS_cop_loadPoliceGear;
		player setVariable ["stunAmmo",true,true];	
		};
	};
//If player died while jailed somehow
if(DS_jailed)then
	{
	_time = "30";
	_reason = "Dying while in jail";
	[player,_time,_reason,true] spawn DS_fnc_jail;
	};
//Remove bounties
if(DS_removeWanted)then
	{
	[] spawn DS_fnc_removeCharges;
	DS_removeWanted = false;
	};
//Sync Data here
[] call DS_fnc_updateHud;
[] call DS_fnc_copuniform;

//Cleanup crap around the body but give ppl time to loot
[] spawn
	{
	sleep 30;
	if(!isNull DS_deadBody) then {
		private["_nearybyStuff"];
		DS_deadBody setVariable["Revive",false,TRUE];
		_nearybyStuff = nearestObjects[DS_deadBody,["WeaponHolderSimulated"],5];
		{deleteVehicle _x;} foreach _nearybyStuff;
		hideBody DS_deadBody;
		};
	};
[] call DS_fnc_menuSpawnScreen;

if((str(player) in ["cop_4","cop_1","cop_3","cop_5"]))then
	{
	DS_pubCop = true;
	player setVariable["pubCop",true,true];
	}
	else
	{
	if(playerside == west)then
		{
		player setVariable["cop",true,true];
		};
	};

if(playerside == west)then
	{
	[[west,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
	}
	else
	{
	[[civilian,player],"HUNT_fnc_setupChat",false,false] spawn DS_fnc_MP;
	};
	
if(playerside == west)then
	{
	player setVariable["rank",(DS_coplevel),true];	
	if(DS_copLevel == 0)then{player setVariable ["rankStr","Public Officer",true];};
	if(DS_copLevel == 1)then{player setVariable ["rankStr","Cadet",true];};
	if(DS_copLevel == 2)then{player setVariable ["rankStr","Patrol Officer",true];};
	if(DS_copLevel == 3)then{player setVariable ["rankStr","Sergeant",true];};
	if(DS_copLevel == 4)then{player setVariable ["rankStr","Senior Sergeant",true];};
	if(DS_copLevel == 5)then{player setVariable ["rankStr","Lieutenant",true];};
	if(DS_copLevel == 6)then{player setVariable ["rankStr","Super Intendant",true];};
	if(DS_copLevel == 7)then{player setVariable ["rankStr","Deputy Chief",true];};
	if((getPlayerUID player) in ["76561197992718808"])then{player setVariable ["rankStr","Chief Of Police",true];};
	};
[] call DS_fnc_stamina;	
[] spawn DS_fnc_earPlugs;
[]call DS_fnc_updateHud;

{
	if(((group player) == (_x select 0))||(isNull (group player)))then
		{
		if(!(getPlayerUID player) in _x)then
			{
			[player] joinSilent (createGroup civilian);
			(group player) setVariable ["gangName","",true];
			};
		};
}forEach DS_gangList;