#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg","_housePrice"];
_house = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;
_mode = [ _this, 1, 0, [0] ] call GTA_fnc_param;
_uid = getPlayerUID player;

//--- House config
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};
if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
_housePrice = (_houseCfg select 0);

if(__GETC__(GTA_donatorLevel) > 0) then
{
	_housePrice = round(_housePrice * 0.50);
};

if(count _houseCfg == 0) exitWith {};
if(GTA_money_bank < (_housePrice)) exitWith {hint localize "STR_House_NotEnough"};

//--- Modes
switch _mode do {

	case 0: {

		_action = [
			format[localize "STR_House_BuyMSG",
			[(_housePrice)] call life_fnc_numberText,
			(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
		] call BIS_fnc_guiMessage;

		if(_action) then {

			[[_uid,_house,player],"TON_fnc_addHouse",false,false] call GTA_fnc_remoteExec;
			hint "Attempting to purchase house...";

		};

	};

	case 1: {

		hint "House purchased successfully.";
		_house setVariable["house_owner",[_uid,profileName],true];
		_house setVariable["locked",true,true];
		_house setVariable["Trunk",[[],0],true];
		_house setVariable["containers",[],true];
		_house setVariable["uid",round(random 99999),true];

		GTA_money_bank = GTA_money_bank - (_housePrice);
    [1] call GTA_fnc_updatePlayerPartial;

		life_vehicles set[count life_vehicles,_house];
		life_houses set[count life_houses,[str(getPosATL _house),[]]];
		_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_marker setMarkerTextLocal _houseName;
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};

	};

	case 2: {

		hint "House is already owned.";

	};

};
