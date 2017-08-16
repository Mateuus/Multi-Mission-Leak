/*
		fn_sitdown.sqf
		Author: G00golplexian
		
		Description: let you sit down on a chair
*/
private["_chair"];

if(life_action_sitzt) exitWith {hint "Du sitzt bereits."};

_chair = nearestobjects [player,["Land_Bench_F","Land_Bench_01_F","Land_Bench_02_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_rattanChair_01_F"],5] select 0;

if(isNil "_chair") exitWith {hint "Du bist nicht in der Nähe einer Sitzmöglichkeit!"};
if(vehicle player != player) exitWith {hint "Du erreichst die Sitzmöglichkeit nicht."};
if(_chair getvariable "alreadySitting") exitWith {hint "Auf dieser Bank sitzt bereits jemand."};
life_action_sitzt = true;

if(_chair isKindOf "Land_Bench_F" && player distance _chair < 5) then {

	_chair setvariable ["alreadySitting",true,true];
	player attachTo [_chair,[0,0,-0.2]];
	player setdir 90;
	player attachTo [_chair,[0,0,-0.2]];
	player setdir 90;	
	[player,"hubsittingchairb_idle1"] remoteExecCall ["switchmove",0];

} else {

	if(typeOf _chair in ["Land_Bench_01_F","Land_Bench_02_F","Land_CampingChair_V1_F","Land_CampingChair_V2_F","Land_ChairPlastic_F","Land_ChairWood_F"] OR _chair isKindOf "Land_rattanChair_01_F" && player distance _chair < 5) then {
	_chair setvariable ["alreadySitting",true,true];
	player attachTo [_chair,[0,0,-0.45]];
	player setdir 180;
	player attachTo [_chair,[0,0,-0.45]];
	player setdir 180;	
	[player,"hubsittingchaira_move1"] remoteExecCall ["switchmove",0];
	};
};