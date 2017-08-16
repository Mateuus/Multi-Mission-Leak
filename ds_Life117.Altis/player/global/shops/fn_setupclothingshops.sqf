/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the clothing shops
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_desc","_config","_type","_shopArray"];

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];
lbClear _vehicleList;
_shopArray = [_shop] call DS_fnc_clothingShopConfig;

{
	_className = (_x select 0);
	_price = (_x select 1);
	_type = if(isNil "_nothing")then
		{
		switch (true) do
			{
			case (isClass (configFile >> "CfgGlasses" >> _className)) : {"CfgGlasses";};
			case (isClass (configFile >> "CfgVehicles" >> _className)) : {"CfgVehicles";};
			case (isClass (configFile >> "CfgMagazines" >> _className)) : {"CfgMagazines";};
			case (isClass (configFile >> "CfgWeapons" >> _className)) : {"CfgWeapons";};
			};
		};
	switch (_type) do
		{
		case "CfgMagazines":
			{
			_config = configFile >> "CfgMagazines" >> _className;
			};
		case "CfgWeapons":
			{
			_config = configFile >> "CfgWeapons" >> _className;
			};
		case "CfgGlasses":
			{
			_config = configFile >> "CfgGlasses" >> _className;
			};
		case "CfgVehicles":
			{
			_config = configFile >> "CfgVehicles" >> _className;
			};
		};
	_img = getText(_config >> "picture");
	_name = getText(_config >> "displayName");
	_desc = getText(_config >> "descriptionshort");
	_desc = [_desc,"<br />"," "] call KRON_Replace;
	_desc = [_desc,"<br/>"," "] call KRON_Replace;
	_toolTip = format ["%1",_desc];
	_vehicleList lbAdd format ["%1",_name];		_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];		_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
	if(DS_coin >= _price)then
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
		}
		else
		{
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [1, 0, 0, 0.5]];
		};
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
} foreach _shopArray;

sleep 0.2;
DS_doingStuff = false;
