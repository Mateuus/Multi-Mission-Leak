/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Upgrades a houses storage (Maybe more later on)
*/
private ["_action","_exit","_property","_infoArray","_currentLevel","_action","_super"];
_exit = false;
if(DS_item_houseItemUpgrade > 0)then
	{
	_action = [
	"You have a super house upgrade in your inventory, unless you want to use this at the houses current level then remove it before carrying on",
	"Use Upgrade Item",
	"Use Item",
	"Cancel"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};
	};
if(_exit)exitwith{};

if(DS_doingStuff)exitwith{hint "Please wait 10 seconds before doing this again"};
DS_doingStuff = true;
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_currentLevel = _property getVariable ["storage",0];
_infoArray = [typeOf _property] call DS_civ_houseInfo;
if(DS_item_houseItemUpgrade > 0)then{_super = true}else{_super = false};
if((_currentLevel >= (_infoArray select 1))&&(DS_item_houseItemUpgrade < 1))exitwith{hint "This house already has its maximum amount of storage space";closeDialog 0;DS_doingStuff = false;};
if(_currentLevel >= 8)exitwith{hint "This house already has its maximum amount of storage space";closeDialog 0;DS_doingStuff = false;};
if(_super)then{_currentLevel = (_currentLevel*2);_infoArray set [0,800000];};
_action = [
	format ["Upgrading this property will increase your virtual storage space to %1kg and your weapons storage slots to %2. This upgrade will cost $%3, would you like to continue?",((_currentLevel+2)*500),((_currentLevel+2)*100),[(round((_infoArray select 0)/4))] call DS_fnc_numberText],
	"Upgrade House",
	"upgrade",
	"Cancel"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{DS_doingStuff = false;};
if([(round((_infoArray select 0)/4)),true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to cover this cost";closeDialog 0;DS_doingStuff = false;};
[(round((_infoArray select 0)/4)),true,false] call DS_fnc_handleMoney;
hint "Your house has been upgraded!";
if(_super)then
	{
	["houseItemUpgrade",false,1] call DS_fnc_handleInventory;
	};
[[_property,_super],"HUNT_fnc_updateHouseUpgrade",false,false] spawn BIS_fnc_MP;
sleep 10;
DS_doingStuff = false;







