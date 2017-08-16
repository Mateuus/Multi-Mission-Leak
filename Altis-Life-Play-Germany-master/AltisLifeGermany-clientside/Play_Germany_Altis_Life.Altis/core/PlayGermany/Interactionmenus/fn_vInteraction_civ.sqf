/*

	Show vehicle interaction menu

*/
private["_display","_curTarget","_bRepair","_bGetIn","_bFlip","_bTowing","_bTowingP","_bTowingP1","_bTowing1"];
if(!dialog) then {
	createDialog "d_vInteraction_civ";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

_display = findDisplay 37400;

_bRepair = _display displayCtrl 2401;
_bGetIn = _display displayCtrl 2403;
_bFlip = _display displayCtrl 2402;
_bFlipP = _display displayCtrl 1201;
_bTowing = _display displayCtrl 2404; // Deaktiviert
_bTowing1 = _display displayCtrl 2405; // Aktiviert
_bTowingP1 = _display displayCtrl 1208; // Aktiviert
_bTowingP = _display displayCtrl 1209; // Deaktiviert
_bDevice = _display displayCtrl 2406; // Deaktiviert
_bDeviceP = _display displayCtrl 1210;
_bLockpickP = _display displayCtrl 1211;
_bBoat = _display displayCtrl 2407;
_bBoatP = _display displayCtrl 1206;
_bPullOut = _display displayCtrl 2408;
_bPullOutP = _display displayCtrl 1212;
_bGetIn ctrlShow false;
_bFlipP ctrlShow true;
_bTowing1 ctrlShow false;
_bTowingP1 ctrlShow false;
_bDeviceP ctrlShow true;
_bBoat ctrlShow false;
_bBoatP ctrlShow false;
_bLockpickP ctrlShow false;
_bPullOutP ctrlShow false;

life_vInact_curTarget = _curTarget;

//Set Repair Action
if("ToolKit" in (items player)) then {_bRepair ctrlEnable true;} else {_bRepair ctrlEnable false;};
_bRepair ctrlSetTooltip localize "STR_vInAct_Repair";
_bRepair buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_repairTruck;";

if((_curTarget in life_vehicles)) then {
	//Acticate flip only, if 
	_bFlip ctrlShow true;
	_bFlip ctrlSetTooltip localize "STR_vInAct_Unflip";
	_bFlip buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
	//workaround for the the garage-bug
	_bGetIn ctrlShow true;
	_bGetIn ctrlEnable true;
	_bGetIn ctrlSetTooltip localize "STR_vInAct_GetIn";
	_bGetIn buttonSetAction "if(player distance life_vInact_curTarget < 10) then {player moveInAny life_vInact_curTarget}; closeDialog 0;";
	//Pullout
	_bPullOutP ctrlShow true;
	_bPullOut ctrlEnable true;
	_bPullOut ctrlSetTooltip localize "STR_vInAct_PullOut";
	_bPullOut buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_pulloutAction;";
} else {
	_bFlip ctrlShow false;
};

_goldCheck = true;
{if(_x select 0 == "goldbar") exitWith {_goldCheck = false;}} forEach ((_curTarget getVariable ["trunk",[]]) select 0); 
if((_curTarget in life_vehicles) && (_curTarget isKindOf "Car" OR _curTarget isKindOf "Ship") && _goldCheck) then {
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



if((typeOf _curTarget == "O_Truck_03_device_F") && {_curTarget in life_vehicles}) then {
	_bDevice ctrlSetTooltip localize "STR_vInAct_DeviceMine";
	_bDevice buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
	
	if(_curTarget in life_vehicles) then {
		_bDevice ctrlEnable true;
		if (!isNil {_curTarget getVariable "mining"}) then {
			if (typeName (_curTarget getVariable ["mining", false]) isEqualTo (typeName player)) then {
				_bDevice ctrlSetText "STOP";
				_bDevice ctrlSetTooltip "Mining Abbrechen";
				_bDevice buttonSetAction "life_vInact_curTarget setVariable [""mining"",false,true]; closeDialog 0;";
			} else {
				_bDevice ctrlEnable false;
				_bDevice ctrlSetText "WAIT";
				_bDevice ctrlSetTooltip "Warte auf Abbruch...";
				_bDevice buttonSetAction "hint ""Das Mining wird schon abgebrochen. Bitte warte kurz.""; closeDialog 0;";
			};
		};
	} else {
		_bDevice ctrlEnable false;
	};
} else {
	_bDevice ctrlShow false;
	_bDevicep ctrlShow false;
};

//Acticate push only, if 
if(((_curTarget in life_vehicles)) && _curTarget isKindOf "Ship") then {
	_bBoatP ctrlShow true;
	_bBoat ctrlShow true;
	_bBoat ctrlSetTooltip "Boot zurückschieben";
	_bBoat buttonSetAction "[life_vInact_curTarget] spawn PG_fnc_pushBoat; closeDialog 0;";
} else {
	_bBoat ctrlShow false;
	_bBoatP ctrlShow false;
};