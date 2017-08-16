/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens and updates the boot menu (Mericans call it a trunk)
*/

private ["_nearbyPlayers","_noImg","_nearbyPlayers","_bonus","_upgraded","_img","_vehMaxWeight","_vehCurWeight","_vehData","_dialog","_title","_list1","_list2","_vehicle","_img1","_img2","_vehTitle","_playerTitle","_vehicleWeight","_takeAmount","_storeAmount","_storedItems","_index","_string","_amount","_short","_btnStore","_btnTake"];

disableSerialization;

if(DS_mining)exitWith{}; //Anti Exploit
if(player getVariable ["restrained",false])exitWith{hint "You can not do this while restrained"};

if(!isNull (findDisplay 2900))exitWith{};

closeDialog 0;
createDialog "bootMenu";

_vehicle = _this select 0;
_bonus = 1;
DS_bootVeh = _vehicle;

switch(true)do {
	case (_vehicle getVariable ["extraspace1",false]): {_bonus = 1.2};
	case (_vehicle getVariable ["extraspace2",false]): {_bonus = 1.4};
	case (_vehicle getVariable ["extraspace3",false]): {_bonus = 1.6};
	case (_vehicle getVariable ["extraspace4",false]): {_bonus = 1.8};
	case (_vehicle getVariable ["extraspace5",false]): {_bonus = 2};
	default {_bonus = 1};
};

if(_vehicle getVariable ["extraspace",false])then {
	_bonus = _bonus + 0.5;
};

if(_vehicle getVariable ["extraspaceAdv",false])then {
	if(_vehicle getVariable ["extraspace",false])then {
		_bonus = _bonus + 0.5;
	} else {
		_bonus = _bonus + 1;
	};
};

_dialog = findDisplay 666668;
_list1 = _dialog displayCtrl 1500;
_list2 = _dialog displayCtrl 1501;
_img1 = _dialog displayCtrl 1200;
_img2 = _dialog displayCtrl 1201;
_vehTitle = _dialog displayCtrl 1000;
_playerTitle = _dialog displayCtrl 1001;
_vehicleWeight = _dialog displayCtrl 1002;
_takeAmount = _dialog displayCtrl 1400;
_storeAmount = _dialog displayCtrl 1401;
_btnStore = _dialog displayCtrl 1203;
_btnTake = _dialog displayCtrl 1204;

_noImg = ["houseItemUpgrade","houseWeaponUpgrade","jail10","safeCrackerAdv","jailBreak","steroids","noRecoil","quickCap","packCPU","packBattery","packCircuitBoard","packGlass","packBronze","packSteel","pawnee","convoy","armourAdv","insurance","airBags"];

_playerTitle ctrlSetStructuredText parseText "<t color='#FFFFFF'>Players Inventory</t>";
_vehTitle ctrlSetStructuredText parseText "<t color='#FFFFFF'> Vehicles Inventory</t>";

lbClear _list1;
lbClear _list2;

if(_vehicle getVariable ["boot_open",false])then {
	_nearbyPlayers = {(alive _x)&&(_x distance player < 10)} count allPlayers;
	if(_nearbyPlayers isEqualTo 1)then {
		_vehicle setVariable ["boot_open",false,true];
	};
};

if(_vehicle getVariable ["boot_open",false])exitWith{hint "This vehicles boot is already in use";closeDialog 0;};
if(_vehicle getVariable ["autoMining",false])exitWith{hint "You can not open the boot of a vehicle that is mining";closeDialog 0;};

_vehicle setVariable["boot_open",true,true];
_storedItems = _vehicle getVariable ["boot",[]];
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehMaxWeight = [(typeOf _vehicle)] call DS_fnc_getVehWeight;
if(_vehicle getVariable ["smallSpace",false])then {
	_vehMaxWeight = 1000;
};
_vehMaxWeight = (round(_vehMaxWeight*_bonus));
_vehCurWeight = _vehData select 1;
_vehicleWeight ctrlSetStructuredText parseText format ["<t color='#FFFFFF'>%1 / %2</t>",_vehCurWeight,_vehMaxWeight];

if(_storedItems isEqualTo [])then {
    _vehicle setVariable["boot",[[],0],true];
    _storedItems = [];}
else {
    _storedItems = _storedItems select 0;
};

{
	_amount = _x select 1;

	if(_amount > 0)then {
		_item = _x select 0;
		_string = [_item] call DS_fnc_itemStringConfig;
		_img = format ["extras\icons\%1.jpg",_item];
        if([_item,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg"};
		if([_item,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg"};
		if([_item,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg"};
		if(_item in _noImg)then{_img = ""};

		_index = _list1 lbAdd format["[%1] - %2",_amount,_string];
        _list1 lbSetData [_index,_item];
        if(!(_img isEqualTo ""))then{_list1 lbSetPicture [_index,_img];};
	};
} forEach _storedItems;

{
	_value = missionNamespace getVariable (format ["DS_item_%1",_x]);

	if(_value > 0)then {
		_string = [_x] call DS_fnc_itemStringConfig;
		_img = format ["extras\icons\%1.jpg",_x];
		if([_x,"bp"] call DS_fnc_strInStr)then{_img = "extras\icons\bluePrint.jpg"};
		if([_x,"ammo"] call DS_fnc_strInStr)then{_img = "extras\icons\vehAmmo.jpg"};
		if([_x,"gun"] call DS_fnc_strInStr)then{_img = "extras\icons\mcuGun.jpg"};
		if(_x in _noImg)then{_img = ""};

		_index = _list2 lbAdd format ["%1x - %2",_value,_string];
		_list2 lbSetData [_index,_x];
		if(!(_img isEqualTo ""))then{_list2 lbSetPicture [_index,_img];};
	};
} forEach DS_itemArray;

_btnStore buttonSetAction "[] spawn DS_fnc_vehItemStore;";
_btnTake buttonSetAction "[] spawn DS_fnc_vehItemTake;";

[DS_bootVeh] spawn {
	waitUntil {isNull (findDisplay 666668)};
	(_this select 0) setVariable["boot_open",false,true];
};