
_nummer = _this select 0;
life_kontakte = _this select 1;

if(isNil "life_kontakte" OR count life_kontakte == 0) then {life_kontakte = []};
if(isnil "_nummer" OR _nummer == "") exitWith {
	_nummer = format["0157%1",[100000,999999] call life_fnc_randomRound];
	[14,_nummer] call SOCK_fnc_updatePartial;
	player setvariable ["phone",_nummer,true];
};

player setvariable ["phone",_nummer,true];