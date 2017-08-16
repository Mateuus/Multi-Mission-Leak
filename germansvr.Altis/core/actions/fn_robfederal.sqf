/*
Author : MrKraken edited by Brizi jaeger
*/
//private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (community.bistudio.com/wiki/addAction). Give it a try and post below 
_action = [_this,2] call BIS_fnc_param;//Action name
if(side _robber != civilian) exitWith { hintSilent "Du kannst dieses Depot nicht ausrauben!" };
if(_robber distance _shop > 15) exitWith { hintSilent "Maximal 15 Meter entfernen!" };
if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hintSilent "Golddepot wird schon ausgeraubt!" };
if (vehicle player != _robber) exitWith { hintSilent "Raus aus dem Fahrzeug!" };
if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hintSilent "Ich finde Pranks immer wieder schön..." };
if (_kassa == 0) exitWith { hintSilent "Heute gibt es hier nichts!" };
_rip = true;
_kassa = 200000 + round(random 100000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 1) then {[1,hint parseText format["<img size='10' color='#FFFFFF' image='textures\info.paa'/><br/><br/>" + ("Das Altis Gelddepot wird angegriffen! Verteidigen Sie es bevor die Gangster das Geld haben!")]] remoteExec ["life_fnc_broadcast",west]; };
if(_chance >= 1) then {[1,hint parseText format["<img size='10' color='#FFFFFF' image='textures\info.paa'/><br/><br/>" + ("Das Altis Gelddepot wird angegriffen! Wir bitte Sie sich in einem Umkreis von 1 Kilometer zu entfernen ansonsten muss mit beschuss gerechnet werden. Wenn Sie Verteidigen, schreiben Sie einen Notruf an die Polizei! Ihre Altis Polizei")]] remoteExec ["life_fnc_broadcast",civilian]; };
_cops = (west countSide playableUnits);
if(_cops < 0) exitWith{[_vault,-1] remoteExec ["disableSerialization;",2]; hintSilent "Die Polizei hat alle einnahmen abgeholt!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Raub gestartet! Bewege dich maximal 15 Meter weit weg! (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if(_rip) then
{
while{true} do
{
uiSleep 6;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Behalte eine Distanz von 15 Metern zum Tresor! (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; // by ehno: get player pos
_marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
"Marker200" setMarkerColor "ColorRed";
"Marker200" setMarkerText "Sperrgebiet";
"Marker200" setMarkerType "mil_warning"; // "mil_warning"
"Marker200" setMarkerShape "ELLIPSE"; //create sperrgebiet by brizi
"Marker200" setMarkerSize [350, 350]; //create sperrgebiet by brizi
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 15.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 15.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hintSilent "Du warst zu weit weg vom Depot."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];
titleText[format["Du hast $%1 gestohlen, jetzt hau ab die Polizei ist unterwegs!!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
deleteMarker "Marker900"; // by brizi delete sperrgebiet
life_cash = life_cash + _kassa;
[getPlayerUID _robber,name _robber,"23"] remoteExecCall ["life_fnc_wantedAdd",2];
_rip = false;
life_use_atm = false;
uiSleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
};
uiSleep 300;
_action = _shop addAction["Ausrauben",life_fnc_robfederal];
_shop switchMove "";