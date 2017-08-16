#include "..\..\macros.hpp"
/*
	File: fn_openMarktMenu.sqf
	Author: MarkusSR1984
	
	Description:
	Öffnet der Börsenmenü um Rohstoffpreise abzufragen
*/
if ((side player) == west) exitWith {hint "Keine Auskunft für Polizisten";};
//if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "DWEV_markt_menu";
disableSerialization;

