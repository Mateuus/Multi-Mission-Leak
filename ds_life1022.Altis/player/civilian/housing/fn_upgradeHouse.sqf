/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Upgrades a houses storage (Maybe more later on)
*/

private ["_exit","_action","_currentLevel","_infoArray","_super","_upgradeCost"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_exit = false;
if(DS_item_houseItemUpgrade > 0)then {
	_action = [
		"You have a super house upgrade in your inventory, unless you want to use this at the houses current level then remove it before carrying on",
		"Use Upgrade Item",
		"Use Item",
		"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitWith{_exit = true;};
};
if(_exit)exitWith{};

if(DS_doingStuff)exitWith{hint "Please wait 10 seconds before doing this again"};
DS_doingStuff = true;

_currentLevel = _house getVariable ["storage",0];
_infoArray = [typeOf _house] call DS_civ_houseInfo;
_super = if(DS_item_houseItemUpgrade > 0)then{true}else{false};

if(_super)then {
	if(_currentLevel > (_infoArray select 1))then {
		_exit = true;
	};
};

if((_super)&&(_exit))exitWith{hint "This house can not be upgraded any further";DS_doingStuff = false;};
if((_currentLevel >= (_infoArray select 1))&&(DS_item_houseItemUpgrade < 1))exitWith{hint "This house already has its maximum amount of storage space";closeDialog 0;DS_doingStuff = false;};
if(_super)then{_currentLevel = (_currentLevel*2);_infoArray set [0,800000];};

_upgradeCost = (round((_infoArray select 0)/4));
if(_upgradeCost > 999999)then{_upgradeCost = 1000000};

_action = [
	format ["Upgrading this property will increase your virtual storage space to %1kg and your weapons storage slots to %2. This upgrade will cost $%3, would you like to continue?",((_currentLevel+2)*250),((_currentLevel+2)*75),[_upgradeCost] call DS_fnc_numberText],
	"Upgrade House",
	"Upgrade",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{DS_doingStuff = false;};

if(DS_item_rockp < 5)exitWith{hint "You need 5 processed cement to upgrade this house";DS_doingStuff = false};
["rockp",false,5] call DS_fnc_handleInventory;

if([_upgradeCost,true] call DS_fnc_checkMoney)exitWith{hint "You do not have enough money in your bank to cover this cost";closeDialog 0;DS_doingStuff = false;};
[_upgradeCost,true,false] call DS_fnc_handleMoney;

if(_super)then{["houseItemUpgrade",false,1] call DS_fnc_handleInventory;};

[_house,_super] remoteExec ["HUNT_fnc_updateHouseUpgrade",2];

hint "Your house has been upgraded!";

sleep 10;
DS_doingStuff = false;