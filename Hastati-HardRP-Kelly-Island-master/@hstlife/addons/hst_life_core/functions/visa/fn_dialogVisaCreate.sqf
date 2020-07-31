#include "\hst_life_core\script_macros.hpp"
/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
#define DISPLAY 61301
#define NAME_INPUT 3001
#define SURNAME_INPUT 3002
#define FATHER_INPUT 3003
#define MOTHER_INPUT 3004
#define MOTHER_SURNAME_INPUT 3005
#define PESEL_INPUT 3006
#define BIRTH_INPUT 3007



_target = _this select 0;
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
if(!(createDialog "hst_life_core_tabletVisa")) exitWith {};
_display = findDisplay DISPLAY;
_nameInput = _display displayCtrl NAME_INPUT;
_surnameInput = _display displayCtrl SURNAME_INPUT;
_fatherInput = _display displayCtrl FATHER_INPUT;
_motherInput = _display displayCtrl MOTHER_INPUT;
_motherSurnameInput = _display displayCtrl MOTHER_SURNAME_INPUT;
_peselInput = _display displayCtrl PESEL_INPUT;
_birthInput = _display displayCtrl BIRTH_INPUT;
_uid = "";
if(FETCH_CONST(life_adminlevel) != 0) then {
	_peselInput ctrlEnable false;
};
