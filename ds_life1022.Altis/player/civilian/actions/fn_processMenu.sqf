/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens processor menu
*/

private ["_shop","_dialog","_list","_btn2","_shopArray","_mine","_license","_img","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];
_mine = false;
if(_shop in [49,50,51,66])then{_mine = [] call DS_civ_myHideout;};
if((cursorTarget in DS_keyRing)&&(cursorTarget getVariable ["GCU",false]))then{_mine = true;};
if((_shop in [49,50,51,66])&&(!_mine))exitwith{hint "You need to own this hideout to process here\n\nCreate a gang and capture the area at the flag outside"};

ctrlShow [66653,false];
ctrlShow [778,true];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_civ_processConfig;
_license = [(_shopArray select 3)] call DS_fnc_checkLicense;

if(_license isEqualTo "")then {
	DS_className = [(position player)];
	DS_className pushBack (_shopArray select 0);
	_btn2 ctrlEnable true;
	_btn2 ctrlSetText "Process";
	_btn2 buttonSetAction "[] spawn DS_civ_process;";
} else {
	_btn2 ctrlEnable false;
	_btn2 ctrlSetText "No License";
};

lbClear _list;

_img = _shopArray select 0;
_img = format ["extras\icons\%1.jpg",_img];

_index = _list lbAdd format ["%1",(_shopArray select 1)];
_list lbSetTooltip [_index,(_shopArray select 2)];
_list lbSetPicture [_index,_img];
_list lbSetData [_index,(_shopArray select 0)];