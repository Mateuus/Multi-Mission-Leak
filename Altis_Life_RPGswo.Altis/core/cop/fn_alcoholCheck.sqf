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

hint "Nun einmal fest pusten bis ich stopp sage!";
_cop spawn
{
	sleep 3;
	hint "OK Stop! Nun warten wir mal kurz auf das Ergebniss";
	
	_return = if(isNil "DWEV_var_alcoholLevel") then {"0,00 ‰<br/>"} else {format ["%1 ‰<br/>",DWEV_var_alcoholLevel]};

	[getMyName,_return] remoteExec ["DWEV_fnc_alcoholRead",_this];
	
};



