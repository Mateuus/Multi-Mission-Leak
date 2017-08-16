#include <macro.h>
private ["_item","_mode","_animal","_pos","_standardPos","_theAnimal","_costumes","_dir","_vItem"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,0,[0]] call BIS_fnc_param;

_standardPos = [8575.48,25206.3,0.00161743];



if(_item == "" OR _mode == 2) exitWith {
	_standardPos = [8575.48,25206.3,0.00161743];
	_dir = getdir player;
	
	_vItem = switch (true) do {
		case (costumeTheAnimal isKindOf "Rabbit_F"): {"costume_rabbit"};
		case (costumeTheAnimal isKindOf "Hen_random_F"): {"costume_hen"};
		case (costumeTheAnimal isKindOf "Cock_random_F"): {"costume_cock"};
		case (costumeTheAnimal isKindOf "Sheep_random_F"): {"costume_sheep"};
		case (costumeTheAnimal isKindOf "Goat_random_F"): {"costume_goat"};
		default {""};
	};
	
	_pos = if(surfaceIsWater (getpos costumeTheAnimal)) then {getPosASL costumeTheAnimal} else {getPosATL costumeTheAnimal};
	[format["%1 hideObjectGlobal false;",real_player]] remoteExec ["TON_fnc_jccfsexbyduwxyovpqcvacxqrokbuqkrazyuobenjileoadeddujqx",2];
	if(allowedDamage) then {real_player allowDamage true;};
	player setpos _standardPos;
	real_player setPos _pos;
	selectPlayer real_player;
	player setdir _dir;
	real_player = objNull;
	deleteVehicle costumeTheAnimal;
	if(_vItem != "") then {[true,_vItem,1] call life_fnc_obfjrnynfhghcglhujcjbgakxemxpjvrqczgxoeickhzvgovmtdbvr;};
	_costumes = var_base getVariable ["currentCostumes",[]];
	_costumes = _costumes - [objNull];
	var_base setVariable ["currentCostumes",_costumes,true];
	if(_mode == 2) then {
		if((safekeeping_active OR safekeeping_inprogress) && !safekeep_toDisable) then {
			[0,format["%1 was killed by %2 (safekeeping)",profileName,_item],false,"safekeeping_active"] remoteExec ["life_fnc_broadcast",-2];
			[] spawn life_fnc_mojtaprdzoanebxzodfhngonrfnxxodmaywsoqijufkmgtidnrnwum;
		} else {
			[0,format["%1 was killed by %2",profileName,_item]] remoteExec ["life_fnc_broadcast",-2];
			player setDamage 1;
		};
	};
};
if!(isNull real_player) exitWith {};


_animal = if(_mode == 1) then {_item} else {
	switch (_item) do {
		case "costume_rabbit": {"Rabbit_F"};
		case "costume_hen": {"Hen_random_F"};
		case "costume_cock": {"Cock_random_F"};
		case "costume_sheep": {"Sheep_random_F"};
		case "costume_goat": {"Goat_random_F"};
		default {"Goat_random_F"};
	}
};

_dir = getdir player;
_pos = if(surfaceIsWater (getpos player)) then {getPosASL player} else {getPosATL player};
real_player = player;
real_player setPos _standardPos;
real_player allowDamage false;
[format["%1 hideObjectGlobal true;",real_player]] remoteExec ["TON_fnc_jccfsexbyduwxyovpqcvacxqrokbuqkrazyuobenjileoadeddujqx",2];

costumeTheAnimal =  createAgent [_animal,[0,(random 1000),0],[],0,"FORM"];
costumeTheAnimal setPos _pos;
costumeTheAnimal setDir _dir;
selectPlayer costumeTheAnimal;

costumeTheAnimal setVariable ["real_player",real_player,true];
_costumes = var_base getVariable ["currentCostumes",[]];
_costumes pushBack costumeTheAnimal;
var_base setVariable ["currentCostumes",_costumes,true];
hint localize "STR_m_EnteredAnimal";

player addEventHandler["handleDamage",{
	private ["_this","_unit","_source","_damage"];
	_unit = (_this select 0);
	_damage = (_this select 2);
	_source = (_this select 3);
	
	if(!(isNull real_player) && _damage >= 1) then {
		_damage = false;
		
		if(allowedDamage) then {
			[name _source,2] spawn life_fnc_kilyjctvlzpammikwiowotymtfdfnxqkmjnkjjzbmvqelmsykhnnvcta;
		};
	};
}];


