/*---------------------------------------------------------------------------
	File: fn_requestADAC.sqf
	Auteur: Skrow & Skyfezzer
---------------------------------------------------------------------------*/

private["_adacOnline","_vehicle","_isVehicle"];
if(life_adac_request) exitWith {hint "Tu as déjà appelé un réparateur.";};
if(player getVariable ["adacanfrage",false]) exitWith {hint "Vous devez d'abord payé une facture avant de pouvoir rappeler un dépanneur!";};
_vehicle = cursorTarget;
_isVehicle = if((_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then {true} else {false};
if(_isVehicle && !(_vehicle in life_vehicles)) exitWith {hint localize "STR_ISTR_eigen"};
_adacOnline = {_x != player && {side _x == civilian} && {(_x getVariable ["job", 0]) == 1}} count playableUnits > 0; 
if(!_adacOnline) then {
hint "Il n'y a pas de dépanneur de connecté.";
};
	[[_vehicle,name player],"life_fnc_adacRequest",civilian,FALSE] spawn life_fnc_MP;
	_vehicle setVariable["pName",name player,true];
	_vehicle setVariable ["adac_called",true,true];
	hint "Les dépanneurs ont été appelés.";

player setvariable ["adacanfrage",true,true];

[] spawn {
	life_adac_request = true;
	sleep (3 * 60);
	life_adac_request = false;
};