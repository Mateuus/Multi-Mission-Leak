/**
* void houseRequestCommand [COMMANDNAME, HOUSE, ARGUMENTS, (QUERY)]
*
*Sends data to @life-server to process database stuff
**/ 

hint "Frage Datenbank ab ...";

private["_command","_args","_house", "_query"];

_command  = _this select 0;
_house = _this select 1;
_args = _this select 2;



[ [_command, _house, _args, player], "HOUSE_fnc_requestCommand" ,false, false] call EMonkeys_fnc_MP;