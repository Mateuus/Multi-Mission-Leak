/*
	File: fn_isSafeZone.sqf
	Author: MarkusSR1984
	
	Description:
	Prüft ob sich der Spieler an einer Position befinden die das Taxi nicht erreichen kann
*/

_return = false;

if(player distance (getMarkerPos "trigger_kavala_markt_weis") < 70) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Links_Savri_Insel") < 250) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Links_Fournos_Insel") < 200) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Links_Panochori_Bucht") < 100) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_Monisi_Insel") < 150) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_Pyrgy_Insel") < 450) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_bei_Paintball_Insel") < 150) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_Sagonisi_Insel_1") < 200) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_Sagonisi_Insel_2") < 100) exitWith {_return = true; _return;};
if(player distance (getMarkerPos "Sued_spawninsel_NoTaxi") < 700) exitWith {_return = true; _return;};

_return;


// Alter Trigger von oben nach unten
/*

this && (local player) && (vehicle player in thisList)

---------------

player setVariable["NOTAXI",true,true];

---------------

player setVariable["NOTAXI",false,true];

*/