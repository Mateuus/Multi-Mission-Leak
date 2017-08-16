// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _curTarget = param[0, objNull, [objNull]];

if( _curTarget isEqualTo objNull ) exitWith {};

if( !(_curTarget isKindOf "LandVehicle") && !(_curTarget isKindOf "Ship") && !(_curTarget isKindOf "Air") ) exitWith {};

disableSerialization;

createDialog "XY_dialog_interaction";

XY_currentInteraction = _curTarget;

_display = findDisplay 37400;

_buttons = [];
_buttons pushBack (_display displayCtrl 37450);
_buttons pushBack (_display displayCtrl 37451);
_buttons pushBack (_display displayCtrl 37452);
_buttons pushBack (_display displayCtrl 37453);
_buttons pushBack (_display displayCtrl 37454);
_buttons pushBack (_display displayCtrl 37455);
_buttons pushBack (_display displayCtrl 37456);
_buttons pushBack (_display displayCtrl 37457);
_buttons pushBack (_display displayCtrl 37458);
_buttons pushBack (_display displayCtrl 37459);

( _display displayCtrl 37401 ) ctrlSetText ([getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")] call KRON_StrUpper);

{
    _x ctrlEnable false;
    _x ctrlSetText "";
} forEach _buttons;

(_buttons select 0) ctrlSetText "Reparieren";
(_buttons select 0) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_repairTruck;";
(_buttons select 0) ctrlEnable ("ToolKit" in (items player));

(_buttons select 1) ctrlSetText "Schieben";
(_buttons select 1) buttonSetAction "closeDialog 0; [] spawn XY_fnc_pushObject;";
(_buttons select 1) ctrlEnable (_curTarget isKindOf "Ship" && { local _curTarget } && { (crew _curTarget) isEqualTo [] });

(_buttons select 2) ctrlSetText "Einsteigen";
(_buttons select 2) buttonSetAction "closeDialog 0; player moveInDriver XY_currentInteraction;";
(_buttons select 2) ctrlEnable ( !(([configfile >> "CfgVehicles" >> typeOf (_curTarget), "DLC", ""]  call BIS_fnc_returnConfigEntry) isEqualTo "") && { (crew _curTarget) isEqualTo [] } && { canMove _curTarget } && { locked _curTarget == 0 });

if( playerSide isEqualTo west ) exitWith {

    (_buttons select 3) ctrlSetText "Halterabfrage";
    (_buttons select 3) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_searchVehAction;";
    (_buttons select 3) ctrlEnable true;

    (_buttons select 4) ctrlSetText "Fahrzeug durchsuchen";
    (_buttons select 4) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_vehInvSearch;";
    (_buttons select 4) ctrlEnable true;

    (_buttons select 5) ctrlSetText "Insassen herausziehen";
    (_buttons select 5) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_pulloutAction;";
    (_buttons select 5) ctrlEnable ( !((crew _curTarget) isEqualTo []) && speed _curTarget < 4 );

    (_buttons select 6) ctrlSetText "Beschlagnahmen";
    (_buttons select 6) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_impoundAction;";
    (_buttons select 6) ctrlEnable true;

    (_buttons select 7) ctrlSetText "Zerstören";
    (_buttons select 7) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_destroyAction;";
    (_buttons select 7) ctrlEnable (XY_copLevel >= 9);
};

if( playerSide isEqualTo civilian ) exitWith {

    (_buttons select 3) ctrlSetText "Insassen herausziehen";
    (_buttons select 3) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_pulloutAction;";
    (_buttons select 3) ctrlEnable ( !((crew _curTarget) isEqualTo []) && speed _curTarget < 4 );

    (_buttons select 4) ctrlSetText "Automatisch farmen";
    (_buttons select 4) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_deviceMine;";
    (_buttons select 4) ctrlEnable ( (typeOf _curTarget) in ["O_Truck_03_device_F", "B_Truck_01_covered_F"] && { (_curTarget getVariable ["lockedUntil", 0]) < servertime } );

    (_buttons select 5) ctrlSetText "Automatisch verarbeiten";
    (_buttons select 5) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_deviceProcess;";
    (_buttons select 5) ctrlEnable ( (typeOf _curTarget) in ["O_Truck_03_device_F", "B_Truck_01_covered_F"] && { (_curTarget getVariable ["lockedUntil", 0]) < servertime } );

    (_buttons select 6) ctrlSetText "Versichern";
    (_buttons select 6) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_insureVehicle;";
    (_buttons select 6) ctrlEnable !(_curTarget getVariable ["insured", false]);
    /*
    (_buttons select 7) ctrlSetText "Auf Wanzen untersuchen";
    (_buttons select 7) ctrlEnable !(_curTarget getVariable ["insured", false]);
    (_buttons select 7) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_insureVehicle;";
    */
};

if( playerSide isEqualTo independent ) exitWith {

    (_buttons select 4) ctrlSetText "Fahrzeug aufrichten";
    (_buttons select 4) buttonSetAction "closeDialog 0; XY_currentInteraction allowDamage false; XY_currentInteraction setPos [getPos XY_currentInteraction select 0, getPos XY_currentInteraction select 1, (getPos XY_currentInteraction select 2) + 1]; XY_currentInteraction setVectorUp (surfaceNormal (getPos XY_currentInteraction)); XY_currentInteraction allowDamage true;";
    (_buttons select 4) ctrlEnable ( playerSide == independent && { (east countSide playableUnits) < 1 } ); // no thw = Flip for Medics
};

if( playerSide isEqualTo east ) exitWith {

    (_buttons select 3) ctrlSetText "Halterabfrage";
    (_buttons select 3) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_searchVehAction;";
    (_buttons select 3) ctrlEnable true;

    (_buttons select 4) ctrlSetText "Fahrzeug aufrichten";
    (_buttons select 4) buttonSetAction "closeDialog 0; XY_currentInteraction allowDamage false; XY_currentInteraction setPos [getPos XY_currentInteraction select 0, getPos XY_currentInteraction select 1, (getPos XY_currentInteraction select 2) + 1]; XY_currentInteraction setVectorUp (surfaceNormal (getPos XY_currentInteraction)); XY_currentInteraction allowDamage true;";
    (_buttons select 4) ctrlEnable ( (crew _curTarget) isEqualTo [] );

    (_buttons select 5) ctrlSetText "Beschlagnahmen";
    (_buttons select 5) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_impoundAction;";
    (_buttons select 5) ctrlEnable true;

    (_buttons select 6) ctrlSetText "Umlackieren";
    (_buttons select 6) buttonSetAction "closeDialog 0; [] spawn XY_fnc_repaintMenu;";
    (_buttons select 6) ctrlEnable true;

    (_buttons select 7) ctrlSetText "Dauerhaft einziehen";
    (_buttons select 7) buttonSetAction "closeDialog 0; [XY_currentInteraction] spawn XY_fnc_lockdownVehicle;";
    (_buttons select 7) ctrlEnable true;
};


