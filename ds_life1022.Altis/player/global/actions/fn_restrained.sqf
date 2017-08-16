/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Runs when the player is restrained
*/

private ["_playTime","_vehicle","_policeGroup"];

params [
	["_type",0,[0]],
	["_restrainer",objNull,[objNull]]
];

if(isNull _restrainer)exitWith{};

player setVariable ["restrained",true,true];
player setVariable ["restrainer",_restrainer,true];
player setVariable ["surrender",false,true];

_playTime = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
_playTime = (floor(_playTime/60));
player setVariable ["playTime",_playTime,true];

if(playerSide isEqualTo west)then {
	player setVariable ["policeGroup",(group player),true];
	[player] joinSilent (createGroup west);
} else {
	[false] spawn DS_civ_gangKickPlayer;
};

switch(_type)do {
	case 0: { //Cuffed
		hint format ["You have been hand cuffed by %1",_restrainer getVariable ["name",name _restrainer]];

		"hud" cutText ["You have been hand cuffed. You are not allowed to communicate with your team members on TeamSpeak or other means of out-of-game communication until you are un-restrained","BLACK OUT",0];
		sleep 6;
		"hud" cutText ["You have been hand cuffed. You are not allowed to communicate with your team members on TeamSpeak or other means of out-of-game communication until you are un-restrained","BLACK IN",0];

		[] spawn {
			private ["_waitTime","_time"];

			_waitTime = 2;
			if(DS_superRestrained)then{_waitTime = 10;DS_superRestrained = false};
			if(DS_realMode)then{_waitTime = 1;};

			while{true}do {
				_time = time + (_waitTime*60);
				waitUntil {(time > _time)};

				if(!(player getVariable ["restrained",false]))exitWith{};
				if((!([player,45,west] call DS_fnc_nearbyPlayers))&&(!([player,45,independent] call DS_fnc_nearbyPlayers))&&(player getVariable ["restrained",false]))exitWith {
					player setVariable ["restrained",false,true];
					titleText ["You have managed to un-cuff yourself, run!","PLAIN"];
				};
			};
		};
	};

	case 1: { //Ziptied
		hint "You have been ziptied!";

		"hud" cutText ["You have been ziptied. You are not allowed to communicate with your team members on TeamSpeak or other means of out-of-game communication until you are un-restrained","BLACK OUT"];
		sleep 6;
		"hud" cutText ["You have been ziptied. You are not allowed to communicate with your team members on TeamSpeak or other means of out-of-game communication until you are un-restrained","BLACK IN",4];

		player say3D "zip";

		[_restrainer] spawn {
			private ["_restrainer","_time","_nearbyGroupMembers"];

			_restrainer = _this select 0;

			while{true}do {
				_time = time + 10;
				waitUntil {time > _time};

				if(!(player getVariable ["restrained",false]))exitWith{};
				if(!((player getVariable ["restrainer",objNull]) isEqualTo _restrainer))exitWith{};

				_nearbyGroupMembers = {(_x distance player) < 60} count (units (group _restrainer));
				if((_nearbyGroupMembers isEqualTo 0)||(!alive player))exitWith {
					player setVariable ["restrained",false,true];
					titleText ["You have managed to break out of your restraints, run!","PLAIN"];
				};
			};
		};
	};
};

while{player getVariable ["restrained",false]}do {
	if(isNull objectParent player)then{player playMove "AmovPercMstpSnonWnonDnon_Ease";};

	_vehicle = vehicle player;
	waitUntil {(animationState player != "AmovPercMstpSnonWnonDnon_Ease")||(!(player getVariable ["restrained",false]))||(!((vehicle player) isEqualTo _vehicle))};

	if(!alive player)exitWith{};

	if(!isNull objectParent player)then {
		if((driver (vehicle player)) isEqualTo player)then {
			(vehicle player) engineOn false;
			moveOut player;
		};
	};
};

if(!isNull objectParent player)then {
	_vehicle = vehicle player;
	if(((speed _vehicle) < 1)&&((getPos _vehicle) select 2) < 3)then{moveOut player;};
};

if(alive player)then {
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setAmmo [currentWeapon player,0];
};

player setVariable ["restrained",false,true];
player setVariable ["restrainer",nil,true];
player setVariable ["escorted",false,true];
player setVariable ["hostage",false,true];
detach player;

if(playerSide isEqualTo west)then {
	_policeGroup = player getVariable "policeGroup";
	if(!isNil "_policeGroup")then {
		[_policeGroup] call DS_fnc_joinGroup;
		player setVariable ["policeGroup",nil,true];
	};
} else {
	[] call DS_civ_gangRejoin;
};