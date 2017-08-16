/*
file: fn_robShops.sqf
Author: MrKraken, modded by Teej
 - Added randomized marker name
 - Various fixes & string changes
 - Added attempted robbery
 - Added abort for being restrained
 - Added abort for being arrested
 - Added fix for being killed

Description:
Executes the rob shop action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring"];
_shop = param [0,ObjNull,[ObjNull]]; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = param [1,ObjNull,[ObjNull]]; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = param [2];//Action name
if (isNil "_rip") then { _rip = false };
if(_shop getVariable ["Kaeufer",""] == name player) exitWith {hint "Du willst deine eigene Tanke berauben?!";};

_cops = (west countSide playableUnits);
if(_cops < 5) exitWith {hint "Du kannst diese Tankstelle nicht ausrauben, es sind nicht genügend Cops da!";};
if(side _robber == west) exitWith { hint "Was denkst du tust du da? DEGRADIERT!" };
if(side _robber == independent) exitWith { hint "Hast du Nichts anderes zu tun?" };
if(_robber distance _shop > 5) exitWith { hint "Du darfst nicht weiter als 5m von der Kasse weg sein fuer den Raub!" };
if (vehicle player != _robber) exitWith { hint "Raus aus dem Fahrzeug!" };

if (isNil"_kassa") then { _kassa = 1000 };
if (_rip) exitWith { hint "Raub findet bereits statt!" };
if (currentWeapon _robber == "") exitWith { hint "Du jagst mir keine Angst ein, hau ab du Lump oder ich hol die Schrot!" };

if !(alive _robber) exitWith {};
if (_kassa == 0) exitWith { hint "Da ist kein Geld in der Kasse!" };

_rip = true;
_kassa = 2000 + round(random 3000); // Max Wert der Kasse
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then { hint "Der Angestellte hat den stillen Alarm aktiviert, Cops sind auf dem Weg!"; [[1,format["ALARM! - Store: %1 is being robbed!", _shop]],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp; };
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Knacke Kasse, bleib in der Naehe von 5m (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{
   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker%1", _rndmrk];
   _Pos = position player; // by ehno: get player pos
   _marker = createMarker [_mrkstring, _Pos]; //by ehno: Place a Marker on the map
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!ATTENTION! Robbery in Progress !ATTENTION!";
   _marker setMarkerType "mil_warning";
   [[0,"A store is being robbed!"],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp; // General broadcast alert to everyone, uncomment for testing, or if you want it anyway.

   while{true} do
   {
      sleep 2.00;
      _cP = _cP + 0.01;
      _progress progressSetPosition _cP;
      _pgText ctrlSetText format["Robbery in Progress, stay within 5m (%1%2)...",round(_cP * 100),"%"];

      if(_cP >= 1 OR !alive _robber) exitWith {};
      if(_robber distance _shop > 5.1) exitWith { };
	  if((_robber getVariable["restrained",false])) exitWith {};
	  if(lhm_istazed) exitWith {} ;
	  if(lhm_interrupted) exitWith {};
   };

   if!(alive _robber) exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; 5 cutText ["","PLAIN"];};
   if(_robber distance _shop > 5.1) exitWith { deleteMarker _marker; _shop switchMove ""; hint "Du bist von der Kasse weggegangen - die Kasse wurde verschlossen!"; 5 cutText ["","PLAIN"]; _rip = false; [[getPlayerUID _robber,name _robber,"211A"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp; };
   if(_robber getVariable "restrained") exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; hint "Du wurdest festgenommen!"; 5 cutText ["","PLAIN"];};
   if(lhm_istazed) exitWith { deleteMarker _marker; _rip = false; _shop switchMove ""; hint "Du wurdest getazed!"; 5 cutText ["","PLAIN"];};

   5 cutText ["","PLAIN"];
   titleText[format["Du hast %1 $ gestohlen, hau ab bevor die Polente kommt!",[_kassa] call lhm_fnc_numberText],"PLAIN"];
   deleteMarker _marker; // by ehno delete marker
   lhm_cash = lhm_cash + _kassa;

   _rip = false;
   lhm_use_atm = false;
   sleep (30 + random(180));
   lhm_use_atm = true;
   [[getPlayerUID _robber,name _robber,"211",_kassa],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
};

sleep 1800;
_action = _shop addAction["Rob Cash Register",lhm_fnc_robShops];
_shop switchMove "";