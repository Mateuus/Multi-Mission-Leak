/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(count _this > 0) then {
	_convert = false;
	if (((_this select 0) select 1) isEqualType []) then {
    _convert = true;
  };
	if (_convert) then
  {
  	{
  		_className = _x select 0;
  		_weapons = (_x select 1) select 0;
  		_magazines = (_x select 1) select 1;
  		_items = (_x select 1) select 2;
  		_backpacks = (_x select 1) select 3;
  		LockerInventory pushBack [_className,1];
  		_index = -1;
  		{
  			_index = _index + 1;
  			_itemName = _x;
  			_itemAmount = (_weapons select 1) select _index;
  			_wasInArray = false;
  			_index2 = -1;
  			{
  				_wasInArray = false;
  				_index2 = _index2 + 1;
  				if (_x select 0 isEqualTo _itemName) then {
  					_wasInArray = true;
  					LockerInventory set [_index2,[_itemName,((LockerInventory select _index2) select 1) + _itemAmount]];
  				};
  			} forEach LockerInventory;
				if (!_wasInArray) then {
  				LockerInventory set [count LockerInventory,[_itemName,_itemAmount]];
  			};
  		} forEach (_weapons select 0);

  		_index = -1;
  		{
  			_index = _index + 1;
  			_itemName = _x;
  			_itemAmount = (_magazines select 1) select _index;
  			_wasInArray = false;
  			_index2 = -1;
  			{
  				_wasInArray = false;
  				_index2 = _index2 + 1;
  				if (_x select 0 isEqualTo _itemName) then {
  					_wasInArray = true;
  					LockerInventory set [_index2,[_itemName,((LockerInventory select _index2) select 1) + _itemAmount]];
  				};
  			} forEach LockerInventory;
  			if (!_wasInArray) then {
  				LockerInventory set [count LockerInventory,[_itemName,_itemAmount]];
  			};
  		} forEach (_magazines select 0);

  		_index = -1;
  		{
  			_index = _index + 1;
  			_itemName = _x;
  			_itemAmount = (_items select 1) select _index;
  			_wasInArray = false;
  			_index2 = -1;
  			{
  				_wasInArray = false;
  				_index2 = _index2 + 1;
  				if (_x select 0 isEqualTo _itemName) then {
  					_wasInArray = true;
  					LockerInventory set [_index2,[_itemName,((LockerInventory select _index2) select 1) + _itemAmount]];
  				};
  			} forEach LockerInventory;
  			if (!_wasInArray) then {
  				LockerInventory set [count LockerInventory,[_itemName,_itemAmount]];
  			};
  		} forEach (_items select 0);

  		_index = -1;
  		{
  			_index = _index + 1;
  			_itemName = _x;
  			_itemAmount = (_backpacks select 1) select _index;
  			_wasInArray = false;
  			_index2 = -1;
  			{
  				_wasInArray = false;
  				_index2 = _index2 + 1;
  				if (_x select 0 isEqualTo _itemName) then {
  					_wasInArray = true;
  					LockerInventory set [_index2,[_itemName,((LockerInventory select _index2) select 1) + _itemAmount]];
  				};
  			} forEach LockerInventory;
  			if (!_wasInArray) then {
  				LockerInventory set [count LockerInventory,[_itemName,_itemAmount]];
  			};
  		} forEach (_backpacks select 0);
  	} forEach _this;
	} else {
  	LockerInventory = _this;
  };
};
