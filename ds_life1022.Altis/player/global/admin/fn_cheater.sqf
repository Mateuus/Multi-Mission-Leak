/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Simple script kiddie detector, will be worked on
*/

private ["_cheat","_value1","_value2","_targets"];

if((getPlayerUID player) in DS_adminList4)exitWith{};

sleep 300;

_cheat = "";
_value1 = DS_coin;
_value2 = DS_atmCoin;

while{true}do {
	DS_soldVehicle = 0;

	if((count DS_realEstateArray) < 30)then {
		DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		if(isNil "DS_atmCoin")then {
			DS_atmCoin = 100000;
		};
		_cheat = "Broken array auto fixed";
		[] spawn DS_fnc_compileData;
	};

	if(DS_coin > (_value1 + 1000000))then {
		_cheat = format ["Money increased by $%1 in the past 60 seconds",[(DS_coin - _value1)] call DS_fnc_numberText];
	};

	if(DS_atmCoin > (_value2 + 1000000))then {
		_cheat = format ["Bank Money increased by $%1 in the past 60 seconds",[(DS_atmCoin - _value2)] call DS_fnc_numberText];
	};

	if(!isNull (uiNamespace getVariable "RscDisplayDebugPublic"))then {
		if((getPlayerUID player) != "76561198038366032")then {
			_cheat = "Has debug menu open";
			DSL_Haxor = true;
			[] spawn DS_fnc_compileData;
		};
	};

	if((life_cash > 0)||(life_atmCash > 0))then {
		_cheat = "Has attempted to spawn in money";
		DSL_Haxor = true;
		[] spawn DS_fnc_compileData;
	};

	if((isEngineOn (vehicle player))&&((vehicle player) isKindOf "Tank")&&((typeOf (vehicle player) != "I_APC_Wheeled_03_cannon_F")))then {
		_cheat = "Driving in a tank";
		DSL_Haxor = true;
		[] spawn DS_fnc_compileData;
		sleep 10;
		["Driving a hacked in vehicle"] spawn DS_fnc_tempBanPlayer;
	};

	if(DS_soldVehicle > 10)then {
		_cheat = "Sold more than 10 vehicles in the past 60 seconds (Possibly spam selling)";
		DSL_Haxor = true;
	};

	if(DSL_Haxor)then {
		if(_cheat == "")then{_cheat = "Unknown cheat - Still perm ban"};
		[(getPlayerUID player),"1",_cheat,"19"] remoteExec ["HUNT_fnc_adminNotes",2];
	};

	if(_cheat != "")then {
		_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
		if(!(_targets isEqualTo []))then{[(name player),_cheat] remoteExecCall ["DS_fnc_DarkSide_ShowAllAdmins",_targets];};
		_cheat = "";
	};

	_value1 = DS_coin;
	_value2 = DS_atmCoin;

	sleep 60;
};