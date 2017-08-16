#include "..\..\macros.hpp"
if(isServer) exitWith {systemChat ""};
////////////// Verhindern das dieses Skript am Headless Client läuft
if ((!hasInterface && !isDedicated)) exitWith {};
/////////////////////////////////////////////////////////

waitUntil {!isnull player && player == player};
waitUntil {!isNil {DWEV_fnc_broadcast}};

if((getPlayerUID player) in [
"76561197999060849", //Sandmann
"76561198134887934", //Markus
"76561198059388180", //Sebbo
"76561198061886893", //Klickklack
"76561198073471461", //Terotex
"76561197972791246", //Shit Happens
"76561198104126473", //Icecube
"76561198089154191", //Firly
"76561198169911690", //Proxery
"76561197985656452" //Muelly
]) exitWith {};

private["_cfg","_patches","_sel","_name","_patches"];
_cfg = configFile >> "CfgPatches";
_patches = [];

for "_i" from 0 to count (_cfg)-1 do
{
	_sel = _cfg select _i;

	if(isClass _sel) then
	{
		_name = configName _sel;
		_patches pushBack _name;
	};
};

[] spawn
{
	waitUntil {sleep 1; !(isNil "dwf_cash")};
	while {true} do
	{
		sleep 10;
		waitUntil {sleep 0.33; dwf_atmcash > 100000000 OR dwf_cash > 29000000};
		["SpyGlass",false,false] call SOCK_fnc_syncHacker;
		[0,player,format ["Spieler %1 hat %2€ Cash und %3€ Bank",getMyName,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		sleep 10;
		[[0,1],format["%1 wurde gebannt, weil er zuviel Geld besitzt.",getMyName]] remoteExec ["DWEV_fnc_broadcast",-2];
		Geldhacker = true;
		publicVariableServer "Geldhacker";
	};
};

// AFK kick script
[] spawn
{
	private ["_new","_old","_kick"];
	_old = getPos player;
	_kick = false;

	waitUntil {sleep 1; (!isnil "DWEV_thirst" && !isNil "DWEV_hunger" && !isNil "DWEV_SERVER_LOCK")};

	while {true} do
	{
		sleep (15*60);
		_new = getPos player;
		if ((_new select 0 == _old select 0) && (_new select 1 == _old select 1)) then
		{
			if (_kick) then
			{
				["SpyGlass",false,false] call DWEV_fnc_syncData;
				sleep 10;
				[player,"Zu lange AFK"] remoteExec ["CLIENT_fnc_kickMe",2];
				format["%1 ist AFK und wurde gekickt.",getMyDName] remoteExec ["systemChat",-2];
			}
			else
			{
				if (DWEV_thirst < 20 || DWEV_hunger < 20 || DWEV_SERVER_LOCK) then  // Nur noch kicken wenn der Spieler kurz vorm verhungern/verdursten ist oder der Server gesperrt ist
				{
					_kick = true;
					hint "Du wirst in 15 Minuten wegen AFK gekickt.";
				};
			};
		}
		else
		{
			_kick = false;
		};
		_old = _new;
	};
};
