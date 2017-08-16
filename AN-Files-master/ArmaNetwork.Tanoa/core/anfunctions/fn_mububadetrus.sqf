/*
			file: fn_robShops.sqf
			Author: MrKraken
			Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
			Description:
			Executes the rob shob action!
			Idea developed by PEpwnzya v2.0

*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_fightback","_pos"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]];
_action = param [2];
_fightBack = round(random 10) + 1;
if!(alive _robber) exitWith {};

if(_fightBack isEqualTo 2) exitWith {
	//5 cutText ["","PLAIN"];
	//[1,format["%1 tried to rob the %2 gas station and was restrained by the shopkeeper",name player, _shop]] remoteExecCall ["life_fnc_brusathusek",west];
	[format["I have detained the robber of my shop at %2, Get here quickly! %1 is a tough fucker to keep down",name player,_shop],"Shop Keeper",1] remoteExecCall ["life_fnc_nuphecast",west];
	player setVariable["restrained",true,true];
	player setVariable["restrainedtype","cop",true];
	player setVariable["surrender",false,true];
	call life_fnc_failedRobbery;
	[1,format["ALARM! - A silent alarm was triggered at the %1  Gas Station! I have the suspect detained! HELP", _shop]] remoteExecCall ["life_fnc_brusathusek",west];
	hintSilent "The cashier hit the silent alarm, police has been alerted!";
	playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _shop];
};

_rip = true;
_kassa = 5000 + round(random 10000);
if ("robbery" in AN_Skills) then {
	_kassa = _kassa * 1.2;
};
[_shop,_robber,_action,-1] remoteExecCall ["AN_server_shopState",2];

[1,format["ALARM! - A silent alarm was triggered at the %1  Gas Station!", _shop]] remoteExecCall ["life_fnc_brusathusek",west];
hintSilent "The cashier hit the silent alarm, police has been alerted!";
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _shop];

_exp = if("mastermind" in AN_Skills) then {60} else {0};
//Setup our progress bar.
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText "Robbery in Progress, stay close (5m)...";
_progressTime = ((300 - _exp)/(1 / 0.006));
if(_rip) then {
	_pos = position player;
	_marker = createMarker ["Marker200", _pos];
	"Marker200" setMarkerColor "ColorRed";
	"Marker200" setMarkerText "!!!ROBBERY IN PROGRESS!!!";
	"Marker200" setMarkerType "mil_warning";
	for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
		_progress progressSetPosition _i;
		sleep _progressTime;
		if(player distance _shop > 5) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_istazed) exitWith {};
	};
	[false] call life_fnc_tufruxatra;
	if!(alive _robber) exitWith {_rip = false; deleteMarker "Marker200";};
	if(_robber distance _shop > 5) exitWith { hintSilent "You need to stay within 5m to rob the gas station! - Now the register is locked."; _rip = false; deleteMarker "Marker200";};
	if(life_istazed) exitWith {_rip = false; deleteMarker "Marker200";};
	titleText[format["You have stolen $%1, now get away before the cops arrive!",[_kassa] call life_fnc_rupadudejat],"PLAIN"];
	deleteMarker "Marker200";
	[_kassa,0,0] call life_fnc_sewawruk;
	[true,5000] call life_fnc_thagayazapu;
	_rip = false;
	life_use_atm = false;
	[(30 + random(30)),life_fnc_trawaqawaqur,[],false] call life_fnc_phefakefe;
	[1,format["911 - %2 Gas Station was just robbed by %1 for a total of $%3",name _robber, _shop, [_kassa] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",west];
	[0,format["NEWS: %1 Gas Station was just robbed for a total of $%2", _shop, [_kassa] call life_fnc_rupadudejat]] remoteExecCall ["life_fnc_brusathusek",civilian];
};
[_shop,_robber,_action,0] remoteExecCall ["AN_server_shopState",2];
