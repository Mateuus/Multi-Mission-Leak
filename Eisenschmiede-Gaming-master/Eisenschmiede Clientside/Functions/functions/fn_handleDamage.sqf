/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_currdamage = damage player;


//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_Ball"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_Ball") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!ES_istazed && !(_unit getVariable ["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn ES_fnc_tazed;
						} else {
							[_unit,_source] spawn ES_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

if(_unit distance (getMarkerPos "Safe_Kav") < 200 ) then {_damage = damage player;};
if(_unit distance (getMarkerPos "Safe_Reb") < 200 ) then {_damage = damage player;}; 
if(_unit distance (getMarkerPos "Safe_Reb_1") < 200 ) then {_damage = damage player;}; 
if(_unit distance (getMarkerPos "Safe_Schwarzmarkt") < 200 ) then {_damage = damage player;}; 
if(_unit distance (getMarkerPos "Event_Admin") < 250 ) then {_damage = damage player;}; 


// Flashbang
if (_projectile in ["mini_Grenade"]) then {	_damage = 0; [_projectile] spawn ES_fnc_flashbang;};

[] call ES_fnc_hudUpdate;
_damage;