/*
	File: fn_skyDive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiate a sky dive!
*/
if(life_lifecash < 1000) exitWith {hint "You do not have enough money to initiate a skydive!";};
_check = false; 
{if(player distance _x < 300 && side _x == west) then { _check = true; };} forEach playableUnits; 
if(_check) exitWith {hint "You can not complete this action when there are police nearby.";};
life_cash = life_cash - 1000;
_dropPos = position player;
_dropPos set [2, 5000];

cutText ["", "BLACK OUT", 3];
sleep 3;
cutText["You are approaching the drop zone.  Get ready!","BLACK FADED"];
0 cutFadeOut 999999;
player setPos (getMarkerPos "sky_dive");
removeBackpack player;
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

[[0,format["%1 has gone SkyDiving!",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; 