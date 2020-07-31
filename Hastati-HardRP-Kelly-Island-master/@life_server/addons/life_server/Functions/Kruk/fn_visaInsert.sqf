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

_name = _this select 0;
_surname = _this select 1;
_father = _this select 2;
_mother = _this select 3;
_motherSurname = _this select 4;
_birth = _this select 5;
_pesel = _this select 6;
_drivingPoints = _this select 7;
_type = _this select 8;
_player = _this select 9;
if(count _this != 10) exitWith {diag_log "Za malo podanych wartosci";};
_day = _birth select 0;
_month = _birth select 1;
_year = _birth select 2;
if(_day < 10) then {_day = "0" + str(_day);} else {_day = str _day;};
if(_month < 10) then {_month = "0" + str(_month);} else {_month = str _month;};
if(_year < 10) then {_year = "0" + str(_year);} else {_year = str _year;};
_birthDate = format["%1.%2.19%3",_day,_month,_year];

if(_pesel == "-1") then { _pesel = format["%1%2%3%4%5%6%7", _year, _month, _day, (selectRandom [1,3,5,7,9]), (((_birth select 0) + (_birth select 1) + (_birth select 2)) % 8), ([7,6,5,6] select (((_birth select 0) + (_birth select 1) + (_birth select 2)) % 4)), ((floor(random 10) + 1) * 9)]; };


_query = format ["INSERT INTO playerIDs (uid, name, surname, gender, birthDate, fatherName, motherName, motherSurname, pesel, drivingPoints, idType) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9', '%10', '%11')", (getPlayerUID _player), _name, _surname, "m", _birthDate, _father, _mother, _motherSurname, _pesel, _drivingPoints, _type];
[_query, 1] call DB_fnc_asyncCall;
[_player] spawn TON_fnc_visaGet;

diag_log "------------------- TON_fnc_visaInsert";
diag_log str _query;