/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs the auto mining feature on the Tempest (Device)
*/

private ["_vehicle","_pos","_sleep","_amount","_vehMaxWeight","_bonus","_vehMaxWeight","_field","_boot","_bootItems","_vehCurWeight","_newWeight","_index","_string","_newFuel"];

_vehicle = cursorTarget;

if(!((typeOf _vehicle) isEqualTo "O_Truck_03_device_F"))exitWith{};
if(DS_doingStuff)exitWith{hint "Please wait 10 seconds before doing this"};
DS_doingStuff = true;
if(_vehicle getVariable ["autoMining",false])exitWith {
	hintSilent "Auto Miner Stopped";
	_vehicle engineOn false;
	_vehicle setVariable ["autoMining",false,true];
	sleep 5;
	DS_doingStuff = false;
};
DS_doingStuff = false;

_pos = (getPos _vehicle);
_sleep = if(DS_moral < 750)then{15}else{35};
_amount = 0;
_vehMaxWeight = [(typeOf _vehicle)] call DS_fnc_getVehWeight;

if((DS_infoArray select 13) == 25)then{[0] call DS_fnc_questCompleted};

_bonus = switch(true)do {
	case (_vehicle getVariable ["extraspace1",false]): {1.2};
	case (_vehicle getVariable ["extraspace2",false]): {1.4};
	case (_vehicle getVariable ["extraspace3",false]): {1.6};
	case (_vehicle getVariable ["extraspace4",false]): {1.8};
	case (_vehicle getVariable ["extraspace5",false]): {2};
	default {1};
};

if(_vehicle getVariable ["extraspace",false])then{_bonus = _bonus + 0.5;};
if(_vehicle getVariable ["extraspaceAdv",false])then{_bonus = _bonus + 1;};
_vehMaxWeight = (_vehMaxWeight*_bonus);

_field = switch(true)do {
	case (_vehicle distance (getMarkerPos "oil") < 50): {"oilu"};
	case (_vehicle distance (getMarkerPos "oil2") < 50): {"oilu"};
	case (_vehicle distance (getMarkerPos "diamond") < 50): {"diamondu"};
	case (_vehicle distance (getMarkerPos "copper") < 50): {"copperu"};
	case (_vehicle distance (getMarkerPos "rock") < 50): {"rocku"};
	case (_vehicle distance (getMarkerPos "salt") < 50): {"saltu"};
	case (_vehicle distance (getMarkerPos "iron") < 50): {"ironu"};
	case (_vehicle distance (getMarkerPos "sand") < 50): {"sandu"};
	case (_vehicle distance (getMarkerPos "wood") < 50): {"woodu"};
	default {_field = "";};
};

if(_field isEqualTo "")exitWith{hint "You are not close enough to any mining field";};
if((fuel _vehicle) < 0.01)exitWith{hint "There is not enough fuel in this Auto Miner for it to operate";};

_vehicle setVariable ["autoMining",true,true];
_vehicle engineOn true;

while{(_vehicle getVariable ["autoMining",false])}do {
	_boot = _vehicle getVariable ["boot",[[],0]];
	_bootItems = _boot select 0;
	_vehCurWeight = _boot select 1;

	//Run some checks
	if(!alive _vehicle)exitWith{};
	if(!(isEngineOn _vehicle))exitWith{};
	if((_vehMaxWeight - _vehCurWeight) < 4)exitWith{};
	if(_vehicle distance _pos > 10)exitWith{};
	if(fuel _vehicle < 0.01)exitWith{};

	//Handle the mining
	titleText ["Auto Miner is mining","PLAIN"];
	hintSilent "Auto Miner is mining";

	if((_vehMaxWeight - _vehCurWeight) < 100)then {
		_amount = 5 + (round (random 5));
		_sleep = 7;
	} else {
		_amount = 10 + (round (random 10));
	};

	sleep _sleep;

	if(!(_vehicle getVariable ["autoMining",false]))exitWith{};

	_boot = _vehicle getVariable ["boot",[[],0]];
	_bootItems = _boot select 0;
	_vehCurWeight = _boot select 1;

	_amount = [_field,_amount,_vehCurWeight,_vehMaxWeight] call DS_fnc_getWeightDiff;
	if(_amount isEqualTo 0)exitWith{};

	_index = -1;

	{
		if((_x select 0) isEqualTo _field)exitWith {
			_index = _forEachIndex;
		};
	} forEach _bootItems;

	if(_index isEqualTo -1)then {
		_bootItems pushBack [_field,_amount];
		_newWeight = [_field,_amount] call DS_fnc_itemWeight;
	} else {
		_value = (_bootItems select _index) select 1;
		_value = (_value + _amount);
		_bootItems set [_index,[_field,_value]];
		_newWeight = [_field,_value] call DS_fnc_itemWeight;
	};

	_vehicle setVariable ["boot",[_bootItems,_newWeight],true];

	_string = [_field] call DS_fnc_itemStringConfig;
	titleText [format ["Your Auto Miner has mined %1 %2",_amount,_string],"PLAIN"];
	hintSilent format ["Your Auto Miner has mined %1 %2",_amount,_string];

	//Update the vehicle's fuel
	if(_vehicle getVariable ["fuel",false])then {
		_newFuel = ((fuel _vehicle) - 0.02);
	} else {
		if(_vehicle getVariable ["fuelAdv",false])then {
			_newFuel = ((fuel _vehicle) - 0.005);
		} else {
			_newFuel = ((fuel _vehicle) - 0.05);
		};
	};

	if(local _vehicle)then {
		_vehicle setFuel _newFuel;
	} else {
		[_vehicle,_newFuel] remoteExecCall ["DS_fnc_setFuel",_vehicle];
	};

	//Sleep
	sleep 5;
};

if(!alive _vehicle)exitWith{};
if(!(_vehicle getVariable ["autoMining",false]))exitWith{};

_vehicle setVariable ["autoMining",false,true];

if((_amount < 1)||((_vehMaxWeight - _vehCurWeight) < 4))exitWith{hint "Your Auto Miner stopped mining because it has no more space left";_vehicle engineOn false;};
if(_vehicle distance _pos > 10)exitWith{hint "Your Auto Miner stopped mining because it was moved";_vehicle engineOn false;};
if(fuel _vehicle < 0.01)exitWith{hint "Your Auto Miner stopped mining because it ran out of fuel";};
if(!(isEngineOn _vehicle))exitWith{hint "Your Auto Miner stopped mining because it's engine was turned off";};