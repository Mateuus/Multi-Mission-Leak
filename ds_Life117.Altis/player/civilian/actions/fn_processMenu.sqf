/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens processor menu
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_index","_value","_shopArray","_short","_license","_mine"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_dialog = findDisplay 666667;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];
_mine = false;
if(_shop in [49,50,51])then
	{
	_mine = []call DS_civ_myHideout;
	};
if((_shop in [49,50,51])&&(!_mine))exitwith{hint "You need to own this hideout to process here\n\nCreate a gang and capture the area at the flag outside"};

ctrlShow[66653,false];
ctrlShow[778,true];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_civ_processConfig;
_license = [(_shopArray select 3)] call DS_fnc_checkLicense;

if(_license isEqualTo "")then
	{
	DS_className = [(position player)];
	DS_className pushBack (_shopArray select 0);
	_btn2 ctrlEnable true;
	_btn2 ctrlSetText "      Process";
	_btn2 buttonSetAction "[] spawn DS_civ_process;";
	}
	else
	{
	_btn2 ctrlEnable false;
	_btn2 ctrlSetText "No License";
	};

lbClear _vehicleList;

_img = _shopArray select 0;
_img = format ["extras\icons\%1.jpg",_img];
_vehicleList lbAdd format ["%1",(_shopArray select 1)];
_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, (_shopArray select 2)];
_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
_vehicleList lbSetData [(lbSize _vehicleList)-1,_shopArray select 0];


