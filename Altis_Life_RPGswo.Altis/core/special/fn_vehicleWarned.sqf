/*
    File: vehicleWarned.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
	edit by Division-wolf.de
*/
private["_vehicle","_tmpEmpWarnCount","_empWarnCount"];
_vehicle = param [0,ObjNull,[ObjNull]];


if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_warned", false])) exitWith {};
_empWarnCount = _vehicle getVariable "was_warned";
_vehicle setVariable["nano_warned",true,true];


if(_vehicle isKindOf "Car") then 
	{
		hint format ["EMP WARNUNG %1 von 2\n\n HALTEN SIE IHR FAHRZEUG AN",_empWarnCount];
		titleText [format ["!!!! SIE WERDEN VON EINEM EMP ANVISIERT !!!!", _vehicle], "PLAIN"];
	};
if(_vehicle isKindOf "Ship") then 
	{
	hint format ["EMP WARNUNG %1 von 2\n\n HALTEN SIE IHR BOOT AN",_empWarnCount];
	titleText [format ["!!!! SIE WERDEN VON EINEM EMP ANVISIERT !!!!", _vehicle], "PLAIN"];
	};
if(_vehicle isKindOf "Air") then 
	{
	hint format ["EMP WARNUNG %1 von 2\n\n LANDEN SIE UNVERZÜGLICH",_empWarnCount];
	titleText [format ["!!!! SIE WERDEN VON EINEM EMP ANVISIERT !!!!", _vehicle], "PLAIN"];
	};


_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle say3D "empwarn";
sleep 3.35;
_vehicle setVariable["nano_warned",false,true];
