#include <macro.h>

#define SPY "spy_log"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
{if(!isNil "_x")then{diag_log format ["::::: REQUEST RECEIVED: _this select %1 = %2", _forEachIndex, _x];};}forEach _this; //DEBUG

if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	sleep 0.9;
	failMission "SpyGlass";
};

//Parse basic player information.
CASH = parseNumber (SEL(_this,2));
BANK = parseNumber (SEL(_this,3));
CONST(life_adminlevel,parseNumber (SEL(_this,4)));
CONST(life_donator,0);

//Loop through licenses
if(count (SEL(_this,6)) > 0) then {
	{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,6));
};

life_gear = SEL(_this,8);

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(life_coplevel, parseNumber(SEL(_this,7)));
		CONST(life_medicLevel,0);
		life_blacklisted = SEL(_this,9);
	};

	case civilian: {
		life_is_arrested = SEL(_this,7);
		CONST(life_coplevel, 0);
		CONST(life_medicLevel, 0);
		LEVEL = parseNumber (SEL(_this,9));
		EXP = parseNumber (SEL(_this,10));
		SKILLPOINT = parseNumber (SEL(_this,12));
		if(count (SEL(_this,11)) > 0) then {
			{SVAR_MNS [SEL(_x,0),SEL(_x,1)];} foreach (SEL(_this,11));
		};
		/*
		life_houses = SEL(_this,13);
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		[] spawn life_fnc_initHouses;
		*/
	};

	case independent: {
		CONST(life_medicLevel, parseNumber(SEL(_this,7)));
		CONST(life_coplevel,0);
	};
};

if(count (SEL(_this,13)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,13));
};

[] call life_fnc_loadGear;

life_session_completed = true;
