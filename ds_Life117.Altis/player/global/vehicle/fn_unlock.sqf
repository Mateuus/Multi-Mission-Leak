/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Scripts to unlock things
*/

private ["_cursorTarget","_vehicle","_lockedState","_exit","_owners","_distance","_soundDistance"];

_cursorTarget = cursorTarget;
_exit = false;
DS_lockKeys = true;
if((vehicle player) == player)then
	{
	_vehicle = _cursorTarget;
	if((_cursorTarget getVariable ["security",false])||(_cursorTarget getVariable ["securityAdv",false]))then
		{
		_distance = 100;
		}
		else
		{
		_distance = 7;
		};
	}
	else
	{
	_exit = true;
	_vehicle = (vehicle player);
	_lockedState = locked _vehicle;
	if(player distance (getMarkerPos "auctionHouse") < 300)then{_soundDistance = 2}else{_soundDistance = 20};
	if(_lockedState == 2)then
		{
		if(local _vehicle)then
			{
			_vehicle lock 0;
			}
			else
			{
			[[_vehicle,0], "DS_fnc_vehGlobalLock",_vehicle,false] spawn DS_fnc_MP;
			};
		systemchat "Vehicle Unlocked";
		{
			if(player distance _x < _soundDistance)then
				{
				[[_vehicle,"innerlock"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		}
		else
		{
		if(local _vehicle)then
			{
			_vehicle lock 2;
			}
			else
			{
			[[_vehicle,2], "DS_fnc_vehGlobalLock",_vehicle,false] spawn DS_fnc_MP;
			};
		systemchat "Vehicle Locked";
		{
			if(player distance _x < _soundDistance)then
				{
				[[_vehicle,"innerlock"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		};
	};
	
if(_exit)exitwith{DS_lockKeys = false};//Player was inside a vehicle and has already done what he needed to do

if(((_vehicle in DS_keyRing)&&(player distance _vehicle < _distance))||((playerside == west)&&(typeOf _vehicle == "O_Truck_03_covered_F")))then
	{
	_lockedState = locked _vehicle;
	if(player distance (getMarkerPos "auctionHouse") < 300)then{_soundDistance = 5}else{_soundDistance = 100};
	if(_lockedState == 2)then
		{
		if(local _vehicle)then
			{
			_vehicle lock 0;
			}
			else
			{
			[[_vehicle,0], "DS_fnc_vehGlobalLock",_vehicle,false] spawn DS_fnc_MP;
			};
		systemchat "Vehicle unlocked";
		{
			if(player distance _x < _soundDistance)then
				{
				[[_vehicle,"lock"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		}
		else
		{
		if(local _vehicle)then
			{
			_vehicle lock 2;
			}
			else
			{
			[[_vehicle,2], "DS_fnc_vehGlobalLock",_vehicle,false] spawn DS_fnc_MP;
			};
		systemchat "Vehicle Locked";
		{
			if(player distance _x < _soundDistance)then
				{
				[[_vehicle,"unlock"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		};
	}
	else
	{
	if(player distance _vehicle > 7)exitwith{DS_lockKeys = false};
	_owners = _vehicle getVariable ["vehicle_owners",[]];
		{
			if((name player) == _x select 1)then
				{
				DS_keyRing pushBack _vehicle;
				systemchat "You found the key to this vehicle";
				};
		}forEach _owners;
		if(!(_vehicle in DS_keyRing))exitwith{DS_lockKeys = false;systemchat "You do not have the key to this vehicle"};
	};
DS_lockKeys = false;