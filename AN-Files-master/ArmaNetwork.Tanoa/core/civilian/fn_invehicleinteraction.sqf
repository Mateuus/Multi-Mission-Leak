/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_vehicle",objNull,[objNull]]
];
if(isNull _vehicle) exitWith {};
if!(playerSide isEqualTo civilian) exitWith {};
if(dialog) exitWith {};

createDialog "pInteraction_Menu";
disableSerialization;
_display = findDisplay 37400;
life_pInact_curTarget = _vehicle;

{
	ctrlShow[_x,false];
} forEach [37450,37451,37452,37453,37454,37455,37456,37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];

switch(true) do {

	case (life_pInact_curTarget isKindOf "Ship"): {
		if(playerSide isEqualTo civilian) then {
			(_display displayCtrl 37450) ctrlSetText "Throw Fishing Net";
			ctrlShow[37450,true];
			buttonSetAction[37450,"closeDialog 0;[] spawn life_fnc_pratrapagesa;"];
		};		
	};	
	case (life_pInact_curTarget isKindOf "Air"): {};	
	case (life_pInact_curTarget isKindOf "LandVehicle"): {};
	default {};
};
