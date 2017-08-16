#include "..\..\script_macros.hpp"

private["_return", "_Firstnames", "_Surnames"];
_return = "";

_Firstnames = LIFE_SETTINGS(getArray,"uc_name_list");
_Surnames = LIFE_SETTINGS(getArray,"uc_surname_list");

_return = Format[ "%1 %2", _Firstnames call BIS_fnc_selectRandom, _Surnames call BIS_fnc_selectRandom ];

_return;
