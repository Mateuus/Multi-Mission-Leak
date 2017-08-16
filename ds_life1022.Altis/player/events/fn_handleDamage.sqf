/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Handles incoming player damage
*/

private ["_stunAmmo","_exit","_tempNum","_lethalGuns","_stunVeh","_noArmour","_lethalAmmo","_curWep","_range","_distance","_escorter","_target"];

params ["_player","_part","_damage","_shooter","_ammo"];

_stunAmmo = true;
_exit = false;

if((player getVariable ["restrained",false])&&((player distance (getMarkerPos "hostageArea1") < 250)||(player distance (getMarkerPos "hostageArea2") < 250)||(player distance (getMarkerPos "hostageArea3") < 250)))exitWith{false};
//if((DS_headShotChecked)&&(!alive player))exitWith{false}; //if(!alive _player)exitWith{false};
if((vehicle player) getVariable ["bulletProof",false])exitWith{false};
if(((typeOf _shooter) isEqualTo "B_Heli_Light_01_armed_F")&&(!(_ammo in ["B_762x51_Minigun_Tracer_Red_splash","B_65x39_Minigun_Caseless_Red_splash"])))exitWith{false};

if((side _shooter) isEqualTo civilian)then{_stunAmmo = false;};
if(!(_shooter getVariable ["stunAmmo",true]))then{_stunAmmo = false;};
//if((_shooter isKindOf "LandVehicle")||(_shooter isKindOf "Air")||(_shooter isKindOf "Tank"))then{_stunAmmo = false;};
if((typeOf _shooter) in ["B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_G_Offroad_01_armed_F","O_T_LSV_02_armed_F","B_MRAP_01_hmg_F","I_MRAP_03_hmg_F","O_MRAP_02_hmg_F","B_T_LSV_01_armed_F","O_Heli_Attack_02_black_F","B_Heli_Transport_01_F","I_Heli_light_03_F","B_Heli_Transport_01_F","I_APC_Wheeled_03_cannon_F","B_Boat_Armed_01_minigun_F","O_Boat_Armed_01_hmg_F"])then{_stunAmmo = false;};

if((isNull _shooter)&&(((vehicle player) getVariable ["airBags",0]) > 0))then {
	_tempNum = ((vehicle player) getVariable ["airBags",0]);

	if(_part isEqualTo "")then {
		_tempNum = _tempNum - 1;
		(vehicle player) setVariable ["airBags",_tempNum,true];
	};

	_exit = true;
};

_lethalGuns = ["srifle_LRR_F","srifle_GM6_F","srifle_GM6_LRPS_F","srifle_GM6_camo_F","launch_RPG32_F","launch_RPG32_F","LMG_Mk200_MRCO_F","hgun_ACPC2_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"];
_stunVeh = ["LMG_M200"];
_noArmour = ["R_TBG32V_F","R_PG32V_F","B_127x108_APDS","B_127x108_Ball","B_408_Ball","B_93x64_Ball","B_127x54_Ball","B_338_NM_Ball","B_338_Ball","mini_Grenade","B_50BW_Ball_F"];
_lethalAmmo = ["DemoCharge_Remote_Ammo","B_50BW_Ball_F"];

/*
if((_part in ["head","face_hub","HitFace","HitHead"])&&(_damage > 1.6))then {
	DS_headShot = true;
};
*/

if(!isNull objectParent _shooter)then {
	if(((driver (vehicle _shooter)) isEqualTo _shooter)&&!((_shooter isEqualTo _player)))exitWith{_exit = true};
};

if(_exit)exitWith{false};

if(!(_ammo isEqualTo ""))then {
	if(!(_shooter isEqualTo _player))then {
		_curWep = currentWeapon _shooter;

		if(((_stunAmmo)||(_curWep in _stunVeh))&&(!(_curWep in _lethalGuns))&&(!(_ammo in _lethalAmmo)))then {
			if(((side _shooter) in [west,independent]))then {
				if(_curWep in _stunVeh)then {
					_range = 1400;
				} else {
					if(_curWep in ["hgun_P07_snds_F","hgun_ACPC2_F","SMG_02_ACO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"])then {
						_range = 60;
					} else {
						_range = 300;
					};
				};

				_damage = false;

				if(player distance _shooter < _range)then {
					if((!DS_tazed)&&(!(_player getVariable["restrained",false])))then {
						if(!isNull objectParent player)then {
							if(((speed player) < 5)&&(((vehicle player) isKindOf "Car")||((vehicle player) isKindOf "Ship")))then {
								player action ["GetOut",vehicle player];
							};

							if(((vehicle player) isKindOf "Air")&&(isTouchingGround (vehicle player)))then {
								player action ["GetOut",vehicle player];
							};
						} else {
							if((DS_armour > 0)&&(!(playerSide isEqualTo west)))then {
								if(_part isEqualTo "body")then {
									_distance = (player distance _shooter);

									switch(true)do {
										case (_distance > 200): {DS_armour = DS_armour - 1;};
										case (_distance > 150): {DS_armour = DS_armour - 2;};
										case (_distance > 100): {DS_armour = DS_armour - 3;};
										case (_distance > 50): {DS_armour = DS_armour - 4;};
										case (_distance > 10): {DS_armour = DS_armour - 5;};
										default {DS_armour = 0;};
									};

									_damage = false;

									hint format ["Body Armour: %1 Percent Effective",(round (DS_armour*10))];
								} else {
									_damage = false;
								};
							} else {
								if(_curWep in ["hgun_P07_snds_F","hgun_ACPC2_F","SMG_02_ACO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"])then {
									[_player,_shooter,false] spawn DS_fnc_tazed;
								} else {
									[_player,_shooter,true] spawn DS_fnc_tazed;
								};
							};
						};
					};
				} else {
					_damage = false;
				};
			};
		};

		if(_shooter getVariable ["injure",false])then {
			_damage = false;

			if(_part isEqualTo "body")then {
				_flare = "F_20mm_Red" createVehicle [0,0,0];
				_flare setPosATL (getPosATL player);
				[] spawn {sleep 1;player setDamage 0.9};
			};
		};

		if(!(miscInfoArray select 8))then {
			if((_ammo in _noArmour)&&(!(_stunAmmo)))then{DS_armour = 0};
		};

		if((!(_stunAmmo))&&(DS_armour > 0)&&((playerSide isEqualTo west)||(player getVariable ["security",false])))then {
			if(!DS_headShot)then {
				if((_part isEqualTo "body")||(!isNull objectParent player))then {
					if(_ammo isEqualTo "1Rnd_HE_Grenade_shell")then {
						DS_armour = DS_armour - (1+(random 2));
					} else {
						if(_ammo in ["B_762x39_Ball_Green_F","B_762x39_Ball_F","B_762x54_Ball","B_762x51_Ball"])then {
							DS_armour = DS_armour - (4+(random 5));
						} else {
							DS_armour = DS_armour - (3+(random 3));
						};
					};

					hint format ["Body Armour: %1 Percent Effective",(round (DS_armour*10))];
					_damage = false;
				} else {
					_damage = false;
				};
			};
		};
	};
};

if(player inArea "safezone")exitWith{false};
if((((date select 3) > 5)&&((date select 3) < 20))&&(player inArea "safezone_1"))exitWith{false};

if((player getVariable ["medic",false]))then {
	if(!isNull _shooter)then {
		if(!(_shooter isEqualTo _player))then {
			_damage = false;
			_curWep = currentWeapon _shooter;

			if((!(_curWep isEqualTo ""))&&(_part isEqualTo "body"))then {
				player setDamage 0.9;
				DS_uselessMedic = true;
				hint "You have been wounded. You will not be able to perform any medic functions until you are treated at a hospital";
				player say3D "fail";
				if(DS_spam < 2)then {
					DS_spam = DS_spam + 1;
					[] spawn {
						sleep 25;
						DS_spam = DS_spam - 1;
					};
					[0,format ["You have seriously wounded %1. This prevents them functioning as a medic. You may now let them leave the area",(name player)],false,1] remoteExecCall ["DS_fnc_globalMessage",_shooter];
				};
			};
		};
	};
};

//Auto unescort system
if(!(_ammo isEqualTo ""))then {
	if(_player getVariable ["escorted",false])then {
		_escorter = attachedTo _player;
		if(isNull _escorter)exitWith{};

		detach _player;
		_player setVariable ["escortCooldown",true,true];

		[_player] spawn {
			sleep 5;
			(_this select 0) setVariable ["escorted",false,true];
			sleep 10;
			(_this select 0) setVariable ["escortCooldown",false,true];
		};
	} else {
		_target = (attachedObjects _player) select 0;
		if((isNil "_target")||(isNull _target)||(!isPlayer _target))exitWith{};
		if(!(_target getVariable ["escorted",false]))exitWith{};

		detach _target;
		_target setVariable ["escortCooldown",true,true];

		[_target] spawn {
			sleep 5;
			(_this select 0) setVariable ["escorted",false,true];
			sleep 10;
			(_this select 0) setVariable ["escortCooldown",false,true];
		};
	};
};

if((_player getVariable ["escorted",false])&&((side _shooter) isEqualTo civilian))exitWith{false};

//Headshot detection
if(_damage isEqualType 0)then {
	_selections = _player getVariable ["selections",[]];
	_getHit = _player getVariable ["getHit",[]];

	if(!(_part in _selections))then {
	    _selections pushBack _part;
	    _getHit pushBack 0;
	};

	_i = _selections find _part;
	_getHit set [_i,_damage];

	_criticalHit = (_part in ["","face_hub","neck","head","pelvis","spine1","spine2","spine3","body"]);
	_fatalHit = ((_criticalHit)&&(_damage >= 1)&&!(alive _player));

	if((_fatalHit)&&(!DS_headShot))then{
		//DS_headShotChecked = true;

	    _faceDamage = [_player,"face_hub"] call DS_fnc_getPartDamage;
	    _headDamage = [_player,"head"] call DS_fnc_getPartDamage;

	    if((_faceDamage > 0.9)||(_headDamage > 0.9))then {
			DS_headShot = true;
	    };
	};
};

if(DS_armour < 0)then{DS_armour = 0};
[] call DS_fnc_updateHud;

_damage;