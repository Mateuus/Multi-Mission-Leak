/*
	File: fn_vehicleShopMenu.sqf
	
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_vehName"];
_shop = (_this select 3) param [0,"",[""]];
_sideCheck = (_this select 3) param [1,sideUnknown,[civilian]];
_spawnPoints = (_this select 3) param [2,"",["",[]]];
_shopFlag = (_this select 3) param [3,"",[""]];
_disableBuy = (_this select 3) param [5,false,[true]];

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop == "") exitWith {};

	if(_sideCheck != sideUnknown && {playerSide != _sideCheck}) exitWith {[localize "STR_Shop_Veh_NotAllowed", false] spawn domsg;};

if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,((_this select 3) select 4)];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = [_shop] call life_fnc_vehicleListCfg;

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
	_className = _x select 0;
	_basePrice = _x select 1;
	if(count _x == 3) then {
		if(isNil {_x select 2}) then {
			_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
			_control lbAdd (_vehicleInfo select 3);
		} else {
			_control lbAdd (_x select 2);
		};
	} else {
		_vehName = nil;
		_vehName = [_className] call life_fnc_vehicleNameCfg;
		if(isNil {_vehName}) then {
			_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
			_control lbAdd (_vehicleInfo select 3);
		} else {
			_control lbAdd (_vehName);
		};
	};
	_baseprice = _baseprice /10;
	//_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_className];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach _vehicleList;