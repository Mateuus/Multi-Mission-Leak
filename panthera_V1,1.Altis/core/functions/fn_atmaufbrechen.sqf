/*
 File: fn_atmmachtsoichmachesounfall.sqf
 Author: Bimbambum & Kraken edited by BriziJaeger
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;
 
if(side _robber != civilian) exitWith { hint "Du bist kein Zivilist!" };
if(_robber distance _shop > 2) exitWith { hint "Du musst neben den Geldautomat stehen!" };
 
if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "Der Geldautomat wird bereits aufgebrochen!" };
if (vehicle player != _robber) exitWith { hint "Steig aus deinem Fahrzeug aus!" };
 
if !(alive _robber) exitWith {};
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {"Du brauchst einen Bolzenschneider!"};
if (_kassa == 0) exitWith { hint "Es ist kein Geld vorhanden!" };
 
_rip = true;
_kassa = 20000 + round(random 300000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then {[1,hint parseText format["Bankautomat bei %1 wird aufgebrochen!", _shop]] remoteExec ["life_fnc_broadcast",west]; };
 
_cops = (west countSide playableUnits);
if(_cops < 2) exitWith{[_vault,-1] remoteExec ["disableSerialization;",2]; hintSilent "Die Polizei hat alle Einnahmen abgeholt!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Wird ausgraubt. Entferne dich weiter weg als 2m. (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Wird ausgraubt. Entferne dich weiter weg als 2m. (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; 
 _marker = createMarker ["Marker200", _Pos]; 
 "Marker200" setMarkerColor "ColorRed";
 "Marker200" setMarkerText "Achtung! Räuber!";
 "Marker200" setMarkerType "mil_warning"; 
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 2.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 2.5) exitWith { deleteMarker 
"Marker200"; _shop switchMove ""; hint "Du hast den Bankautomaten verlassen."; 5 cutText ["","PLAIN"]; _rip = 
false; };
5 cutText ["","PLAIN"];
 
titleText[format["Du hast $%1 gestohlen!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; 
life_cash = life_cash + _kassa;
 
_rip = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[getPlayerUID _robber,name _robber,"11"] remoteExecCall ["life_fnc_wantedAdd",2];
};
sleep 300;
_action = _shop addAction["Geldautomat aufbrechen",life_fnc_atmaufbrechen]; 
_shop switchMove "";