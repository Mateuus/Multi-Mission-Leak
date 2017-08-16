/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	After the player clicks the respawn button, this stuff happens
*/

private ["_medics","_chance","_body","_remains","_bounty","_donator","_rankStr"];

if(DS_requestedMedic)exitWith{systemChat "You can not respawn because you have requested a Medic"};
if(player distance (getMarkerPos "civ_spawn_1") > 700)then{player allowDamage true;};

closeDialog 0;

if(DS_moral > 700)then{DS_moral = 700};
if(DS_moral < 300)then{DS_moral = 300};

player setVariable ["headShot",false,true];
player setVariable ["selections",[],true];
player setVariable ["getHit",[],true];
//DS_headShotChecked = false;

if(!(player getVariable ["mechanic",false]))then {
	[] spawn DS_fnc_setupPlayerActions;
};

//Handle rebel licenses
DSL_rebel = false;

if(DSL_rebelAdv)then {
	DSL_rebelAdv = false;
	DSL_rebel = true;
};

DS_rebelAdv_removed = false;

//Create a skeleton
_medics = {_x getVariable ["medic",false]} count allPlayers;
_chance = if(_medics > 1)then{random 100}else{random 50};

if((_chance > 30)&&(DS_deadPos distance spawnIsland > 1000)&&(!isOnRoad DS_deadPos))then {
	_remains = "Land_HumanSkeleton_F" createVehicle [0,0,0];
	_remains setPosATL DS_deadPos;
};

//Reset player variables
DS_requestedMedic = false;
DS_headShot = false;
DS_hunger = 100;
DS_thirst = 100;
DS_safezoneShooting = 0;
DS_respawned = false;

player playMove "AmovPercMstpSnonWnonDnon";

DS_deadBody setVariable ["revive",false,true];
DS_deadBody setVariable ["name",profileName,true];
DS_deadBody setVariable ["reviving",nil,true];
player setVariable ["revive",false,true];
player setVariable ["name",profileName,true];
player setVariable ["reviving",nil,true];
player setVariable ["DS_sick_infection",false,true];
if(DS_realMode)then{player setVariable ["realModeMan",true,true];};

[12] call DS_fnc_alterStats;

if(playerSide isEqualTo west)then {
	player setVariable ["policeAction","",true];

	if((DS_infoArray select 9) < 1)then {
		_donator = DS_perkLevel + 5;
		DS_infoArray set [9,_donator];
		[] spawn DS_cop_copDefault;
	};

	[] spawn DS_fnc_loadGear;

	player setVariable ["stunAmmo",true,true];
};

//If player died while jailed somehow
if(DS_jailed)then {
	[player,"30","Dying while in jail",true] spawn DS_fnc_jail;
};

//Remove bounties
if(DS_removeWanted)then {
	[] spawn DS_fnc_removeCharges;
	DS_removeWanted = false;
};

//Update HUD and texture uniform
[] call DS_fnc_updateHud;
[] call DS_fnc_copUniform;

//Cleanup weapons around the body but give people time to loot
[] spawn {
	sleep 30;

	if(!isNull DS_deadBody) then {
		DS_deadBody setVariable ["revive",false,true];

		if(!(DS_primaryWepItems isEqualTo []))then {
		    _primaryWep = DS_primaryWepItems select 0;
			_groundWeapons = nearestObjects [DS_deadBody,["WeaponHolderSimulated"],5];
			_foundWeapon = objNull;
			_exit = false;

			{
				_weaponType = ((getWeaponCargo _x) select 0) select 0;

				if(!isNil "_weaponType")then {
					if(_weaponType isEqualTo _primaryWep)exitWith {
						_foundWeapon = _x;
						_exit = true;
					};
				};

				if(_exit)exitWith{};
			} forEach _groundWeapons;

			if(!isNull _foundWeapon)then{deleteVehicle _foundWeapon;};

			DS_primaryWepItems = [];
		};

		if(!(DS_secondaryWepItems isEqualTo []))then {
		    _secondaryWep = DS_secondaryWepItems select 0;
			_groundWeapons = nearestObjects [DS_deadBody,["WeaponHolderSimulated"],5];
			_foundWeapon = objNull;
			_exit = false;

			{
				_weaponType = ((getWeaponCargo _x) select 0) select 0;

				if(!isNil "_weaponType")then {
					if(_weaponType isEqualTo _secondaryWep)exitWith {
						_foundWeapon = _x;
						_exit = true;
					};
				};

				if(_exit)exitWith{};
			} forEach _groundWeapons;

			if(!isNull _foundWeapon)then{deleteVehicle _foundWeapon;};

			DS_secondaryWepItems = [];
		};

		hideBody DS_deadBody;
	};
};

[] call DS_fnc_menuSpawnScreen;

//Setup chat
if(playerSide isEqualTo west)then {
	[west,player] remoteExec ["HUNT_fnc_setupChat",2];
	7 enableChannel [true,false];
} else {
	if(playerSide isEqualTo civilian)then {
		6 enableChannel [true,false];
		8 enableChannel [true,false];
		9 enableChannel [true,false];
		if(DS_adminLevel > 0)then {
			[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
		} else {
			if(((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2)) > 1200)then {
				[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
			} else {
				[civilian,player,false,false,true] remoteExec ["HUNT_fnc_setupChat",2];
			};
		};
	} else {
		if(player getVariable ["security",false])then {
			[west,player] remoteExec ["HUNT_fnc_setupChat",2];
		};
		7 enableChannel [true,false];
		6 enableChannel [true,false];
		[civilian,player] remoteExec ["HUNT_fnc_setupChat",2];
	}
};

[] call DS_fnc_stamina;
[true] call DS_fnc_earPlugs;
[] call DS_fnc_updateHud;
[] call DS_civ_gangCheck;

if(!((headgear player) isEqualTo ""))then{removeHeadgear player;};
if(!((goggles player) isEqualTo ""))then{removeGoggles player;};
if(playerSide isEqualTo civilian)then {
	_uniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour","U_C_Poor_1"];
	_randUniform = selectRandom _uniforms;
	player addUniform _randUniform;
};

if(DS_donorLevel == 0)then {
	[] spawn DS_fnc_randomizeBody;
};

if(playerSide isEqualTo west)then {
	[] spawn DS_cop_addToSquad;
};

7 enableChannel [true,false];
8 enableChannel [true,false];
9 enableChannel [true,false];