#include "..\..\script_macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the players virtual inventory menu
*/
if(!("ItemRadio" in (assignedItems  player))) exitWith {hint parseText "Du brauchst ein <t color='#FF0000'>Handy</t> um dies zu tun!<br/>Das <t color='#FF0000'>Handy</t> kannst du dir beim Hornbach kaufen.";};
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

[] call life_fnc_p_updateMenu;