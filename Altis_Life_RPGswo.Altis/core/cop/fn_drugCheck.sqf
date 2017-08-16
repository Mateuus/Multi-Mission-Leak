#include "..\..\macros.hpp"
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	modified by Division Wolf e.V. (MarkusSR1984)
	
	Description:
	Returns the Alcohol Level to the cop.
*/
private["_cop","_return"];
_cop = param [0,ObjNull,[ObjNull]];
if(isNull _cop) exitWith {}; //Bad entry

hint "Drogentest wird durchgeführt";
_cop spawn
{
	sleep 3;
	hint "Ergebniss wird berechnet und dem Staatlichen Mitarbeiter angezeigt";
	
	_return = if(isNil "DWEV_var_drugLevel") then {"0,00 ‰<br/>"} else { format ["%1 ‰<br/>",DWEV_var_drugLevel]};
	
	

[getMyName,_return] remoteExec ["DWEV_fnc_drugRead",_this];
	
};



