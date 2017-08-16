/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Upgrades someones vehicle
*/
private ["_infoArray","_vehicle","_search","_action","_fail","_tempArray","_tempPrice"];

if(DS_doingStuff)exitwith{};
_infoArray = [];
_fail = false;
_tempArray = [];
_tempPrice = 999999;

switch(_this select 0)do
	{
	case "0":{_infoArray = ["fuel","LandVehicle",12000,"Fuel Consumption"]};
	case "1":{_infoArray = ["extraspace","LandVehicle",26000,"Storage Capacity"]};
	case "2":{_infoArray = ["security","LandVehicle",21000,"Security"]};
	case "3":{_infoArray = ["fuel","Air",35000,"Fuel Consumption"]};
	case "4":{_infoArray = ["extraspace","Air",49000,"Storage Capacity"]};
	case "5":{_infoArray = ["security","Air",52000,"Security"]};
	case "6":{_infoArray = ["insurance2","All",666,"Insurance"]};
	case "7":{_infoArray = ["thermal","All",750000,"Thermal Vision"]};
	case "8":{_infoArray = ["airBags","LandVehicle",17000,"Air Bags"]};
	case "9":{_infoArray = ["vehAmmo","All",750000,"Ammo"]};
	case "10":{_infoArray = ["vehAnimal","LandVehicle",35000,"Animal Sensor System"]};
	};

if(_infoArray isEqualTo [])exitwith{};
_action = false;
if((_infoArray select 1) == "All")then
	{
	_search = nearestObjects[getPos (vehicle player), ["Air","LandVehicle"],20];
	}
	else
	{
	_search = nearestObjects[getPos (vehicle player), [(_infoArray select 1)],20];
	};
if(count _search == 0) exitWith {hint "There isn't a vehicle close enough to upgrade"};	

if(((_this select 0) == "6")&&(typeOf (_search select 0) == "B_Heli_Attack_01_F"))exitwith{hint "You can not insure this vehicle type";DS_doingStuff = false;};

if(((!((_search select 0) getVariable ["policeVehicle",false]))||(playerside != west))&&((_this select 0) in ["7","9"]))exitWith
	{
	hint "Only police officers can use this and it must only be used on police vehicles\n\n\nCivilians will be-able to bid on this upgrade at the auction house or rebel token shop";
	};
if((_infoArray select 1) != "All")then
	{
	if(!((_search select 0) isKindOf (_infoArray select 1)))exitwith{hint "This is the wrong vehicle type for this upgrade";_fail = true;};
	};
if(_fail)exitwith{};
if((_this select 0) != "8")then
	{
	if((_search select 0) getVariable [(_infoArray select 0),false])exitwith{hint format ["This vehicle already has a %1 upgrade",(_infoArray select 3)];_fail = true;};	
	};
if(_fail)exitwith{};
if((_infoArray select 2) == 666)then
	{
	_tempArray = [666] call DS_fnc_vehShopConfig;
		{
			if((typeOf (_search select 0)) == (_x select 0))then
				{
				_tempPrice = ((_x select 1));
				if(playerside == west)then
					{
					_tempPrice = round(_tempPrice/5);
					};
				_infoArray set [2,_tempPrice];
				};
		}forEach _tempArray;
	};
	
_action = [
	format ["Do you want to upgrade this vehicles %1 for $%2",(_infoArray select 3),[(_infoArray select 2)] call DS_fnc_numberText],
	"Vehicle Upgrade",
	"Yes",
	"Cancel"
	] call BIS_fnc_guiMessage;	
if(!_action)exitwith{};

if([(_infoArray select 2),false] call DS_fnc_checkMoney)exitwith{hint "You do not have enough cash on you to perform this upgrade"};
[(_infoArray select 2),false,false] call DS_fnc_handleMoney;
DS_doingStuff = true;	
disableSerialization;	
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Upgrading Vehicle %2 (1%1)...","%",(_infoArray select 3)];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Upgrading Vehicle %3(%1%2)...",round(_cP * 100),"%",(_infoArray select 3)];
	if(_cP >= 1) exitWith {};
};	
	
5 cutText ["","PLAIN"];
titleText [format["Your vehicles %1 has now been upgraded.",(_infoArray select 3)],"PLAIN"];
DS_doingStuff = false;	
if((_this select 0) != "8")then
	{
	(_search select 0) setVariable [(_infoArray select 0),true,true];	
	}
	else
	{
	(_search select 0) setVariable [(_infoArray select 0),20,true];
	};
[[(_search select 0)],"HUNT_fnc_vehQuickSave",false,false] spawn BIS_fnc_MP;	

if((_infoArray select 0) == "vehAmmo")then
	{
	[(_search select 0)] spawn DS_fnc_clearVehAmmo;
	};

if((_this select 0) == "7")then
	{
	(_search select 0) disableTIEquipment false;
	};
if((_this select 0) == "9")then
	{
	[(_search select 0)] spawn DS_fnc_clearVehAmmo;
	};
if(((_this select 0) in ["1","4"])&&((DS_infoArray select 13) == 12))then
	{
	[0] call DS_fnc_questCompleted;
	};
if(((_this select 0) in ["0","3"])&&((DS_infoArray select 13) == 20))then
	{
	[0] call DS_fnc_questCompleted;
	};
if(((_this select 0) in ["2","5"])&&((DS_infoArray select 13) == 25))then
	{
	[0] call DS_fnc_questCompleted;
	};
if(((_this select 0) in ["10"])&&((DS_infoArray select 13) == 40))then
	{
	_tempNum = DS_infoArray select 14;
	_tempNum = _tempNum + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 9)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};