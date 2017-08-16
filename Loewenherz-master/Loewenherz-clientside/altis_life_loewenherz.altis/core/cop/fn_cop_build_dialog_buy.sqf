/*
Filename: fn_cop_build_dialog_buy.sqf

Author: Barney

Description: No Description for u!

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private ["_info","_display","_LB_Objects","_was","_txtTmp","_obj"];
_info = nearestObjects[player,["O_Truck_02_Ammo_F"],100];
disableSerialization;
if(count(_info) == 0) exitWith {hint "Der Vorratstruck muss in der Nähe sein um dieses Objekt zu spawnen";titleText["Der Vorratstruck muss in der Nähe sein um dieses Objekt zu spawnen","PLAIN"];};
if(speed(_info select 0) > 0) exitWith {hint "Der Vorratstruck muss still stehen!";titleText["Der Vorratstruck muss still stehen!","PLAIN"];};
_display 	 = findDisplay 2222;
//Listboxes
_LB_Objects 	 = _display displayCtrl 2302;

if(lbcursel _LB_Objects == -1) exitWith {hint "Du hast Nichts ausgewählt!";};

_was = _LB_Objects lbdata (lbCurSel _LB_Objects);
if(_was == "") exitWith {hint "Fehler 2";};
closeDialog 0;


{
	_txtTmp = format ["Platziere Objekt '%1' in %2 Sekunde(n)", (getText(configFile >> "CfgVehicles" >> _was >> "displayName")),_x];

 	[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

	sleep 1;

} foreach [5,4,3,2,1];


_obj = _was createVehicle ((_info select 0) modelToWorld [0,-15,-3]);
_obj setVariable["LHM_COP_BUILD",true,true];



_txtTmp = format ["Das Objekt '%1' wurde platziert", (getText(configFile >> "CfgVehicles" >> _was >> "displayName"))];

 [_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;






