#include <macro.h>
private["_packet","_array","_flag","_civPosition"];
_civPosition = getPos player;
_packet = [steamid,(player GVAR["realname",name player]),playerSide,argent_liquide,compte_banque];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"adac"};};
{
	_varName = LICENSE_VARNAME(configName _x,_flag);
	_array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "Licenses"));

_packet pushBack _array;
[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet pushBack _civPosition;
		_packet pushBack life_is_alive;
	};
};
[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;