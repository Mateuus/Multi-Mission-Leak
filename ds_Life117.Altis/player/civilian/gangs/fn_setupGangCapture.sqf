/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the gang capture button and does a few checks
*/
disableSerialization;
private["_shop","_dialog","_hideout","_owners","_myGang","_action","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_myGang = [] call DS_civ_findMyGang;
_shopArray = [];
lbClear _vehicleList;
if(isNil (group player) getVariable "gangName")exitwith{hint "You must be in a gang to capture this hideout"};
_action = true;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

if(player distance gangflag2 < 100)then
	{
	_shopArray = ["Gang Area Two",2];
	};
if(player distance gangflag1 < 100)then
	{
	_shopArray = ["Gang Area One",1];
	};
if(player distance gangflag3 < 100)then
	{
	_shopArray = ["Gang Area Three",3];
	};
DS_className = _shopArray;
lbClear _vehicleList;

_name = _shopArray select 0;
_toolTip = "Capture this area to be able to use its shops and processing facilities";
_vehicleList lbAdd format ["%1",_name];
_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
_vehicleList lbSetData [(lbSize _vehicleList)-1,_name];


