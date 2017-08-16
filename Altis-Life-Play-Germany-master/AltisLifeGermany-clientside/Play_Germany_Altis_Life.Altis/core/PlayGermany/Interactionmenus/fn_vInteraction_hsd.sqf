/*

	Show vehicle interaction menu

*/
private["_display","_curTarget","_bRepair","_bTowing","_bTowingP","_bTowingP1"];
if(!dialog) then {
	createDialog "d_vInteraction_hsd";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_bRepair = _display displayCtrl 2401;
_bTowing = _display displayCtrl 2404; // Towing
_bTowingP1 = _display displayCtrl 1204; // Towing Aktiviert
_bTowingP = _display displayCtrl 1205; // Towing Deaktiviert
_bBoat = _display displayCtrl 2407;
_bBoatP = _display displayCtrl 1207;

life_vInact_curTarget = _curTarget;

//Set Repair Action
if("ToolKit" in (items player)) then {
	_bRepair ctrlEnable true;
} else {
	_bRepair ctrlEnable false;
};

if((_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship")) then {
	if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
		_bTowing ctrlShow true;
		_bTowingP ctrlShow true;
		_bTowingP1 ctrlShow false;
		_bTowing ctrlSetTooltip localize "STR_TOW_OFF";
		_bTowing buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
	} else {
		_bTowing ctrlShow true;
		_bTowingP ctrlShow false;
		_bTowingP1 ctrlShow true;
		_bTowing ctrlSetTooltip localize "STR_TOW_ON";
		_bTowing buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
	};
} else {
	_bTowing ctrlShow false;
	_bTowingP ctrlShow false;
	_bTowingP1 ctrlShow false;
};

if(!(life_hsd in ["alac","thw"])) then {
	{
		_ctrl = _display displayCtrl _x;
		_ctrl ctrlEnable false;
		_ctrl ctrlShow false;
	} foreach [1206,2406];
};

if(!(_curTarget isKindOf "Ship")) then {
	_bBoat ctrlShow false;
	_bBoat ctrlEnable false;
	_bBoatP ctrlShow false;
	_bBoatP ctrlEnable false;
};