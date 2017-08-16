/* 
file: fn_robShops.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v2.0

*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Village"];
_shop = _this select 0;
_robber = _this select 1;
_action = _this select 2;

if !(alive _robber) exitWith {};

_rip = true;
_kassa = 15000 + round(random 10000);
_Village = (text (nearestLocations [(getpos _robber),["NameVillage","NameCity","NameCityCapital"],5000]select 0));

[_shop,_robber,_action,-1] remoteExec ["SOA_fnc_shopState",2];

_chance = random(100);
if(_chance >= 30) then {
	hint parsetext "<t color='#ff1000'>Der Kassierer hat den Alarmknopf gedrückt!</t>";
	[_shop, "bankalarm"] remoteExecCall ["say3D",0];
	[2,format["Alarm! Tankstelle bei %1 wird überfallen!", _Village]] remoteExecCall ["life_fnc_broadcast",west];
};

_marker = createMarker ["robmark", getpos _shop]; 
_marker setMarkerColor "ColorRed";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [100,100];
_marker2 = createMarker ["robmark2", getpos _shop];  
_marker2 setMarkerType "mil_warning"; 
_marker2 setMarkerText "Überfall im Gange!";

if(_rip) then
{
	_upp = "Tankstelle wird ausgeraubt...";
	_sleep = 2;
	_cP = 0.01;

	_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
	WaitUntil{scriptDone _handle};
	if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;_rip = false; deleteMarker _marker; deleteMarker _marker2;};
	if(life_process_bad) exitWith {life_process_bad = false;_rip = false; deleteMarker _marker; deleteMarker _marker2;};

if!(alive _robber) exitWith {_rip = false; deleteMarker _marker; deleteMarker _marker2;};
if(_robber distance _shop > 5) exitWith {
	hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben.";
	_rip = false;
	deleteMarker _marker; 
	deleteMarker _marker2;
};

deleteMarker _marker; 
deleteMarker _marker2;

hint parsetext format["<t align='center'>Du hast <t color ='#ff1000'>%1€</t> erbeutet! <br/>Die Polizei ist auf dem Weg!</t>",[_kassa] call life_fnc_numberText];

life_beatgeld = life_beatgeld + _kassa;
life_exp = life_exp + round(random(1000));
[] spawn life_fnc_exptolevel;

_rip = false;
[0,format["112 - Die Tankstelle in der Nähe von %2 wurde gerade überfallen. Gestohlen wurden ungefähr %3€!",name _robber,_Village,[round(_kassa)] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
[3,format["Tankstellenraub! Eine Tankstelle in der Nähe von %1 wurde gerade ausgeraubt. Der Täter soll %3€ erbeutet haben.",_Village,name _robber,[round(_kassa)] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",civilian];

life_use_atm = false;
sleep (5 * 60); 
life_use_atm = true;

if!(alive _robber) exitWith {};
[getPlayerUID _robber,name _robber,"211A"] remoteExecCall ["SOA_fnc_wantedAdd",2];
};

[_shop,_robber,_action,0] remoteExec ["SOA_fnc_shopState",2];