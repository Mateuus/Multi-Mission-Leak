/*
	File: fn_spielernotiz.sqf
    Author: PierreAmyf
	
	Description:
	Ein Mediccomputer. Geschrieben von PierreAmyf 
*/private["_mode","_unit","_name"];_mode = [_this,0,0,[0]] call BIS_fnc_param;_name = [_this,1,"",[""]] call BIS_fnc_param;switch (_mode) do {	case 1:	{		["TextMessage",[format["Ein Sanitäter ist auf dem Weg"]]] call bis_fnc_showNotification;		life_saniunterwegs = true;		player setvariable["saniweg",true,true];		player setvariable["saniname",_name,true];	};	case 2: 	{		["TextMessage",[format["Der Sanitäter hat die Fahrt zu dir abgebrochen!"]]] call bis_fnc_showNotification;		life_saniunterwegs = false;		player setvariable["saniweg",false,true];	};};