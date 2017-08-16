/*
	File: fn_sessionReceive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Received information from the server and sorts information and
	initializes the player, if no data is found it starts the session
	creation process.
*/

if (isDedicated) exitWith {};
private["_session","_item"];
_session = _this;
_wantedMedic = false;
//diag_log format["CLIENT: %1 :: %2", typeName _session,_session];
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //already initialized, exit to prevent gear loss and strange bugs.
if(life_session_tries > 3) exitWith {cutText["Can't setup your session with the server. You have reached the maximum tries of 3. Please reconnect.","BLACK FADED"];0 cutFadeOut 9999999;};
cutText["Received information from the server...","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling types
if(isNil "_session") exitWith {[] spawn life_fnc_sessionCreate;};
if(typeName _session == "STRING") exitWith {cutText[format["%1",_session],"BLACK FADED"];0 cutFadeOut 9999999;};
if(count _session == 0) exitWith {[] spawn life_fnc_sessionCreate;};
if(_session select 0 == "Error") exitWith {[] spawn life_fnc_sessionCreate;};

/*if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith
{
	[[911,player,format["HIT:%1:%2:VariablesAlreadySet",profileName,getPlayerUID player]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]],"SPY_fnc_notifyAdmins",true,false] spawn BIS_fnc_MP;
	sleep 0.9;
	failMission "";
};*/

/*
	All data passed from the server is a string, you will need to format
	it accordingly when adding additional stuff, if it is a number/scalar
	you will use parseNumber and everything else you need to compile.

	*	SCALAR/NUMBER: parseNumber(_session select index)
	* 	STRING: (_session select index)
	*	ARRAY: (_session select index)
	*	ALL OTHER: call compile format["%1",(_session select index)];
*/
switch (playerSide) do
{
	case west:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_money = _session select 2;
		life_moneyCache = (life_money / 2) + 5;
		life_atmmoney = _session select 3;
		life_atmmoneyCache = (life_atmmoney / 2) + 3;

		["cash","set",life_money] call life_fnc_uC;
		["atm","set",life_atmmoney] call life_fnc_uC;
		life_coplevel = parseNumber (_session select 4);
		life_swatlevel = _session select 16;
		life_precinct = (life_coplevel > 2 && _session select 21);
		life_prestige = _session select 22;
		life_coptalents = _session select 23;
		life_coprole = "";
		if(count (_session select 5) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} forEach (_session select 5);
		};
		
		if (life_swatlevel > 0) then { player setVariable["swatlevel", life_swatlevel, true]; };
		if (life_coplevel > 5) then	{ life_coprole = "all"; life_precinct = true; }
		else
		{
			if (life_precinct) then
			{	
				life_coprole = switch (true) do
				{
					case ((str player) in ["cop_warrant_1","cop_warrant_2","cop_warrant_3","cop_warrant_4","cop_warrant_5"]): { "warrant" };
					case ((str player) in ["cop_drug_1","cop_drug_2","cop_drug_3","cop_drug_4"]): { "drug" };
					case ((str player) in ["cop_medic_1","cop_medic_2","cop_medic_3","cop_medic_4"]): { "medic" };
					case ((str player) in ["cop_detective_1","cop_detective_2","cop_detective_3"]): { "detective" };
					default { "" };
				};
				if (life_coprole == "") then { life_precinct = false; };
			};
		};

		cop_gear = switch (true) do
		{
			case (life_coprole == "detective" || (str player) in ["cop_detective_1","cop_detective_2","cop_detective_3"]): { [] call life_fnc_detectiveGear };
			default { _session select 6 };
		};
		
		life_adminlevel = parseNumber(_session select 7);
		life_blacklisted = ((_session select 8) == 1);
		//if(life_adminlevel > 0) then {[] execVM "core\client\aconfig.sqf";};
		life_donator = parseNumber(_session select 17);
		{
			_item = _x select 0;
			_item = [_item,1] call life_fnc_varHandle;
			[true,_item,_x select 1] call life_fnc_handleInv;
		} forEach (_session select 9);
		player setVariable ["holstered",(_session select 10),true];
		life_thirst = _session select 12;
		life_hunger = _session select 13;
		life_talents = _session select 18;
		life_experience = _session select 19;
		life_drug_level = (_session select 20) select 0;
		life_addiction = (_session select 20) select 1;
		life_wealthPrestige = _session select 24;
		life_achievements = _session select 25;
		life_alive = ((_session select 26) == 1);
		{
			life_statistics set[_forEachIndex, _x];
		} forEach (_session select 27);
		if (_session select 28 != "") then { player setVariable ["life_title", _session select 28, true] };
		[] spawn life_fnc_loadGear;
	};

	case independent:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_money = _session select 2;
		life_moneyCache = (life_money / 2) + 5;
		life_atmmoney = _session select 3;
		life_atmmoneyCache = (life_atmmoney / 2) + 3;

		["cash","set",life_money] call life_fnc_uC;
		["atm","set",life_atmmoney] call life_fnc_uC;

		life_adminlevel = parseNumber(_session select 4);
		life_blacklisted = ((_session select 5) == 1);
		life_donator = parseNumber(_session select 11);

		life_thirst = _session select 7;
		life_hunger = _session select 8;
		life_talents = _session select 12;
		life_experience = _session select 13;
		life_wealthPrestige = _session select 16;
		life_achievements = _session select 17;
		{
			life_statistics set[_forEachIndex, _x];
			if (_forEachIndex == 2) then { player setVariable["season", _x, true]; };
		} forEach (_session select 18);
		if (_session select 19 != "") then { player setVariable ["life_title", _session select 19, true] };
		_wantedMedic = (_session select 20 > 0);
	};

	case civilian:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_money = _session select 2;
		life_moneyCache = (life_money / 2) + 5;
		life_atmmoney = _session select 3;
		life_atmmoneyCache = (life_atmmoney / 2) + 3;
		["cash","set",life_money] call life_fnc_uC;
		["atm","set",life_atmmoney] call life_fnc_uC;
		if(count (_session select 4) > 0) then
		{
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_session select 4);
		};
		life_jail_time = _session select 5;
		life_is_arrested = (life_jail_time > 0);
		life_adminlevel = parseNumber(_session select 6);
		life_donator = parseNumber(_session select 7);
		civ_gear = (_session select 8);
		[] spawn life_fnc_civLoadGear;
		life_coplevel = 0;
		life_house_pos = (_session select 21);
		life_houses = [];
		{
			_h = _x nearestObject "House_F";
			life_houses pushBack _h;
			_h setVariable ["houseId", (_session select 11) select _forEachIndex, true];
			_h setVariable["house_owner",profileName,true];
		} forEach life_house_pos;
		
		player setVariable ["customTexture", _this select 32, true];
		{
			_item = _x select 0;
			_item = [_item,1] call life_fnc_varHandle;
			[true,_item,_x select 1] call life_fnc_handleInv;
		} forEach (_session select 12);

		player setVariable ["holstered",(_session select 13),true];
		life_thirst = _session select 15;
		life_hunger = _session select 16;
		life_alive = ((_session select 10) == 1);
		if ((_session select 9) == "") then { life_worldspace = [0,0,0]; life_badPosition = life_alive; life_alive = false; }
		else
		{
			life_worldspace = call compile format["%1",(_session select 9)];
			//life_worldspace = call compile format["%1",life_worldspace];
			//life_alive = ((_session select 10) == 1);
			life_alive = switch life_worldspace do {
				case [0,0,0]: {false}; //recheck for an exploit previous
				default {life_alive};
			};
		};

		if ((_session select 14) == 100) then { life_alive = false; };
		if (life_alive) then { player setDamage ((_session select 14) / 100); };
		life_gang = _session select 19;
		life_gang_rank = _session select 20;
		life_wealthPrestige = _session select 27;
		life_achievements = _session select 28;
		{
			life_statistics set[_forEachIndex, _x];
		} forEach (_session select 29);
		if (_session select 30 != "") then { player setVariable ["life_title", _session select 30, true] };
		player setVariable ["can_revive", time + (_session select 31), true];
		if ((_session select 33) select 0 > 0) then
		{
			player setVariable ["parole", time + ((_session select 33) select 0), true];
			player setVariable ["paroleViolated", (_session select 33) select 1, true];
		};
		life_wanted = _session select 34;
		life_talents = _session select 22;
		life_experience = _session select 23;
		life_drug_level = (_session select 26) select 0;
		life_addiction = (_session select 26) select 1;
		_session spawn
		{
			sleep 1;
			[((_this select 24) / 100)] spawn life_fnc_setPain;
			_broken = call compile format["%1",(_this select 25)];
			[_broken] spawn life_fnc_brokenLeg;
			sleep 2;
			player setVariable ["customTexture", _this select 32, true];
			[] call life_fnc_equipGear;
		};
	};

	case sideLogic:
	{
		if((getPlayerUID player) != (_session select 0)) exitWith {}; //Data didn't match.
		life_adminlevel = (_session select 2);
		life_paycheck = 0;
	};
};

if (_wantedMedic) exitWith { cutText["You cannot work as a paramedic while wanted by the police as a civilian.","BLACK FADED"];0 cutFadeOut 9999999; };

//life_paycheck = life_paycheck + (life_donator * 25);
//life_battleye_guid = _session select 50;

if((getPlayerUID player) != (_session select 0)) exitWith {[] spawn life_fnc_sessionCreate;}; //Since it didn't match create the session again?
cutText["Received information from server and validated it, you are almost ready.","BLACK FADED"];
0 cutFadeOut 9999999;

[] call life_fnc_equipGear;

/*if (life_battleye_guid == "") then
{
	[[player],"ASY_fnc_getBattlEye",false,false] spawn BIS_fnc_MP;
};*/

life_session_completed = true;

[] spawn life_fnc_sessionUpdate; // Sync server data with new MMO-style structure