/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the car shops
*/

private ["_shop","_dialog","_list","_shopArray","_className","_price","_weight","_armorRating","_maxSpeed","_img","_name","_tooltip","_index","_dlcName"];

disableSerialization;

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_vehShopConfig;

lbClear _list;

{
	_className = (_x select 0);
	_price = (_x select 1);
	_weight = [_className] call DS_fnc_getVehWeight;
	_config = configFile >> "CfgVehicles" >> _className;
	_armorRating = getNumber (_config >> "armor");
	_maxSpeed = getNumber (_config >> "maxSpeed");
	_img = getText (configFile >> "CfgVehicles" >> _className >> "picture");
	_name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
	if((_className in ["O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F"])&&(player distance shawn1 < 500))then {
		_tooltip = format ["Capacity: 1000kg | Max Speed: %1 | Armour: %2 (This is a trial version of the GCU)",_maxSpeed,_armorRating];
	} else {
		if(player distance shawn1 < 500)then {
			_tooltip = format ["Capacity: %1kg | Max Speed: %2 | Armour: %3 (This is a rental only version of this vehicle with Security, Fuel, Airbags, Repellent and Ammo upgrades",_weight,_maxSpeed,_armorRating];
		} else {
			_tooltip = format ["Capacity: %1kg | Max Speed: %2 | Armour: %3",_weight,_maxSpeed,_armorRating];
		};
	};

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetPicture [_index,_img];
	if(DS_coin >= _price)then {
		_list lbSetColor [_index,[0,1,0,0.5]];
	} else {
		_list lbSetColor [_index,[1,0,0,0.5]];
	};
	_list lbSetData [_index,_className];

	_dlcName = [_config] call DS_fnc_getConfigDLC;
	if(!(_dlcName isEqualTo ""))then {
		_list lbSetPictureRight [_index,(modParams [_dlcName,["logo"]]) param [0,""]];
	};
} forEach _shopArray;

sleep 0.2;
DS_doingStuff = false;