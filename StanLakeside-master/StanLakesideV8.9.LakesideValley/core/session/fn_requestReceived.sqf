#include <macro.h>
/*
	File: fn_requestReceived.sqf
	
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

[format[localize "STR_Session_Received",_uid],false] spawn domsg;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this isEqualTo "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this isEqualTo 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) isEqualTo "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};
//Parse basic player information.
cash_in_hand = parseNumber (_this select 2); 
player setVariable["cash",cash_in_hand,true];
cash_in_bank = parseNumber (_this select 3); 
player setVariable["bank",cash_in_bank,true];
__CONST__(life_adminlevel,parseNumber(_this select 4));
life_karma = (_this select 5);

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

if(license_civ_driver) then {
	driver_test = true;
};

life_gear = _this select 8; 
player setVariable["gear",life_gear,true];
_handle = [] spawn life_fnc_loadGear;
//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
	};

	case east: {
		life_is_arrested = _this select 7;
		life_arrestMinutes = _this select 9;
		life_arrestReason = _this select 10;
		streamSaftey = _this select 11;
		
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		life_houses = _this select 12;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _This select 13;
		if(count life_gangData != 0) then {
			[] call life_fnc_initGang;
		};
		[] call life_fnc_initHouses;
	};

	
	case civilian: {
		life_is_arrested = _this select 7;
		life_arrestMinutes = _this select 9;
		life_arrestReason = _this select 10;
		streamSaftey = _this select 11;
		
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		life_houses = _this select 12;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _This select 13;
		if(count life_gangData != 0) then {
			[] call life_fnc_initGang;
		};
		[] call life_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
	};
};

_completeCheck = {
    _handle = (_this select 0) select 0;
	if(scriptDone _handle) exitWith {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
		life_session_completed = true;
	};
};

[_completeCheck, 1, [_handle] ] call CBA_fnc_addPerFrameHandler;
