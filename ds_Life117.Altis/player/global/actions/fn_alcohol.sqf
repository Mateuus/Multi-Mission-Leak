/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Script for alcohol effects on players
*/

private ["_fadeInTime","_fadeOutTime","_faded","_endTime","_player","_sound","_soundLoop","_counter","_exit","_action"];

_action = false;
_action = [
		"You're about to drink alcohol, dying while drunk is not a comp-able glitch",
		"Get Pissed",
		"Yes",
		"Ok"
	] call BIS_fnc_guiMessage;

if(!alive player)exitwith{};
if(isNil{DS_drunk})then{DS_drunk = 1;}else{DS_drunk = DS_drunk + 1;};

if((DS_infoArray select 15) > 35)then
	{
	DS_maxWeight = 300;
	}
	else
	{
	DS_maxWeight = 120;
	};

_exit = false;
_fadeInTime = 0;
_fadeOutTime = 0;
_faded = false;
_endTime = time + 120;
_soundLoop = 0;
_sound = round random 4;


if(_sound == 0) then {_sound = 4;};
_sound = format ["drunk%1",_sound];
/*
if((life_drunk > 2)&&((player_questLog select 0) == 4))then
				{
				[0,0,0] spawn life_fnc_questCompleted;
				};

if(life_drunk > 6) then {player setDamage 0.99;life_drunk = 1;};
*/
if(vehicle player == player) then {_player = (vehicle player);}else{_player = (driver (vehicle player));};

{
	if(_x distance player < 100)then
		{
		[[_player,_sound],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;

if(DS_thirst > 15) then {DS_thirst = DS_thirst - (round random 10);};

[] call DS_fnc_updateHud;

while{time < _endTime}do
	{
	
	_player doFire player;
	/*
	if (vehicle player == player) then
		{
		_v1 = velocity player select 0;
		_v2 = velocity player select 1;
		_v3 = velocity player select 2;
		_v1add = (random 3 - random 3); _v2add = (random 2 - random 2);
		player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
		};
	*/	
		
		if(time > _fadeInTime) then 
			{
			titleCut ["","WHITE OUT",0];
			_fadeOutTime = time + 1;
			_fadeInTime = time + 5;
			_faded = false;
			};
			
		if((time > _fadeOutTime)&&(!_faded)) then
			{
			titleCut ["","WHITE IN",0];
			_faded = true;
			};
			
		if(!alive player) exitwith {DS_drunk = 0;};
			
			sleep 1;
			_soundLoop = _soundLoop + 1;
		
		if(DS_drunk == 1)then
			{
			if((_soundLoop%30) == 0) then 
				{
				_sound = round random 3;
				if(_sound == 0) then {_sound = 4;};
				_sound = format ["drunk%1",_sound];
			
				{
					if(_x distance player < 100)then
						{
						[[_player,_sound],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
						};
				}forEach playableUnits;
				
				sleep 5;
				if((vehicle player) == player)then
					{
					[[player,"AidlPknlMstpSnonWnonDnon_AI"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
					};
				
				};
			};
		if(DS_drunk == 0) exitwith {};
		
	};
	
if(DS_drunk == 0) exitwith {_exit = true;};
if(!alive player) exitwith {_exit = true;};

if(_exit) exitwith
	{
	private["_bp","_load","_cfg"];

		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		DS_maxWeight = 24 + _load;
		if(playerside == west)then
			{
			if(DS_copLevel == 7)then{DS_maxWeight = DS_maxWeight + 20};
			};
		if(isNil{_bp}) then 
		{
			DS_maxWeight = 24;
		};
	life_drunk = 0;
	};
	
_counter = 0;

while {true} do
		{
		if(DS_drunk == 0) exitwith {};
		if(!alive player) exitwith {};
		if(_counter > 40) exitwith {};
		sleep 30;
		_counter = _counter + 1;
		};
		
	private["_bp","_load","_cfg"];

		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		DS_maxWeight = 24 + _load;
		//waitUntil {backpack player != _bp};
		if(isNil{_bp}) then 
		{
			DS_maxWeight = 24;
		};
DS_drunk = 0;		
