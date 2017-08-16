waitUntil {sleep 0.1; createDialog "AH_sell";};

disableSerialization;
_dialog = findDisplay 15000;
_myInvListbox = _dialog displayCtrl 15001;

lbClear _myInvListbox;

playerInventoryArray = [];
_magazines = magazines player;
_items = items player;
_weapons = currentWeapon player;
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;

{
	_val = missionNameSpace getVariable ((life_itemInfo select _forEachIndex) select 0);
	if(_val > 0) then
	{
		_myInvListbox lbAdd format["(%1) %2",_val,((life_itemInfo select _forEachIndex) select 1)];
		_myInvListbox lbSetData [(lbSize _myInvListbox)-1,((life_itemInfo select _forEachIndex) select 0)];		
		_myInvListbox lbSetPicture [(lbSize _myInvListbox)-1,((life_itemInfo select _forEachIndex) select 3)];
		_myInvListbox lbSetColor[(lbSize _myInvListbox)-1,((life_itemInfo select _forEachIndex) select 4) select 1];
	};
} foreach life_inv_items;

{
	_vehicleInfo = [typeOf _x] call life_fnc_fetchVehInfo;
	_vehicleColor = [(_vehicleInfo select 0),(_x getvariable "life_veh_color")] call life_fnc_vehicleColorStr;
	if!((_vehicleInfo select 0) isKindOf "House") then
	{
		_myInvListbox lbAdd format["%1 (%2)",(_vehicleInfo select 3),_vehicleColor];
		_myInvListbox lbSetPicture [(lbSize _myInvListbox)-1,(_vehicleInfo select 2)];
		_myInvListbox lbSetData [(lbSize _myInvListbox)-1,(typeOf _x)];
	};
} foreach life_vehicles;

{
	_curItemName = _x;
	_wasInArray = false;
	{
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray set [_forEachIndex,[_curItemName,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;

	if (!_wasInArray) then {
		playerInventoryArray pushBackUnique [_curItemName,1];
	};

} forEach _items;

if (_backpack!="") then {
	playerInventoryArray pushBackUnique [_backpack,1];
};

if (_uniform!="") then {
	_wasInArray = false;
	{
		if (_x select 0 == _uniform) then {
			_wasInArray = true;
			playerInventoryArray set [_forEachIndex,[_uniform,(_x select 1)+1]];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray pushBackUnique [_uniform,1];
	};
};

{
	_item = [_x select 0] call life_fnc_fetchCfgDetails;
	_itemAnzahl = _x select 1;
	_itemPic = _item select 2;
	_itemDisplayName = _item select 1;

	_myInvListbox lbAdd format ["(%2) %1",_itemDisplayName,_itemAnzahl];
	_myInvListbox lbSetPicture [(lbSize _myInvListbox)-1, _itemPic];
	_myInvListbox lbSetData [(lbSize _myInvListbox)-1,_x select 0];
} forEach playerInventoryArray;



/*

if (_weapons!="") then {
	_wasInArray = false;
	{
		if (_x select 0 == _weapons) then {
			_wasInArray = true;
			playerInventoryArray pushBack [_weapons,(_x select 1)+1];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray pushBack [_weapons,1];
	};
};

{
	_curItemName = _x;
	_wasInArray = false;
	{
		if (_x select 0 == _curItemName) then {
			_wasInArray = true;
			playerInventoryArray pushBack [_curItemName,(_x select 1)+1];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray pushBack [_curItemName,1];
	};
} forEach _magazines;


if (_vest!="") then {
	_wasInArray = false;
	{
		if (_x select 0 == _vest) then {
			_wasInArray = true;
			playerInventoryArray pushBack [_vest,(_x select 1)+1];
		};
	} forEach playerInventoryArray;
	if (!_wasInArray) then {
		playerInventoryArray pushBack [_vest,1];
	};
};

*/