/*
	File: fn_skyDive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiate a sky dive!
*/

if (backpack player != "") exitWith { hint "You can't be wearing a backpack when you skydive.  Parachutes are somewhat essential!" };

_cops = false;
{
	if (side _x == west && player distance _x < 1000 && life_wanted > 0) then { _cops = true; };
} forEach allPlayers;
if (_cops) exitWith {hint "You cannot skydive when there is a cop within one kilometre and you're actively wanted by the police."};

if(!([200] call life_fnc_debitCard)) exitWith {};

_dropPos = position player;
_dropPos set [2, 5000]; // Set drop altitude

cutText ["", "BLACK OUT", 3];
sleep 3;
if (isWeaponDeployed player) then { player playMove ""; };
cutText["You are approaching the drop zone.  Get ready!","BLACK FADED"];
0 cutFadeOut 999999;
player setPos (getMarkerPos "sky_dive");
player addBackpack "B_Parachute";
0 fadeSound 0;
2 fadeSound 1;
for "_i" from 0 to 5 do
{
	playSound "airplane";
	sleep 2.2;
	switch (_i) do
	{
		case 3: { playSound "racebeep1"; };
		case 4: { playSound "racebeep1"; };
		case 5: { playSound "racebeep2"; };
	};
};

// Weee!
player setPosASL _dropPos;
_draw = viewDistance;
setViewDistance 6000;
if (cameraView == "EXTERNAL") then { player switchCamera "INTERNAL"; };
cutText ["", "BLACK IN", 0.75];

while {(getPos player) select 2 > 100} do
{
	sleep 1;
	_newDistance = (((getPos player) select 2) + 1000);
	if (_newDistance > _draw) then { setViewDistance _newDistance; };
};

waitUntil { (getPos player) select 2 < 10 };

setViewDistance _draw;