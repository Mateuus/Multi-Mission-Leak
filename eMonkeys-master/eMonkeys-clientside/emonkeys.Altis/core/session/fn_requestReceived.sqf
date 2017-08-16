#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
eM_session_tries = eM_session_tries + 1;
if(eM_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(eM_session_tries > 3) exitWith {cutText["Es gab einen Fehler bei der Einrichtung des Klienten","PLAIN"]; 0 cutFadeOut 999999999;};

//Text im Lade Bildschirm
["<t align='center' shadow='1' size='1.2'>Empfange Abfrage vom Server...</t>",(findDisplay 38210) displayCtrl 3400, 1] call EMonkeys_fnc_updateDialogText;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

EMonkeys_create_NewPlayer = false;

//Parse basic player information.
EMonkeys_c164 = parseNumber (_this select 2);
EMonkeys_a164 = parseNumber (_this select 3);
__CONST__(EMonkeys_adminlevel,parseNumber(_this select 4));
EMonkeys_VIP  = parseNumber (_this select 5);

//Loop through licenses
if(count (_this select 6) > 0) then 
{
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

//Parse side specific information.
switch(playerSide) do 
{
	case west: 
	{
		__CONST__(EMonkeys_coplevel,parseNumber(_this select 7));
		cop_gear = _this select 8;
		[] spawn EMonkeys_fnc_loadGear;
		EMonkeys_blacklisted = _this select 9;
		__CONST__(EMonkeys_medicLevel,0);
		player setVariable["EMonkeys_coplevel",EMonkeys_coplevel,true];
		eM_levelsystemarray = _this select 10;
	};
	
	case civilian: 
	{
		eM_is_arrested = _this select 7;
		civ_gear = _this select 8;
		__CONST__(EMonkeys_coplevel,0);
		__CONST__(EMonkeys_medicLevel,0);
		EMonkeys_blacklisted = _this select 11;
		[] spawn EMonkeys_fnc_civLoadGear;
		_player_perms = _this select 9;
		player setVariable ["perms",(call compile format["%1", _player_perms]),true];
		eM_levelsystemarray = _this select 10;
		EMonkeys_fuelstation = _this select 12;
		[] spawn EMonkeys_fnc_initFuelstation;
	};
	
	case east: 
	{
		eM_is_arrested = _this select 7;
		civ_gear = _this select 8;
		__CONST__(EMonkeys_coplevel,0);
		__CONST__(EMonkeys_medicLevel,0);
		EMonkeys_blacklisted = _this select 11;
		[] spawn EMonkeys_fnc_civLoadGear;
		_player_perms = _this select 9;
		player setVariable ["perms",(call compile format["%1", _player_perms]),true];
		eM_levelsystemarray = _this select 10;
		EMonkeys_fuelstation = _this select 12;
		[] spawn EMonkeys_fnc_initFuelstation;
	};
	
	case independent: 
	{
		__CONST__(EMonkeys_medicLevel,parseNumber(_this select 7));
		__CONST__(EMonkeys_copLevel,0);
		EMonkeys_blacklisted = _this select 9;
		eM_levelsystemarray = _this select 8;
	};
};

/*
if(count (_this select 13) > 0) then 
{
	{EMonkeys_vehic164 pushBack _x;} foreach (_this select 13);
};
*/

switch(EMonkeys_VIP) do
{
	case 1: 
	{
		EMonkeys_paycheck = EMonkeys_paycheck + 1000;
	};	
	case 2: 
	{
		EMonkeys_paycheck = EMonkeys_paycheck + 2000;
		EMonkeys_maxWeight = EMonkeys_maxWeight + 26; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
		EMonkeys_maxWeightT = EMonkeys_maxWeightT + 26; //Static variable representing the players max carrying weight on start.
	};
	case 3: 
	{
		EMonkeys_paycheck = EMonkeys_paycheck + 6300;
	};
};
	
eM_session_completed = true;

_text = format ["*** DB REQUEST | Spieler: %1 | Request: %2 |",name player,_this];
[[7,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
