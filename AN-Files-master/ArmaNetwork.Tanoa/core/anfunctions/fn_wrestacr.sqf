/*
  ArmA.Network
  Rathbone
  Opens Locker Menu
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_lockerMenu = false;
if(isNull (findDisplay 6985)) then {createDialog "an_lockers"; _lockerMenu = true;};
disableSerialization;
_display = findDisplay 6985;
_lockerListbox = _display displayCtrl 1501;
_ownInvListbox = _display displayCtrl 1500;
_rentTime = _display displayCtrl 2402;
if(_lockerMenu) then {
  _display displaySetEventHandler ["KeyDown","_this call life_fnc_displayHandler"];
  _rentTime ctrlSetStructuredText parseText format["<t size = '1.25'>%1 Days and %2 hour(s)</t>",RentTime select 0,RentTime select 1];
  hintSilent "";
};

lbClear _lockerListbox;
lbClear _ownInvListbox;

if(count LockerInventory > 0) then {
  _index = -1;
  {
  	_item = [_x select 0] call life_fnc_thagawrepru;
  	_itemAmount = _x select 1;
  	_itemPic = _item select 2;
  	_itemDisplayName = _item select 1;
  	_index = _index + 1;
  	_lockerListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAmount];
  	_lockerListbox lbSetPicture [_index, _itemPic];
  	_lockerListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
  	_lockerListbox lbSetData [(lbSize _lockerListbox)-1,_x select 0];
    _lockerListbox lbSetCurSel 0;
  } forEach LockerInventory;
} else {
  _lockerListbox lbSetCurSel -1;
};

_magazines = magazines player;
_items = items player;
_weapons = currentWeapon player;
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_headgear = headgear player;
_goggles = goggles player;
_nv = hmd player;

playerInventoryArray = [];

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 isEqualTo _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _magazines;

{
	_index = -1;
	_curItemName = _x;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 isEqualTo _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_curItemName,1]];
	};
} forEach _items;

if (_weapons != "") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 isEqualTo _weapons) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_weapons,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_weapons,1]];
	};
};

if (_backpack != "") then {
	playerInventoryArray pushBack [_backpack,1];
};

if (_vest != "") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 isEqualTo _vest) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_vest,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_vest,1]];
	};
};

if (_uniform != "") then {
	_index = -1;
	_wasInArray = false;
	{
		_index = _index + 1;
		if (_x select 0 isEqualTo _uniform) then {
			_wasInArray = true;
			playerInventoryArray set [_index,[_uniform,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray set [count playerInventoryArray,[_uniform,1]];
	};
};

if(_headgear != "") then {
  playerInventoryArray pushBack [_headgear,1];
};
if(_goggles != "") then {
  playerInventoryArray pushBack [_goggles,1];
};
if(_nv != "") then {
  playerInventoryArray pushBack [_nv,1];
};

_index = -1;
{
	_item = [_x select 0] call life_fnc_thagawrepru;
	_itemAmount = _x select 1;
	_itemPic = _item select 2;
	_itemDisplayName = _item select 1;
	_index = _index + 1;
	_ownInvListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAmount];
	_ownInvListbox lbSetPicture [_index, _itemPic];
	_ownInvListbox lbSetPictureColor [_index, [1, 1, 1, 1]];
	_ownInvListbox lbSetData [(lbSize _ownInvListbox)-1,_x select 0];
  _ownInvListbox lbSetCurSel 0;
} forEach playerInventoryArray;
