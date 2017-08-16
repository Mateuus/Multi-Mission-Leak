/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Triggered when a player fires a weapon or throws a grenade
*/

private ["_ammoType","_projectile","_player","_targets"];

_player = _this select 0;
_ammoType = _this select 4;
_projectile = _this select 6;

if(_ammoType isEqualTo "GrenadeHand_stone")then {
	_projectile spawn {
		private ["_position","_targets"];

		while{!isNull _this}do {
			_position = getPosATL _this;
			sleep 0.1;
		};

		_targets = allPlayers select {(_x distance player) < 100};
		[_position] remoteExec ["DS_fnc_flash",_targets];
	};
};

if(_ammoType isEqualTo "SmokeShellGreen")then {
	_projectile spawn {
		private ["_targets"];

		sleep 3;

		_targets = allPlayers select {(_x distance player) < 100};
		[_this,15] remoteExec ["DS_fnc_tearGas",_targets];
	};
};

if(((!(playerSide isEqualTo west))&&(!(player getVariable ["security",false])) )&&((player inArea "safezone")&&(!(_ammoType in ["Sub_F_Signal_Green","Sub_F_Signal_Red"]))))then {
	deleteVehicle _projectile;

	if(DS_safezone_shooting > 2)exitWith {
		DS_safezone_shooting = 0;
		removeAllWeapons player;

		_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
		if(!(_targets isEqualTo []))then {
			[0,format ["%1 has just lost his weapons for shooting in a safezone",(name _player)]] remoteExecCall ["DS_fnc_globalMessage",_targets];
		};

		titleText ["You have just lost your weapons for shooting in a safezone","PLAIN DOWN"];
		hint "You have just lost your weapons for shooting in a safezone";
	};

	DS_safezone_shooting = DS_safezone_shooting + 1;
	hint format ["Do not shoot in a safezone! \n(Warning %1 / 3)",DS_safezone_shooting];
};

if((player inArea "safezone_1")&&(!(_ammoType in ["Sub_F_Signal_Green","Sub_F_Signal_Red"])))then {
	if(((date select 3) > 6)&&((date select 3) < 20))then {
		deleteVehicle _projectile;

		if(DS_safezone_shooting > 2)exitWith {
			DS_safezone_shooting = 0;
			removeAllWeapons player;

			_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
			if(!(_targets isEqualTo []))then {
				[0,format ["%1 has just lost his weapons for shooting in a safezone",(name _player)]] remoteExecCall ["DS_fnc_globalMessage",_targets];
			};

			titleText ["You have just lost your weapons for shooting in a safezone","PLAIN DOWN"];
			hint "You have just lost your weapons for shooting in a safezone";
		};

		DS_safezone_shooting = DS_safezone_shooting + 1;
		hint format ["Do not shoot in a safezone! \n(Warning %1 / 3)",DS_safezone_shooting];
	};
};

if((player getVariable["restrained",false])||(player getVariable["escorted",false])||(DS_jailed))then {
	deleteVehicle _projectile;
};

/*
if((DS_realMode)&&(_ammoType in ["B_408_Ball","B_127x108_Ball","R_PG32V_F","R_TBG32V_F","B_127x108_APDS","B_338_Ball","B_338_NM_Ball","B_127x54_Ball","B_93x64_Ball","B_50BW_Ball_F","R_PG7_F"]))then {
	hint "You can not use this weapon with realistic mode enabled";
	deleteVehicle _projectile;
};
*/