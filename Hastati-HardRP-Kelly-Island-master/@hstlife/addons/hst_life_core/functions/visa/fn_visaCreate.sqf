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
disableSerialization;



_target = _this select 0;
if(!alive player || !dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
_display = findDisplay DISPLAY;
_nameInput = _display displayCtrl NAME_INPUT;
_surnameInput = _display displayCtrl SURNAME_INPUT;
_fatherInput = _display displayCtrl FATHER_INPUT;
_motherInput = _display displayCtrl MOTHER_INPUT;
_motherSurnameInput = _display displayCtrl MOTHER_SURNAME_INPUT;
_peselInput = _display displayCtrl PESEL_INPUT;
_birthInput = _display displayCtrl BIRTH_INPUT;
_uid = "";


_name = ctrlText _nameInput;
_surname = ctrlText _surnameInput;
_father = ctrlText _fatherInput;
_mother = ctrlText _motherInput;
_motherSurname = ctrlText _motherSurnameInput;
_pesel = ctrlText _peselInput;
_birth = ctrlText _birthInput;

_day = parseNumber(_birth select [0,2]);
_month = parseNumber(_birth select [3,2]);
_year = parseNumber(_birth select [6,2]);

if(_day == 0 || _month == 0 || _year == 0) exitWith {hint "Podales zla date";};
if(_day > 31 || _month > 12) exitWith {hint "Do you even date, Kappa?";};
if(_day < 0 || _month < 0 || _year < 0) exitWith {hint "Are you fucking kidding me?";};

if(FETCH_CONST(life_adminlevel) != 0) then {
	[_name, _surname, _father, _mother, _motherSurname, [_day, _month, _year], "-1", 0, 1, player] remoteExec ["TON_fnc_visaInsert" , 2];
} else {
	if(_pesel == "-1") exitWith {hint "Are you fucking kiddin' me?"};
	[_name, _surname, _father, _mother, _motherSurname, [_day, _month, _year], _pesel, 0, 0, player] remoteExec ["TON_fnc_visaInsert" , 2];
};
closeDialog 0;
