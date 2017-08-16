/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Script for alcohol effects on players (Updated 19-2-17)
*/

private ["_player","_action","_item","_max","_endTime","_endOfAnimations","_bp","_load","_cfg","_targets"];

_item = _this select 0;

//Tell them they can't be comped
_action = [
	"You're about to drink alcohol, dying while drunk is not a comp-able glitch",
	"Get Pissed",
	"Yes",
	"Cancel"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

//Remove the alcohol from them
[_item,false,1] call DS_fnc_handleInventory;

//Set to drunk
if(isNil "DS_drunk")then{DS_drunk = 1;};

//Give extra storage space
if((DS_infoArray select 15) > 40)then
	{
	DS_maxWeight = 300;
	}
	else
	{
	DS_maxWeight = 120;
	};

//Give extra time for higher quest
if((DS_infoArray select 15) > 20)then {
	_max = 1200;
};

//_max = seconds to be drunk for
_max = 600;
if(DS_realMode)then {
	_max = (_max*2);
};

//Time that this thread should end
_endTime = time + _max;

//How long animations play for
_endOfAnimations = time + 60;

_playAnimation =
	{
		private["_sound","_player"];
		if(isNull objectParent player) then {_player = (vehicle player);}else{_player = (driver (vehicle player));};

		_sound = round random 4;
		if(_sound == 0)then {
			_sound = 4;
		};
		_sound = format ["drunk%1",_sound];
		if((random 6) > 3)then {
			_targets = allPlayers select {(_x distance player) < 100};
			[_player,_sound] remoteExecCall ["DS_fnc_playSounds",_targets];
		} else {
			player say3D _sound;
		};

		_sound = round random 4;

		if(_sound < 2)then {
			if(isNull objectParent player)then {
				_targets = allPlayers select {(_x distance player) < 100};
				[player,"AidlPknlMstpSnonWnonDnon_AI"] remoteExecCall ["DS_fnc_animSync",_targets];
			};
		};

		//Screen Fade (White)
		if((_sound > 1)&&(_sound != 4))then {
			if(isNull objectParent player)then {
				titleCut ["","WHITE OUT",0];
				sleep 2;
				titleCut ["","WHITE IN",0];
			};
		};

		//Screen Fade (Black)
		if(_sound == 4)then {
			if(isNull objectParent player)then {
				titleCut ["","BLACK OUT",0];
				sleep 2;
				titleCut ["","BLACK IN",0];
			};
		};
	};

while{true}do {
	if(time < _endOfAnimations)then {
		[] spawn _playAnimation;
	};
	_sleepTime = (random 10) + 10;
	sleep _sleepTime;
	DS_drunk = 1;
	if((time > (_endTime - 90))&&(time < (_endTime - 70)))then {
		hint "You are starting to sober up, might want to take another drink";
		titleText ["You are starting to sober up, might want to take another drink","plain down"];
	};
	if(time > _endTime)exitwith{};
};

//Set drunk to zero
DS_drunk = 0;
sleep 30;

//If drunk is still zero after 30 seconds then no other loop is running so remove extra storage space etc
if(DS_drunk == 0)then {
	titleCut ["","WHITE OUT",0];
	sleep 0.22;
	titleCut ["","WHITE IN",0];
	hint "You are no longer drunk";
	_bp = backpack player;
	_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
	_load = round(_cfg / 8);
	DS_maxWeight = 24 + _load;
	if(isNil{_bp}) then
		{
		DS_maxWeight = 24;
		};
};