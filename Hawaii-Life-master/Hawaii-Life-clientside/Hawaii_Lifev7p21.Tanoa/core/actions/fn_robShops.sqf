#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;

if(side _robber != civilian) exitWith { hint "Du kannst das als Beamter nicht tun !" };
if(_robber distance _shop > 5) exitWith { hint "Du darfst maximal 5 Meter entfernt sein !" };

_kassa = 1000;
if (life_action_inUse) exitWith { hint "Du raubst die Tankstelle bereits aus !" };
if (vehicle player != _robber) exitWith { hint "Steig aus deinem Fahrzeug aus !" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber isEqualTo "") exitWith { hint "Haha, du hast nicht mal eine Waffe !!" };
if (_kassa isEqualTo 0) exitWith { hint "Die Kasse ist leer" };

_cops = (west countSide playableUnits);
if(_cops < 4) exitWith{hint "Es sind nicht genug Polizisten online !";};

life_action_inUse = true;
_kassa = 10000 + round(random 10000);
_shop removeAction _action;
_chance = random(100);
if(_chance >= 10) then {
	hint "Der Kassierer hat den stillen Alarm ausgeloest, die Cops sind auf dem Weg !";
	[1,"ACHTUNG! - Tankstelle: wird ausgeraubt!"] remoteExecCall ["life_fnc_broadcast",west];
	_Pos = position player;
	_marker = createMarker ["Marker200", _Pos];
	"Marker200" setMarkerColor "ColorRed";
	"Marker200" setMarkerText "!ACHTUNG! überfall !ACHTUNG!";
	"Marker200" setMarkerType "mil_warning";
};


disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(life_action_inUse) then
{
	while{true} do
	{
		sleep 3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Aktiver Raub, lauf nicht weg (10m) (%1%2)...",round(_cP * 100),"%"];			
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 10.5) exitWith { };
		if!(alive _robber) exitWith {};
	};
	if!(alive _robber) exitWith { life_action_inUse = false;if(_chance >= 10) then {deleteMarker "Marker200";};};
	if(_robber distance _shop > 10.5) exitWith {life_action_inUse = false;if(_chance >= 10) then {deleteMarker "Marker200";}; hint "Du hast dich zu weit entfernt!"; 5 cutText ["","PLAIN"];};
	5 cutText ["","PLAIN"];

	titleText[format["Du hast $%1 gestohlen, entfern dich schnell bevor die Polizei erscheint",[_kassa] call life_fnc_numberText],"PLAIN"];
	if(_chance >= 10) then {deleteMarker "Marker200";};
	life_cash = life_cash + _kassa;

	life_action_inUse = false;
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
		if (life_HC_isActive) then {
			[getPlayerUID _robber,name _robber,"212"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
		} else {
			[getPlayerUID _robber,name _robber,"212"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		};
};
sleep 300;
_action = _shop addAction["Ausrauben",life_fnc_robShops];