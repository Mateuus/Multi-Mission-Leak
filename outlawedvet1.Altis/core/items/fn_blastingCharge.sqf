#include "..\..\script_macros.hpp"
/*
    File: fn_blastingCharge.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];

if (isNull _vault) exitWith {}; //Bad object
if (typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if (_vault getVariable ["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if (_vault getVariable ["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if (west countSide playableUnits < (LIFE_SETTINGS(getNumber,"minimum_cops"))) exitWith {
     hint format [localize "STR_Civ_NotEnoughCops",(LIFE_SETTINGS(getNumber,"minimum_cops"))]
};
if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

deleteMarker "markerblast"; 


_vault setVariable ["chargeplaced",true,true];
[0,"STR_ISTR_Blast_Placed"] remoteExecCall ["life_fnc_broadcast",west];
hint localize "STR_ISTR_Blast_KeepOff";

_Pos = position player; 
_marker = createMarker ["markerblast", _Pos]; 
"markerblast" setMarkerColor "ColorRed";
"markerblast" setMarkerText "!ATTENTION! TREASURE ROBBERY IN PROGRESS!";
"markerblast" setMarkerType "mil_warning";	
"markerblast" setMarkerSize [2.5, 2.5];


[] remoteExec ["life_fnc_demoChargeTimer",[west,player]];
[] remoteExec ["TON_fnc_handleBlastingCharge",2];
