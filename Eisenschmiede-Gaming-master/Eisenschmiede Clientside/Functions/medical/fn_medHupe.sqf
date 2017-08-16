/*
	File: fn_medHupe.sqf
	Author: Eisenschmiede
*/
private _vehicle = param[0,objNull,[objNull]];

if(Med_HupeAn) exitWith	{ Med_Hupe = false; };
if(isNull _vehicle) exitWith { Med_Hupe = false; };
if(!alive _vehicle) exitWith { Med_Hupe = false; };
if(isNull _vehicle) exitWith { Med_Hupe = false; };

Med_HupeAn = true;
_vehicle say3D "medHupe";
sleep 3.0;

Med_Hupe = false;
Med_HupeAn = false;