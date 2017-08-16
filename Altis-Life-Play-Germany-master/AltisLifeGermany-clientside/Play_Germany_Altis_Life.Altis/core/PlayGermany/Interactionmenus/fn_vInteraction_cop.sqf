/*

	Show vehicle interaction menu

*/
private["_display","_curTarget","_bRepair","_bPutToGarage","_bRegister","_bSearch","_bPullOut","_bImpound"];
if(!dialog) then {
	createDialog "d_vInteraction_cop";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_bRepair = _display displayCtrl 2401;
_bPutToGarage = _display displayCtrl 2402;
_bRegister = _display displayCtrl 2403;
_bSearch = _display displayCtrl 2404;
_bPullOut = _display displayCtrl 2405;
_bTowing = _display displayCtrl 2406; // Deaktiviert
_bTowing1 = _display displayCtrl 2407; // Aktiviert
_bTowingP = _display displayCtrl 1209; // Deaktiviert
_bTowingP1 = _display displayCtrl 1208; // Aktiviert
_bImpound = _display displayCtrl 2408;
_bImpoundP = _display displayCtrl 1206;
//_bImpound = _display displayCtrl 2406;
_bTowing1 ctrlShow false;
_bTowingP1 ctrlShow false;

life_vInact_curTarget = _curTarget;

//Set Repair Action
_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};


_bRegister ctrlSetTooltip localize "STR_vInAct_Registration";
_bRegister buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
_bSearch ctrlSetTooltip localize "STR_vInAct_SearchVehicle";
_bSearch buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	
_bPullOut ctrlSetTooltip localize "STR_vInAct_PullOut";
_bPullOut buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_pulloutAction;";
if(count crew _curTarget == 0) then {_bPullOut ctrlEnable false;};
	
//_bImpound ctrlSetTooltip localize "STR_vInAct_Impound";
//_bImpound buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_impoundAction;";
	
//#2
_bPutToGarage ctrlSetTooltip localize "STR_vInAct_Unflip";
_bPutToGarage buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";

if(_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship") then {
	if(!(life_vInact_curTarget getVariable["RopeAttach",false])) then {
		_bTowing ctrlShow true;
		_bTowingP ctrlShow true;
		_bTowing ctrlSetTooltip localize "STR_TOW_OFF";
		_bTowing buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadon; closeDialog 0;";
	} else {
		_bTowing ctrlShow false;
		_bTowingP ctrlShow false;
		_bTowing1 ctrlShow true;
		_bTowingP1 ctrlShow true;
		_bTowing1 ctrlSetTooltip localize "STR_TOW_ON";
		_bTowing1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_slingloadoff; closeDialog 0;";
	};
} else {
	_bTowing ctrlShow false;
	_bTowingP ctrlShow false;
	_bTowingP1 ctrlShow false;
	_bTowing1 ctrlShow false;
};

if (([]call PG_fnc_countMedics) == 0) then {
	_bImpound buttonSetAction "[]spawn life_fnc_impoundAction";
} else {
	_bImpound ctrlShow false;
	_bImpoundP ctrlShow false;
	_bImpound ctrlSetTooltip "Fahrzeug abschleppen";
};
