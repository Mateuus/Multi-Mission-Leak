/*
    Raub Anfrage an den Server 
*/
private["_shop","_robber"];
_shop = _this select 0;
_robber = _this select 1;
_action = _this select 2;

if(west countside playableunits < 3 OR life_bankraub OR life_galerieraub) exitWith {hint "Die Kasse ist leer, komm später vorbei!"};
if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Du bist ein Cop! "}; 
if !(isNull objectParent _robber) exitWith {player action ["GetOut", vehicle player]};
if (currentWeapon _robber == "") exitWith { hint "Du machst mir keine Angst! Hau bloss ab!" };
if(_robber distance _shop > 3) exitWith { hint "Du bist zu weit weg!" };
[_shop,_robber,_action] remoteExecCall ["SOA_fnc_robShops",2];