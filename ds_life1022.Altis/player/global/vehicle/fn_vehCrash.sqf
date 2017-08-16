/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Runs the spike effect on an affected vehicle
*/

private["_vehicle","_rand","_targets"];

if(isNull objectParent player)exitwith{};
_vehicle = (vehicle player);

if((player getVariable ["policeSquad",""]) == "Rapid Response")exitwith{};
if(player distance shawn1 < 2000)exitwith{};
if(player distance gangflag1 < 500)exitwith{};
if(player distance gangflag2 < 500)exitwith{};
if(player distance gangflag3 < 500)exitwith{};
if(DS_realMode)exitwith{};

if(typeOf _vehicle in ["C_Kart_01_Blu_F"])exitwith{};//Has no headlights
_rand = random 5;
switch(true)do {
	case (_rand > 3): {
		_vehicle setHitPointDamage["HitLFWheel",0.8];
		_targets = allPlayers select {(_x distance player) < 300};
		[_vehicle,"chicken"] remoteExecCall ["DS_fnc_playSounds",_targets];
		hint "You've hit a chicken and damaged your vehicle.. you would have seen this with your lights on!";
	};
	case (_rand > 1): {
		_vehicle setHitPointDamage["HitLFWheel",1];
		_vehicle setHitPointDamage["HitRFWheel",0.5];
		_targets = allPlayers select {(_x distance player) < 300};
		[_vehicle,"sheep"] remoteExecCall ["DS_fnc_playSounds",_targets];
		hint "You've hit a sheep and damaged your vehicle.. you would have seen this with your lights on!";
	};
	default {
		_vehicle setHitPointDamage["HitLFWheel",1];
		_vehicle setHitPointDamage["HitLF2Wheel",1];
		_vehicle setHitPointDamage["HitRFWheel",1];
		_vehicle setHitPointDamage ["hitEngine", 1.0];
		_targets = allPlayers select {(_x distance player) < 300};
		[_vehicle,"cow"] remoteExecCall ["DS_fnc_playSounds",_targets];
		hint "You've hit a cow and damaged your vehicle.. you would have seen this with your lights on!";
	};
};