/*
	File: fn_busTravel.sqf
	Author: midgetgrimm
*/
private ["_action","_teleMan"];
if(!alive player) exitWith {hint"Nie żyjesz.. dafuq";};
if (vehicle player != player) exitWith {hint "Wyjdź z pojazdu";};
if(life_cash < 50000) exitWith {hint "Nie masz przy sobie $50,000!!";};

_teleMan = _this select 3;

_action = [
			"Wycieczka do innego miasta chcesz? ?",
			"Podróz Autobusem",
			"Tak",
			"Nie"
		] call BIS_fnc_guiMessage;

if(_action) then {

		life_cash = life_cash - 50000;

		switch (_teleMan) do
		{
			case "Bus_Kavala":
			{
					titleText ["Zasnąłeś w autobusie","BLACK",2];
					uiSleep 2;
					player setPos (getMarkerPos "Respawn_west");
					_handle = [] spawn life_fnc_teleTimer;
					waitUntil {scriptDone _handle};
					player setPos (getMarkerPos "Bus_Kavala");
					disableUserInput false;
					titleText ["Obudziłeś się","BLACK IN"];
			};
			case "Bus_Athira":
			{
					titleText ["Zasnąłeś w autobusie","BLACK",2];
					uiSleep 2;
					player setPos (getMarkerPos "respawn_civilian");
					_handle = [] spawn life_fnc_teleTimer;
					waitUntil {scriptDone _handle};
					player setPos (getMarkerPos "Bus_Athira");
					disableUserInput false;
					titleText ["Obudziłeś się","BLACK IN"];
			};
			case "Bus_Sofia":
			{
					titleText ["Zasnąłeś w autobusie","BLACK",2];
					uiSleep 2;
					player setPos (getMarkerPos "Respawn_west");
					_handle = [] spawn life_fnc_teleTimer;
					waitUntil {scriptDone _handle};
					player setPos (getMarkerPos "Bus_Sofia");
					disableUserInput false;
					titleText ["Obudziłeś się","BLACK IN"];
			};
			case "Bus_Pyrgos":
			{
					titleText ["Zasnąłeś w autobusie","BLACK",2];
					uiSleep 2;
					player setPos (getMarkerPos "respawn_civilian");
					_handle = [] spawn life_fnc_teleTimer;
					waitUntil {scriptDone _handle};
					player setPos (getMarkerPos "Bus_Pyrgos");
					disableUserInput false;
					titleText ["Obudziłeś się","BLACK IN"];
			};
			case "Bus_Paros":
			{
					titleText ["Zasnąłeś w autobusie","BLACK",2];
					uiSleep 2;
					player setPos (getMarkerPos "respawn_civilian");
					_handle = [] spawn life_fnc_teleTimer;
					waitUntil {scriptDone _handle};
					player setPos (getMarkerPos "Bus_Paros");
					disableUserInput false;
					titleText ["Obudziłeś się","BLACK IN"];
			};
		};
} else {
	hint"No i koniec !";
};