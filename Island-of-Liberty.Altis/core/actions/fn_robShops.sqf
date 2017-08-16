#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);

if(_cops < 2) exitWith {hint "Du kannst im Moment keinen Laden ausrauben, weil die Polizei nicht online ist!";};
if(side _robber == west) exitWith { hint "Was glaubst du hier zu tun?" };
if(side _robber == independent) exitWith { hint "Was glaubst du hier zu tun?" };
if(_robber distance _shop > 20) exitWith { hint "Du darfst maximal 20 Meter entfernt sein um auszurauben!" };
if (vehicle player != _robber) exitWith { hint "Steig mal aus dem Wagen aus!" };

if (currentWeapon _robber == "") exitWith { hint "Sorry Ich habe keine Angst vor dir Lauf oder ich werde dich erschiessen!Beim Nächsten mal nim dir eine richtige Waffe weil dein Gesicht zu wenig eindruck macht." };

if !(alive _robber) exitWith {};

_kassa = 10000 + round(random 20000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then {[1,format["ALARM! - %1 wird ausgeraubt!", _shop]] remoteExec ["life_fnc_broadcast",west]; };
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du raubst den Laden aus, bleib innerhalb von 5 Metern (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker_%1", _rndmrk];
   _Pos = position player;
   _marker = createMarker [_mrkstring, _Pos];
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!Achtung! >>>>>> Raub im Gange <<<<<< !Achtung!";
   _marker setMarkerType "mil_warning";
[1,"A store is being robbed!"] remoteExec ["life_fnc_broadcast",0]; // General broadcast alert to everyone, uncomment for testing, or if you want it anyway.

while{true} do
{
	uiSleep 2.00;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Du raubst den Laden aus, bleib innerhalb von 5 Metern (%1%2)...",round(_cP * 100),"%"];

	if(_cP >= 1 OR !alive _robber) exitWith {};
	if(_robber distance _shop > 5.1) exitWith { };
	if((_robber getVariable["restrained",false])) exitWith {};
	if(life_istazed) exitWith {} ;
	if(life_interrupted) exitWith {};
};


	if!(alive _robber) exitWith { life_rip = false;call life_fnc_hudUpdate; call life_fnc_liveAnzeige; };
	if(_robber distance _shop > 5.1) exitWith { deleteMarker _marker; hint "Du bist zu weit weg, der Raub ist gescheitert!"; 5 cutText ["","PLAIN"]; life_rip = false; call life_fnc_hudUpdate; call life_fnc_liveAnzeige;};
	if(_robber getVariable "restrained") exitWith { life_rip = false; hint "Du wurdest festgenommen!"; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate; call life_fnc_liveAnzeige;};
	if(life_istazed) exitWith { deleteMarker _marker; life_rip = false; hint "Du wurdest getazert!"; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;  call life_fnc_liveAnzeige;};

   5 cutText ["","PLAIN"];
   titleText[format["Du hast €%1 erbeutet, flieh so schnell du kannst!",[_kassa] call life_fnc_numberText],"PLAIN"];
   deleteMarker _marker;
   ADD(CASH,_kassa);
   [] call life_fnc_hudSetup;
   [] call life_fnc_liveAnzeige;

   _rip = false;
	sleep (30 + random(180)); //Clerk in the store takes between 30-210 seconds before he manage to warn the police about the robbery.
	life_use_atm = true; // Robber can not use the ATM at this point.
	playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
	if!(alive _robber) exitWith {};
[0,format["Polizei News:-Eine Tankstelle wurde gerade Ausgeraubt, die entwendete Geldsumme wird auf: $%3 geschätzt!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
[0,format["Polizei News:-Eine Tankstelle wurde gerade Ausgeraubt, die entwendete Geldsumme wird auf: $%3 geschätzt!, sollte Jemand die Täter gesehen haben Bitten wir Sie dies der Polizei zu Melden",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",civilian];
[getPlayerUID _robber,name _robber,"15"] remoteExec ["life_fnc_wantedAdd",2];


uiSleep 600;
_action = _shop addAction["Laden Ausrauben",life_fnc_robShops];
_shop switchMove "";