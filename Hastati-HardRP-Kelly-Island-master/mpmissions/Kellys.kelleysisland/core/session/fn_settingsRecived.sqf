#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
private["_array"];
_array = _this select 0;
_settings = _array select 1;
player SVAR ["playerDBid", (_array select 0), true];
hst_life_phone_activeCard = _settings select 1;