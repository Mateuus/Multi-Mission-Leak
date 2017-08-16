/*
		fn_funknetz.sqf
		Author: G00golplexian
		
		Description: Hacks the smartphone useability...
*/
private["_handle"];

if(life_funknetzUsed) exitWith {hint "Du kannst das Funknetz noch nicht wieder hacken!"};
if(life_netzhacked && playerside == civilian) exitWith {hint "Das Netz wurde schon ausgeschaltet."};
if(!life_netzhacked && playerside in [west,independent]) exitWith {hint "Hier gibts nichts zu tun!"};
if(!license_civ_hack) exitWith {hint "Du hast keine Hack-Kentnisse, du benötigst erst eine IT-Ausbildung"};
if(life_level < 8 && playerside == civilian) exitWith {hint "Du musst erst Level 8 erreicht haben um das Funknetz hacken zu können!"};
if((west countside playableUnits) < 2 && playerSide == civilian) exitwith {hint "Es müssen 2 oder mehr Polizisten online sein!"};

life_funknetzUsed = true;

_sleep = 0.1;
_cP = 0.01;
_upp = "Funknetz wird gehackt...";

if(playerside == civilian) then {

	//Setup our progress bar.
	_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
	WaitUntil{scriptDone _handle};
	if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
	if(life_process_bad) exitWith {life_process_bad = false};

	life_netzhacked = true;
	[2,"Das Funknetz auf Altis ist zusammengebrochen. Womöglich wurde es gehackt!"] remoteExecCall ["life_fnc_broadcast",0];
} else {
		
	_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
	WaitUntil{scriptDone _handle};
	if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
	if(life_process_bad) exitWith {life_process_bad = false};

	life_netzhacked = false;
	[2,"Das Funknetz auf Altis wurde wiederhergestellt!"] remoteExecCall ["life_fnc_broadcast",0];
};
publicVariable "life_netzhacked";

if(playerside == civilian) then {
	sleep (5 * 60);
	[getPlayerUID player,name player,"41"] remoteExecCall ["SoA_fnc_wantedAdd",2];
	sleep (25 * 60);
	life_funknetzUsed = false;
	life_netzhacked = false;
	[2,"Das Funknetz auf Altis wurde wiederhergestellt!"] remoteExecCall ["life_fnc_broadcast",0]
};
publicVariable "life_netzhacked";
