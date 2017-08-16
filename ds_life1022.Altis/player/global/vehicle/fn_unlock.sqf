/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Scripts to unlock things
*/

private ["_cursorTarget","_vehicle","_lockedState","_exit","_owners","_distance","_soundDistance","_targets"];

_cursorTarget = cursorTarget;
_exit = false;
DS_lockKeys = true;
if(isNull objectParent player)then {
	_vehicle = _cursorTarget;
	if((_cursorTarget getVariable ["security",false])||(_cursorTarget getVariable ["securityAdv",false]))then {
		_distance = 100;
	} else {
		_distance = 7;
	};
} else {
	_exit = true;
	_vehicle = (vehicle player);
	_lockedState = locked _vehicle;
	if(player distance (getMarkerPos "auctionHouse") < 300)then{_soundDistance = 2}else{_soundDistance = 20};
	if(_lockedState == 2)then {
		if(local _vehicle)then {
			_vehicle lock 0;
		} else {
			if(DS_spam > 4)then {
				_vehicle lock 0;
			} else {
				[_vehicle,0] remoteExec ["DS_fnc_vehGlobalLock",_vehicle];
			};
		};
		systemchat "Vehicle Unlocked";
		if(DS_spam < 5)then {
			[] spawn {
				DS_spam = DS_spam + 1;
				sleep 25;
				DS_spam = DS_spam - 1;
			};
			_targets = allPlayers select {(_x distance player) < _soundDistance};
			[_vehicle,"innerlock"] remoteExecCall ["DS_fnc_playSounds",_targets];
		} else {
			player say3D "innerlock";
		};
	} else {
		if(local _vehicle)then {
			_vehicle lock 2;
		} else {
			if(DS_spam > 4)then {
				_vehicle lock 2;
			} else {
				[_vehicle,2] remoteExec ["DS_fnc_vehGlobalLock",_vehicle];
			};
		};
		systemchat "Vehicle Locked";
		if(DS_spam < 5)then {
			[] spawn {
				DS_spam = DS_spam + 1;
				sleep 25;
				DS_spam = DS_spam - 1;
			};
			_targets = allPlayers select {(_x distance player) < _soundDistance};
			[_vehicle,"innerlock"] remoteExecCall ["DS_fnc_playSounds",_targets];
		} else {
			player say3D "innerlock";
		};
	};
};

if(_exit)exitwith{DS_lockKeys = false};//Player was inside a vehicle and has already done what they needed to do
if((typeOf _vehicle) in ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"])then {
	_distance = 100;
	};
if(((_vehicle in DS_keyRing)&&(player distance _vehicle < _distance))||((playerSide isEqualTo west)&&((typeOf _vehicle == "O_Truck_03_covered_F")||(_vehicle getVariable ["isMCUWater",false]))))then {
	_lockedState = locked _vehicle;
	if(player distance (getMarkerPos "auctionHouse") < 300)then{_soundDistance = 5}else{_soundDistance = 300};
	if(_lockedState == 2)then {
		if(local _vehicle)then {
			_vehicle lock 0;
		} else {
			[_vehicle,0] remoteExec ["DS_fnc_vehGlobalLock",_vehicle];
		};
		systemchat "Vehicle Unlocked";
		if(DS_spam < 5)then {
			[] spawn {
				DS_spam = DS_spam + 1;
				sleep 25;
				DS_spam = DS_spam - 1;
			};
			_targets = allPlayers select {(_x distance player) < _soundDistance};
			[_vehicle,"lock"] remoteExecCall ["DS_fnc_playSounds",_targets];
		} else {
			player say3D "lock";
		};
	} else {
		if(local _vehicle)then {
			_vehicle lock 2;
		} else {
			[_vehicle,2] remoteExec ["DS_fnc_vehGlobalLock",_vehicle];
		};
		systemchat "Vehicle Locked";
		if(DS_spam < 5)then {
			[] spawn {
				DS_spam = DS_spam + 1;
				sleep 25;
				DS_spam = DS_spam - 1;
			};
			_targets = allPlayers select {(_x distance player) < _soundDistance};
			[_vehicle,"unlock"] remoteExecCall ["DS_fnc_playSounds",_targets];
		} else {
			player say3D "unlock";
		};
	};
} else {
	if(player distance _vehicle > 7)exitwith{DS_lockKeys = false};
	_owners = _vehicle getVariable ["vehicle_owners",[]];
		{
			if((name player) == _x select 1)then {
				DS_keyRing pushBack _vehicle;
				systemchat "You found the key to this vehicle";
			};
		}forEach _owners;
		if(!(_vehicle in DS_keyRing))exitwith{DS_lockKeys = false;systemchat "You do not have the key to this vehicle"};
};
DS_lockKeys = false;