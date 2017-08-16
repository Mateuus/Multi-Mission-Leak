/*
	File: fn_warStatus.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Status of a gang war has updated (new or cancel)
*/

private ["_gang1","_gang2","_status","_gang"];

_gang1 = [_this,0,"",[""]] call BIS_fnc_param;
_gang2 = [_this,1,"",[""]] call BIS_fnc_param;
_status = [_this,2,false,[false]] call BIS_fnc_param;
_gang = _gang1;

if (life_gang == "0") exitWith {};
if (life_gang == _gang1) then { _gang = _gang2 };

life_gang_challenges = life_gang_challenges - [_gang];
if (_status) then
{
	hint parseText "<t color='#FF0000'><t size='2'>New Gang War</t></t><br/><t color='#FFFFFF'>Your gang is now involved with a new gang war! Watch your back!";
	life_gang_wars pushBack _gang;
}
else
{
	hint parseText "<t color='#FF0000'><t size='2'>War Ended</t></t><br/><t color='#FFFFFF'>One of your gang's wars has ended.";
	life_gang_wars = life_gang_wars - [_gang];
};

if (!isNull (findDisplay 9580)) then { [] spawn life_fnc_gangWars; };