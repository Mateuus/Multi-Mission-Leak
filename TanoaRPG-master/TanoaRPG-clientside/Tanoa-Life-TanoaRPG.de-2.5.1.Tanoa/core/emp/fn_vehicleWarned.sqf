/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

if(_vehicle getVariable ["warnedfirst", false]) then
{
	hint "ACHTUNG DEIN FAHRZEUG WURDE VOM EMP INS VISIER GENOMMEN UND WIRD BEI NICHTBEFOLGEN DER ANWEISUNGEN EMP't !!! (WARNUNG 2/2)";
} else {
	hint "ACHTUNG DEIN FAHRZEUG WURDE VOM EMP INS VISIER GENOMMEN UND WIRD BEI NICHTBEFOLGEN DER ANWEISUNGEN EMP't !!! (WARNUNG 1/2)";
};

_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;