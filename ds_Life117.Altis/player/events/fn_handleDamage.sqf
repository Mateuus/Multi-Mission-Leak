/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Handles incoming player damage
*/
private["_exit","_player","_damage","_shooter","_ammo","_part","_curWep","_copLevel","_vehSpeed","_stungun","_stunAmmo","_stunGuns","_stunVeh","_stunAmmo","_lethalGuns"];
_player = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;
_ammo = _this select 4;
_stunAmmo = false;
_exit = false;
if((player getVariable ["cuffed",false])&&((player distance (getMarkerPos "hostageArea1") < 250)||(player distance (getMarkerPos "hostageArea2") < 250)||(player distance (getMarkerPos "hostageArea3") < 250)))exitwith{false};
if(!alive _player)exitwith{false};
_vehSPeed = speed _player;
if(_shooter getVariable ["stunAmmo",true])then{_stunAmmo = true;};
if((_shooter isKindOf "LandVehicle")||(_shooter isKindOf "Air")||(_shooter isKindOf "Tank"))then{_stunAmmo = false;};
if((side _shooter) == civilian)then{_stunAmmo = false;};
if((vehicle player) getVariable ["bulletProof",false])exitwith{false};
if((isNull _shooter)&&(((vehicle player) getVariable ["airBags",0]) > 0))then
	{
	_tempNum = ((vehicle player) getVariable ["airBags",0]);
	if(_part == "")then
		{
		_tempNum = _tempNum - 1;
		(vehicle player) setVariable ["airBags",_tempNum,true];
		};
	_exit = true;
	};
	
//_stunAmmo = ["B_9x21_Ball","B_556x45_dual","B_556x45_Ball_Tracer_Yellow","B_65x39_Caseless","B_127x99_Ball_Tracer_Yellow","B_127x99_Ball_Tracer_Red"];
_lethalGuns = ["launch_RPG32_F","LMG_Mk200_MRCO_F","srifle_GM6_LRPS_F","hgun_ACPC2_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"];
_stunVeh = ["LMG_M200","HMG_M2","HMG_01"];
_noArmour = ["R_TBG32V_F","R_PG32V_F","B_127x108_APDS","B_127x108_Ball","B_408_Ball","B_93x64_Ball","B_127x54_Ball","B_338_NM_Ball","B_338_Ball","mini_Grenade"];

//systemchat format ["DEBUG (HEAD SHOT) Damage: %1",_damage];
//systemchat format ["DEBUG (%2) Damage: %1",_damage,_part];
//if (alive player) exitwith {false};
//TEST THIS OUT AGAIN TOMORROW
if((_part in ["head","face_hub","HitFace","HitNeck"])&&(_damage > 1.6))then
	{
	DS_headShot = true;
	};
if(((isNull _shooter)||(_shooter == _player))&&(DS_skyDiving))exitWith{false};
if(_shooter != (vehicle _shooter))then
	{
	if(((driver (vehicle _shooter)) == _shooter)&&(_shooter != _player))exitwith{_exit = true};
	};
//systemchat format ["%1",_exit];
if(_exit)exitWith{false};
//systemchat format ["DEBUG INFO || Shooter = %1 || Ammo = %2 || player = %3 || Damage = %4 || Part = %5",_shooter,_ammo,_player,_damage,_part];
if(!isNull _shooter)then 
	{
	if(_shooter != _player)then 
		{
		
		_curWep = currentWeapon _shooter;
		if(((_stunAmmo)||(_curWep in _stunVeh))&&(!(_curWep in _lethalGuns)))then
			{
			
			if((side _shooter != civilian))then 
				{
				
				private["_range","_inVeh"];
				if(_curWep in _stunVeh)then
					{
					_range = 1400;
					}
					else
					{
					if(_curWep in ["hgun_P07_snds_F","hgun_ACPC2_F","SMG_02_ACO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"])then
						{
						_range = 60;
						}
						else
						{;
						_range = 300;
						};
					};
				_inVeh = if(vehicle player != player) then {true} else {false};
				_damage = false;
				if(_player distance _shooter < _range)then 
					{
					if((!DS_tazed)&&(!(_player getVariable["cuffed",false])))then
						{
						if(_inVeh)then
							{
							if((_vehSpeed < 5)&&(((vehicle player) isKindOf "Car")||((vehicle player) isKindOf "Ship")))then
								{
								player action ["getOut",vehicle player];
								};
							if(((vehicle player) isKindOf "Air")&&(isTouchingGround (vehicle player)))then
								{
								player action ["getOut",vehicle player];
								};
							} 
							else 
							{
							if(_curWep in ["hgun_P07_snds_F","hgun_ACPC2_F","SMG_02_ACO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F"])then
								{
								if((DS_armour > 0)&&(playerside != west))then
									{
									if(_part == "body")then
										{
										DS_armour = DS_armour - 3;
										hint format ["Body Armour: %1 percent Effective",(DS_armour*5)];
										}
										else
										{
										_damage = false;
										};
									}
									else
									{
									[_player,_shooter,false] spawn DS_fnc_tazed;
									};
								}
								else
								{
								if((DS_armour > 0)&&(playerside != west))then
									{
									if(_part == "body")then
										{
										DS_armour = DS_armour - 5;
										hint format ["Body Armour: %1 percent Effective",(DS_armour*5)];
										}
										else
										{
										_damage = false;
										};
									}
									else
									{
									[_player,_shooter,false] spawn DS_fnc_stunned;
									};
								};
							};
						};
					};
				};
			};
			
		_injure = (_shooter getVariable ["injure",false]);
		if((_injure)&&(_part != "body"))then
			{
			_damage = false;
			};
		if((_injure)&&(_part == "body"))then
			{
			_damage = false;
			_flare = "F_20mm_Red" createVehicle (getPosATL player);
			[] spawn {sleep 1;player setDamage 0.9};
			};
		
		if(!(miscInfoArray select 8))then
			{
			if((_ammo in _noArmour)&&(!(_stunAmmo)))exitwith{DS_armour = 0};
			};
		
		if((!(_stunAmmo))&&(DS_armour > 0)&&((playerside == west)||(player getVariable ["security",false])))then
			{
			if(!DS_headShot)then
				{
				if((_part == "body")||((_player) != (vehicle _player)))then
					{
					DS_armour = DS_armour - 5;
					hint format ["Body Armour: %1 percent Effective",(DS_armour*10)];
					_damage = false;
					}
					else
					{
					_damage = false;
					};
				};
			};	
		};
	};
//[] spawn DS_fnc_updateHud;
//systemchat format ["Returning Damage as (%1)",_damage];
if(player distance (getMarkerPos "civ_spawn_1") < 800)exitwith{false};
if((((date select 3) > 6)&&((date select 3) < 20))&&(player distance (getMarkerPos "auctionHouse") < 500))exitwith{false};
[] call DS_fnc_updateHud;

if((player getVariable ["medic",false])&&(_part == "body"))then
	{
	if(!isNull _shooter)then 
		{
		if(_shooter != _player)then 
			{
			_curWep = currentWeapon _shooter;
			if(_curWep != "")then
				{
				player setDamage 0.9;
				DS_uselessMedic = true;
				hint "You have been wounded, you will not beable to perform any medic functions until you are treated at a hospital";
				player say3D "fail";
				[[0,format["You have seriously wounded %1, this prevents them functioning as a medic. You may now let them leave the area",(name player)]],"DS_fnc_globalMessage",_shooter,false] spawn BIS_fnc_MP;
				[[1,format["You have seriously wounded %1, this prevents them functioning as a medic. You may now let them leave the area",(name player)]],"DS_fnc_globalMessage",_shooter,false] spawn BIS_fnc_MP;
				[[2,format["You have seriously wounded %1, this prevents them functioning as a medic. You may now let them leave the area",(name player)]],"DS_fnc_globalMessage",_shooter,false] spawn BIS_fnc_MP;
				_damage = false;
				};
			};
		};
	};

_damage;