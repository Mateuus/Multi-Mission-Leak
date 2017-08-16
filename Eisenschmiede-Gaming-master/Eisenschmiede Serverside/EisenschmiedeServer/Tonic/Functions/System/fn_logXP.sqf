#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	Name: Dillon (Itsyuka) Modine-Thuen
	File: fn_logXP.sqf
	Description: Log handler
*/
private["_mode","_message", "_name", "_uid", "_side", "_xpadd","_buyt","_xpnow","_lvlnow","_multi"];
_mode = [_this,0,"",[""]] call BIS_fnc_param;
_message = [_this,1,[],[[]]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;
_uid = [_this,3,"",[""]] call BIS_fnc_param;
_side = [_this,4,"",[""]] call BIS_fnc_param;
_xpadd = [_this,5,0,[0]] call BIS_fnc_param;
_buyt = [_this,6,"",[""]] call BIS_fnc_param;
_xpnow = [_this,7,0,[0]] call BIS_fnc_param;
_lvlnow = [_this,8,0,[0]] call BIS_fnc_param;
_multi = [_this,9,0,[0]] call BIS_fnc_param;

{
	_output = switch(_mode) do {
		case "diag_log": {[0,diag_log _x];};
		case "XPLVL_LOG": {[1,format["1:XPLVL_LOG:XPLVL: Name: %1 || UID: %2 || Ist: %3 er hat %4 XP für %5 bekommen. Sein XP stand ist %6, LVL: %7. Der Multiplikator ist %8",_name,_uid,_side,_xpadd,_buyt,_xpnow,_lvlnow,_multi,_x]];};
		case "VIRTUALSHOP_LOG": {[1,format["1:VIRTUALSHOP_LOG:VIRTUALSHOP: Name: %1 || UID: %2 || Item: %3 || Stück: %4 || für: %5 gekauft",_name,_uid,_side,_xpadd,_buyt,_x]];};
		case "VIRTUALSHOPSELL_LOG": {[1,format["1:VIRTUALSHOPSELL_LOG:VIRTUALSHOPSELL: Name: %1 || UID: %2 || Item: %3 || Stück: %4 || für: %5 verkauft",_name,_uid,_side,_xpadd,_buyt,_x]];};
		default {[1,format["1:%1:extDB: %2",_mode,_x]];};
	};
	if(EQUAL(SEL(_output,0),1)) then {
		"extDB2" callExtension SEL(_output,1);
	};
} forEach _message;