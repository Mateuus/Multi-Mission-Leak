/*
file: fn_pushBoat.sqf
Boat push script - v0.1
Pushes the boat in the direction the player is looking
Created by BearBison
Modified by PlayGermany
*/
if (isDedicated) exitWith {};
private ["_Object","_isWater"];
_Object = _this select 0;
//_isWater = surfaceIsWater position player; 
//if (_isWater) exitwith {titleText ["Du kannst nicht vom Wasser aus schieben!","PLAIN DOWN",1];};

_Object setOwner (owner player);
player playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
if (currentWeapon player == "") then {sleep 1;} else {sleep 2;};
_Object setVelocity [(sin(direction player))*3, (cos(direction player))*3, 0];  
sleep 1;
_Object setVelocity [0,0,0];  