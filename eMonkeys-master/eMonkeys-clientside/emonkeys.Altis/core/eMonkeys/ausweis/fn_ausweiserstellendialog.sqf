/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
closeDialog 0;

if(!(count eM_ausweis == 0)) exitWith {};

if(isNil "eM_ausweis") exitWith {};

if(!EMonkeys_PlayerInTutorial && EMonkeys_c164 < 20000) exitWith {hint "Du hast keine 20000€ bei."};

if(!(createDialog "EMonkeys_ausweiser")) exitWith {hint "Es gab ein Problem beim öffnen des Menüs"};
disableSerialization;

_pictureCfg = getArray(missionConfigFile >> "cfgAusweis" >> "ausweis_bild");
_cityCfg = getArray(missionConfigFile >> "cfgAusweis" >> "ausweis_stadt");

if (EMonkeys_PlayerInTutorial) then {
	(findDisplay 26500) displaySetEventHandler ["keyDown","_this call EMonkeys_fnc_displayHandler"];
	_close = (findDisplay 26500) displayCtrl 2401;
	_button = (findDisplay 26500) displayCtrl 2201;
	_button ctrlShow false;
	_close ctrlEnable false;
};

_Dgesch = (findDisplay 26500) displayCtrl 1502;
_Dpass = (findDisplay 26500) displayCtrl 1501;
_Dstadt = (findDisplay 26500) displayCtrl 1500;

lbClear _Dgesch;
lbClear _Dpass;
lbClear _Dstadt;


_Dgesch lbAdd "Männlich";
_Dgesch lbAdd "Weiblich";


{
	_Dpass lbAdd _x;	
}foreach _pictureCfg;

{
	_Dstadt lbAdd _x;	
}foreach _cityCfg;




