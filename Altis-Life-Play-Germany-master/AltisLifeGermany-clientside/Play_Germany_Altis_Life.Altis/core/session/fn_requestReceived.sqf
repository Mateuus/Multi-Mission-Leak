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
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(typeName _this,"STRING")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(count _this,0)) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(EQUAL(SEL(_this,0),"Error")) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(!(EQUAL(steamid,SEL(_this,0)))) exitWith {[] call SOCK_fnc_dataQuery;};
//diag_log "Request Recieved:";
//{if (!isNil "_x") then {diag_log _x;};} foreach _this;
//diag_log "------------";

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donatorlevel")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[SPY,["VariablesAlreadySet"],profileName,steamid],"TON_fnc_logIt",false,false] call life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donatorlevel: %3",life_adminlevel,life_coplevel,life_donatorlevel]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	sleep 0.9;
	failMission "SpyGlass";
};

//Parse basic player information.
if (parseNumber (SEL(_this,3)) >= 0) then {CASH = parseNumber (SEL(_this,3));}; // only overwrite it when a valid value is stored in database
if (parseNumber (SEL(_this,4)) >= 0) then {BANK = parseNumber (SEL(_this,4));}; // only overwrite it when a valid value is stored in database
CONST(life_adminlevel,parseNumber (SEL(_this,5)));
CONST(life_donatorlevel,parseNumber (SEL(_this,6)));

// Update aliases
_aliases = (_this select 2);
if (!(profileName in _aliases)) then {
    _aliases pushBack profileName;
	[9, _aliases] call SOCK_fnc_updatePartial;
};

//Loop through licenses
if(count (SEL(_this,7)) > 0) then {
	{
		if (SEL(_x,0) == "license_civ_donator") then {
			if (FETCH_CONST(life_donatorlevel) > 0) then {
				SVAR_MNS [SEL(_x,0),true];
			} else {
				SVAR_MNS [SEL(_x,0),false];
			};
		} else {
			SVAR_MNS [SEL(_x,0),SEL(_x,1)];
		};
	} foreach (SEL(_this,7));
};

life_gear = SEL(_this,9);
[true] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONST(life_coplevel, parseNumber(SEL(_this,8)));
		CONST(life_medicLevel,0);
        CONST(life_asflevel,0);
        CONST(life_alacLevel, 0);
        CONST(life_eventLevel, 0);
        CONST(life_thwLevel, 0);
		life_blacklisted = SEL(_this,10);
		PG_unblock = SEL(_this,11);

        // mobile provider
        player setVariable["mobile_provider", "SatPhone", true];
	};

	case civilian: {
		if ((SEL(_this,8)) == "1") then {
			life_is_arrested = true;
		};
		if ((SEL(_this,11)) == "1") then {
			PG_unblock = true;
		};
		CONST(life_coplevel, 0);
		CONST(life_medicLevel, 0);
        CONST(life_asflevel,0);
        CONST(life_alacLevel, 0);
        CONST(life_eventLevel, 0);
        CONST(life_thwLevel, 0);
		life_houses = SEL(_this,12);
		{
			_house = nearestBuilding (call compile format["%1", SEL(_x,0)]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = SEL(_this,13);
		if(!(EQUAL(count life_gangData,0))) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;

		private["_mobileProvider"];
		_mobileProvider = _this select 10;
		if (_mobileProvider == "") then { _mobileProvider = "Siffy"; };

        // mobile provider
        player setVariable["mobile_provider", _mobileProvider, true];
	};

	case independent: {
		CONST(life_medicLevel, parseNumber(SEL(_this,8)));
		CONST(life_alacLevel, parseNumber(SEL(_this,10)));
		CONST(life_thwLevel, parseNumber(SEL(_this,11)));
		CONST(life_eventLevel, parseNumber(SEL(_this,12)));
		CONST(life_coplevel, 0);
        CONST(life_asflevel, 0);
		PG_unblock = SEL(_this,13);

        // mobile provider
        player setVariable["mobile_provider", "SatPhone", true];
	};

    case east: {
        CONST(life_asflevel, parseNumber(SEL(_this,8)));
        CONST(life_coplevel, 0);
        CONST(life_medicLevel, 0);
        CONST(life_alacLevel, 0);
        CONST(life_eventLevel, 0);
        CONST(life_thwLevel, 0);
		PG_unblock = SEL(_this,11);

        // mobile provider
        //player setVariable["mobile_provider", _this select 9, true];
		player setVariable["mobile_provider", "SatPhone", true];
    };
};


if(count (SEL(_this,14)) > 0) then {
	{life_vehicles pushBack _x;} foreach (SEL(_this,14));
};

life_session_completed = true;