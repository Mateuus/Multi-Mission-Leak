/*
  ArmA.Network
  Rathbone
  Transfers Item selected from Player to Locker and vice versa
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;

_mode = param [0,-1,[0]];
if(_mode isEqualTo -1) exitWith {};
_display = findDisplay 6985;
_lockerListbox = _display displayCtrl 1501;
_ownInvListbox = _display displayCtrl 1500;
_index1 = lbCurSel _lockerListbox;
_index2 = lbCurSel _ownInvListbox;

_selClassname1 = _lockerListbox lbData _index1;
_selClassname2 = _ownInvListbox lbData _index2;

_capacity = if("storage" in AN_Skills) then {15} else {10};

switch (_mode) do {
	case 0 : {
		if (_selClassname1 isEqualTo "") exitWith {};
		_index = -1;
		{
			_index = _index + 1;
			if (_x select 0 isEqualTo _selClassname1) then {
				_wasHandled = false;
				_uniformWasMoved = false;
				_canBeRemoved = true;
				[_selClassname1,true] call life_fnc_waxecruwuka;
				if (_canBeRemoved) then {
					if(((LockerInventory select _index select 1)-1) isEqualTo 0) then {
						LockerInventory deleteAt _index;
					} else {
						LockerInventory set [_index,[_selClassname1,((LockerInventory select _index select 1)-1)]];
					};
				} else {
					_item = [_selClassname1] call life_fnc_thagawrepru;
					hintSilent format ["You do not have room in your inventory for: %1",_item select 1];
				};
			};
		} forEach LockerInventory;
	};
	case 1 : {
		if(_selClassname2 isEqualTo "") exitWith {};
		if(count LockerInventory >= _capacity) exitWith {hintSilent "You've reached the capacity limit of your Locker!";};
		[_selClassname2,false] call life_fnc_waxecruwuka;
		_wasInArray = false;
		_index = -1;
		{
			_index = _index + 1;
			if (_x select 0 isEqualTo _selClassname2) then {
				_wasInArray = true;
				LockerInventory set [_index,[_selClassname2,((LockerInventory select _index select 1)+1)]];
			};
		} forEach LockerInventory;
		if (!_wasInArray) then {LockerInventory pushBack [_selClassname2,1];};
	};
};
[] spawn life_fnc_wrestacr;
