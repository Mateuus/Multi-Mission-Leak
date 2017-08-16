/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Rearms nearby vehicles
*/

private ["_nearVehicles","_price","_sleep","_pos"];

_nearVehicles = (nearestObjects [player, ["LandVehicle","Air","Ship"], 30]);
if(DS_mining)exitwith{};
_pos = (position player);
if((DS_infoArray select 17) > 11)then
	{
	_sleep = 30;
	}
	else
	{
	_sleep = 60;
	};

if(playerSide isEqualTo west)then
	{
	_price = 5000;
	}
	else
	{
	_price = 20000;
	};

if([_price,true] call DS_fnc_checkMoney)exitwith{hint format ["You do not have enough money in your bank to do this, re-arming this vehicle cost $%1",_price];};
DS_mining = true;
hint format ["Please wait %1 seconds for rearming to complete...",_sleep];
sleep _sleep;
DS_mining = false;
if(player distance _pos > 20)exitwith{hint "You moved too far away"};
{
	if(!local _x)then
		{
		[[_x],{(_this select 0) setDamage 0;}] remoteExec ["BIS_fnc_spawn",_x];
		[[_x],{(_this select 0) setVehicleAmmo 1;}] remoteExec ["BIS_fnc_spawn",_x];
		[[_x],{(_this select 0) setFuel 1;}] remoteExec ["BIS_fnc_spawn",_x];
		}
		else
		{
		_x setDamage 0;
		_x setVehicleAmmo 1;
		_x setFuel 1;
		};
}forEach _nearVehicles;
hint "All nearby vehicles have been repaired, rearmed and refuelled";
if((playerside == civilian)&&((DS_infoArray select 17) == 11))then { [2] call DS_fnc_questCompleted };