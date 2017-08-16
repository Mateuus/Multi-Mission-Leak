/*
	File: fn_robShop.sqf
	Author: CooliMC
	
	Description:
	New Rob Shop Script
*/

private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;//Action name

if(!(side _robber in [civilian,east])) exitWith { hint "Beamte sorgen für Sicherheit du Vogel!" };
if ((_shop getVariable ["rip", 0]) > serverTime) exitWith { hint "Diese Tankstelle wurde vor kurzem schon einmal ausgeraubt und ist derzeit geschlossen!" };
if(_robber distance _shop > 5) exitWith { hint "Du bist zu weit weg komm naeher ran!" };
if (vehicle player != _robber) exitWith { hint "Steig erstmal aus bevor du mit mir redest!" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Du bist eine Witzfigur wie Fritzchen! Hau ab!" };
if((west countSide playableUnits) < 6) exitWith{hint "Es müssen mindestens 6 Cops online sein!";};

_shop setVariable ["rip", (serverTime + 300), true];	//Kann alle 300 Sekunden ausgeraubt werden !!!
_kassa = 10000 + round(random 80000);

if(random(100) >= 25) then { hint "Der Kassiere hat es geschafft unbemerkt den Alarm auszuloesen, die Polizei ist schon auf dem Weg!"; [1,format["ALARM! - Tankstelle wird ausgeraubt [X: %2|Y: %3]!", ((getPos _shop) select 0), ((getPos _shop) select 1)]] remoteExec ["tanoarpg_fnc_broadcast", west, false]; };
_shop removeAction _action;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Geld wird eingepackt, bleib nahe dran (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

	_marker = createMarker [format["%1_%2", _shop, time], position player];
	[_marker, { [_this] spawn { sleep 200; deleteMarker (_this select 0); }; }] remoteExec ["BIS_FNC_CALL", 2, false];	//Marker wird nach 200 Sekunden vom Server gelöscht falls Client austimed
	
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!ACHTUNG RAUBÜBERFALL ACHTUNG!";
	_marker setMarkerType "mil_warning";
 
while{true} do
{
	sleep 0.85;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Geld wird eingepackt, bleib nahe dran (10m) (%1%2)...",round(_cP * 100),"%"];
		
	if(_cP >= 1) exitWith {};
	if(_robber distance _shop > 10.5) exitWith { hint "Du warst kurz zu weit weg, der Kassierer ist geflohen!" };
	if (vehicle player != _robber) exitWith { hint "Waehrend du etwas im Fahrzeug geholt hast, ist der Kassierer geflohen!" };
	if!(alive _robber) exitWith {};
};
	
if!(alive _robber) exitWith { _shop addAction["Rob the Gas Station", tanoarpg_fnc_robShops] };

5 cutText ["","PLAIN"];
if (vehicle player != _robber) exitWith { _shop addAction["Rob the Gas Station", tanoarpg_fnc_robShops] };
if(_robber distance _shop > 10.5) exitWith { _shop addAction["Rob the Gas Station", tanoarpg_fnc_robShops] };

titleText[format["Du hast erfolgrech %1$ erbeutet ... Schnell weg bevor die Bullen kommen!", _kassa],"PLAIN"];
life_cash = life_cash + _kassa;

life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[getPlayerUID _robber,name _robber,"211"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];