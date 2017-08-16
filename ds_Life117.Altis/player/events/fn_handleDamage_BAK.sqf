/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Handles incoming player damage
*/
private["_player","_damage","_shooter","_ammo","_part","_curWep","_copLevel","_vehSpeed","_stungun","_stunAmmo","_stunGuns","_stunVeh"];
_player = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_shooter = _this select 3;
_ammo = _this select 4;
if(!alive _player)exitwith{false};
_vehSPeed = speed _player;
_stunAmmo = ["B_9x21_Ball","B_556x45_dual","B_556x45_Ball_Tracer_Yellow","B_65x39_Caseless","B_127x99_Ball_Tracer_Yellow","B_127x99_Ball_Tracer_Red"];
_stunGuns = ["hgun_P07_snds_F","arifle_SDAR_F","arifle_TRG21_ARCO_pointer_F","arifle_MXC_Holo_pointer_snds_F"];
_stunVeh = ["LMG_M200","HMG_M2","HMG_01"];
_noArmour = ["R_TBG32V_F","R_PG32V_F","B_127x108_APDS","B_127x108_Ball","B_408_Ball","B_93x64_Ball","B_127x54_Ball","B_338_NM_Ball","B_338_Ball","mini_Grenade"];
if((_part == "head")&&(_damage > 2))then
	{
	DS_headShot = true;
	};
if((isNull _shooter)&&(DS_skyDiving))exitWith{false};

//systemchat format ["DEBUG INFO || Shooter = %1 || Ammo = %2 || player = %3 || Damage = %4",_shooter,_ammo,_player,_damage];
if(!isNull _shooter)then 
	{
	if(_shooter != _player)then 
		{
		_curWep = currentWeapon _shooter;
		if((_ammo in _stunAmmo)&&(_curWep in _stunGuns)||(_curWep in _stunVeh))then
			{
			if((side _shooter != civilian))then 
				{
				//systemchat "A cop has shot me, his ammo is Stun Ammo, and his weapon is a stunGun";
				private["_range","_inVeh"];
				if(_curWep in _stunVeh)then
					{
					_range = 1400;
					}
					else
					{
					if(_curWep in ["arifle_TRG21_ARCO_pointer_F","arifle_MXC_Holo_pointer_snds_F"])then
						{
						_range = 250;
						}
						else
						{
						_range = if(_ammo == "B_556x45_dual") then {150} else {80};
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
							if((_vehSpeed < 5)&&((getPos player select 2) < 10))then
								{
								player action ["getOut",vehicle player];
								};
							} 
							else 
							{
							if(_curWep in ["hgun_P07_snds_F","arifle_SDAR_F"])then
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
									//systemchat "I should now be running the tazed script";
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
									//systemchat "I should now be running the stunned script";
									[_player,_shooter,false] spawn DS_fnc_stunned;
									};
								};
							};
						};
					};
				};
			};
		
		if(!(miscInfoArray select 8))then
			{
			if(_ammo in _noArmour)then{DS_armour = 0};
			};
		
		if((DS_armour > 0)&&(playerside == west))then
			{
			if((_damage > 3)&&((_part == "body")||(_part == "head")))then
				{
				_damage = true;
				systemchat "Body Armour Destroyed";
				}
				else
				{
				if(_part == "body")then
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
[] call DS_fnc_updateHud;
//systemchat format ["Returning Damage as (%1)",_damage];
if(player distance (getMarkerPos "civ_spawn_1") < 700)exitwith{false};

_damage;