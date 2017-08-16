/*
	File: fn_blindfolded.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Blinds the player when he's restrained
*/

_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if (!(player getVariable ["restrained",false])) exitWith {};

systemChat format["You were blindfolded by %1.", name _unit];
player setVariable ["blindfolded", true, true];
cutText["You are blindfolded and cannot see.","BLACK FADED"];
0 cutFadeOut 9999999;

_bf = "Land_Bucket_F" createVehicle (getPos player);
_bf attachTo [player,[0,-0.05,0],"Head"];
_bf setVectorUp [0,0,-1];
_bf setVariable ["owner", player, true];
player setVariable ["blindfold", _bf, true];
life_old_group = group player;
[player] join grpNull;

waitUntil {!(player getVariable ["blindfolded",false])};

player setVariable ["blindfold", nil, true];
deleteVehicle _bf;
0 cutFadeOut 1;
if (count (units life_old_group) < 10) then
{
	[player] joinSilent (life_old_group);
}
else
{
	[player] joinSilent (createGroup playerSide);
};
life_old_group = grpNull;