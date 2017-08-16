#include "..\..\script_macros.hpp"
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_65x39_Caseless"] && _curWep in ["hgun_P07_snds_F","arifle_MXC_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance"];
				_distance = if(_projectile == "B_65x39_Caseless") then {100} else {35};
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !life_isknocked && !(_unit GVAR ["restrained",false])) then {
						if (vehicle player != player) then {
							if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
								player action ["Eject",vehicle player];
								[_unit,_source] spawn life_fnc_tazed;
							};
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(side _source == west && (playerSide == west OR playerSide == independent)) then {
				_damage = false;
			};
		};
		if(_projectile in ["B_65x39_Caseless"] && _curWep in ["arifle_MX_F"]) then {
			//copied from taser source
			if((side _source == civilian && playerSide != independent) || (side _source == sideEnemy && playerSide != independent)) then {
				private["_isVehicle","_dist"];
				_dist = 100;
				if(_unit distance _source < _dist) then {
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_damage = false;
				_unit setDamage 0.5;
				if(!(_isVehicle && !life_istazed)) then {
			//Copy a knocking out function instead of using the tazing function on the server
					[player,"Rubber Bullet",true] spawn life_fnc_knockedOut;
				};	
			};
		};
			
			//Change _damage = true to false if you do not want cops to kill eachother with these. _damagaHandle is being used also so they take no damage aswell.
			if(playerSide == west && side _source == west) then {
				_damage = true;
			};
		};
	};
};


if (safezone) then {
	if (isNull _source) exitWith {_damage = 0;};
	if (_projectile == "Bo_Mk82") exitWith {};
	if (_sourceCop || _sourceIsRebel) then {
		// Player should take damage since he/she was shot by a cop, therefore, nothing is done
		
	} else {
		
		if (isPlayer _source) then {
			//if (_sourceIsRebel) exitWith {_damage;};
			
			//diag_log format["Took damage from a non rebel player, cancelling.. (%1)",str(_source)];
			_damage = 0;
} else {
			//diag_log format["Took damage from something else than a player, cancelling.."];
			// Player took damage from something else than a player, not taking damage.
			_damage = 0;
		};
		
		if (_projectile == "") exitWith {_damage = 0;};
		/*
		if (alive _source && _source getVariable ["rebel",false]) exitWith {
			_damage;
		};
		*/     
	};
};

// Flashbang
if (_projectile in ["3Rnd_UGL_FlareWhite_F"]) then 
{
	// Player was flashbanged
	_damage = 0;
	[_projectile] spawn life_fnc_handleFlashbang;
};
	
[] call life_fnc_hudUpdate;
_damage;