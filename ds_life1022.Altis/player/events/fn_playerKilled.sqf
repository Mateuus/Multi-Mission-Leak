/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Runs when a player is killed
*/

private ["_cop","_bounty","_handle"];

params [
	["_player",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];

_cop = false;
DS_deadbody = _player;
if(playerSide isEqualTo west)then{
	_cop = true;
	player removeMagazines "DemoCharge_Remote_Mag";
};

//Start a NLR timer for the player
[] spawn DS_fnc_NLR;

//Save position for NLR timer and kill distance
DS_deadPos = (getPos player);

//Cancel headshot status of player with high morality
if((DS_headShot)&&(DS_moral > 900))then{DS_headShot = false;};

//Display kill messages to the server
if(!(_killer isEqualTo _player))then {
	[_killer] spawn DS_fnc_killMessages;
};

if((player getVariable ["policeSquad",""]) == "Sharp Shooter")then {
	if(DS_sharpShooter != 0)then {
		DS_sharpShooter = 0;
		_items = uniformItems player;
		player forceAddUniform DS_sharpShooterUniform;

		{
			player addItem _x;
		} forEach _items;

		[] call DS_fnc_stamina;
		[] call DS_fnc_copUniform;
	};
};

DS_primaryWepItems = [];
DS_secondaryWepItems = [];

if(!((primaryWeapon player) isEqualTo ""))then {
    DS_primaryWepItems pushBack (primaryWeapon player);
    DS_primaryWepItems pushBack (primaryWeaponItems player);
    DS_primaryWepItems pushBack (primaryWeaponMagazine player);
};

if(!((secondaryWeapon player) isEqualTo ""))then {
    DS_secondaryWepItems pushBack (secondaryWeapon player);
    DS_secondaryWepItems pushBack (secondaryWeaponItems player);
    DS_secondaryWepItems pushBack (secondaryWeaponMagazine player);
};

if(isNull _killer)then {
	DS_killer = "";
};

if(!isNull _killer && {!(_killer isEqualTo _player)})then {
	if(!(player getVariable ["security",false]))then {
		DS_removeWanted = true;
	};

	DS_killer = (name _killer);
	[_player,DS_headShot,DS_deadPos,_cop] remoteExecCall ["DS_fnc_killInfo",_killer];

	if((side _killer) isEqualTo west)then {
		DS_realEstateArray set [14,0];
		_bounty = (DS_wanted_stats select 0);
		if(_bounty > 0)then {
			[1,player,_bounty] remoteExec ["DS_fnc_getBounty",_killer];
		};
	};
};

//Punish somebody if they kill a person in custody (Civilian or police custody)
if(((player getVariable["restrained",false])||(player getVariable["escorted",false]))&&((side _killer) isEqualTo civilian)&&(!isNull _killer))then {
	if(!(player isEqualTo _killer))then {
		[1,player] remoteExec ["DS_fnc_punishKiller",_killer];
	};
};

//Set unit variables
_player setVariable ["revive",true,true];
_player setVariable ["name",profileName,true];
_player setVariable ["restrained",false,true];
_player setVariable ["escorted",false,true];
_player setVariable ["surrender",false,true];

//Set to revivable and inform player if they were head shotted
if(DS_headShot)then {
	if(!DS_realMode)then {
		_player setVariable ["headShot",true,true];
		systemChat "HEAD SHOT";
	};
};

//Punish killers morality
if((!(_killer isEqualTo _player))&&(!isNull _killer))then {
	if(DS_moral > 200)then {
		[2,(name _killer)] remoteExec ["DS_fnc_punishKiller",_killer];
	};
};

//Set killer wanted
if((!isNull _killer)&&{!(_killer isEqualTo _player)}&&{!((side _killer) isEqualTo west)}&&{alive _killer})then {
	["522"] remoteExecCall ["DS_fnc_addCharge",_killer];
};

//If player is killed by a cop
if(((side _killer) isEqualTo west)&&(!(playerSide isEqualTo west)))then {
	DS_copRecieve = _killer;
	[3] remoteExec ["DS_fnc_alterStats",_killer];
};

//Drop your items and money
if(playerSide isEqualTo civilian)then {
	_handle = [_player] spawn DS_civ_dropItems;
	DS_currentWeight = 0;
	waitUntil {scriptDone _handle};

	/*
	if(DSL_rebelAdv) then {
		DSL_rebel = true;
		DSL_rebelAdv = false;
		DS_rebelAdv_removed = true;
	} else {
		DSL_rebel = false;
		DS_rebelAdv_removed = false;
	};
	DSL_rebelVeh = false;
	*/
};

if(playerSide isEqualTo west)then {
	_timesDied = DS_infoArray select 9;
	_timesDied = _timesDied - 1;
	DS_infoArray set [9,_timesDied];

	if((DS_infoArray select 9) < 1)then {
		_player setVariable ["revive",false,true];
		[] call DS_fnc_removeGear;
	};

	[] call DS_fnc_saveGear;
};

//Lose driving licenses if driving/flying and die
if(((driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "LandVehicle")&&(playerSide isEqualTo civilian))&&((DSL_car)||(DSL_truck)))then {
	systemChat "Because you died while driving you have lost your driving licenses";
	DSL_car = false;
	DSL_truck = false;
};

if(((driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "Air")&&((side player) isEqualTo civilian))&&(DSL_air))then {
	systemChat "Because you died while driving an air vehicle, you have lost your pilots licenses";
	DSL_air = false;
};

if(((driver (vehicle player) isEqualTo player)&&((vehicle player) isKindOf "Ship")&&((side player) isEqualTo civilian))&&(DSL_boat))then {
	systemChat "Because you died while driving a sea vehicle, you have lost your boating license";
	DSL_boat = false;
};

createDialog "deathMenu";

_player spawn {
	private ["_maxTime","_respawn","_timer"];

	disableSerialization;

	_respawn = ((findDisplay 666670) displayCtrl 2400);
	_timer = ((findDisplay 666670) displayCtrl 2403);
	_moral = (round(55-(DS_moral/20)));
	_maxTime = time + 11 + (_moral);
	if(DS_realMode)then{_maxTime = 11};

	_respawn ctrlEnable false;
	waitUntil {
		_timer ctrlSetText format ["Respawn Available in: %1 (WARNING - Do Not Disconnect)",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round(_maxTime - time) <= 0 || isNull _this
	};
	_respawn ctrlEnable true;
	_timer ctrlSetText "You can now respawn";
};

[] spawn DS_fnc_deathCam;
DS_armour = 0;
player setVariable ["mechanic",false,true];
player setVariable ["medic",false,true];

if(playerSide isEqualTo civilian)then {
	[] spawn DS_fnc_compileData;
};

DS_punishMe = false;