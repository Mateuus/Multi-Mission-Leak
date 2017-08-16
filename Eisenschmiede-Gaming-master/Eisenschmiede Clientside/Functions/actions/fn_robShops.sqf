#include "..\script_macros.hpp"
/*
    Raub Anfrage an den Server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(playersNumber west < 3) exitWith { hint "Die Kasse ist leer, komm später vorbei!"}; //Wenn nicht genug Cops online sind gibt er dieses aus
if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Du bist ein Cop! " }; // Damit nur Zivilisten die Tankstelle ausrauben können
if (vehicle player != _robber) exitWith { hint "Aus einem Fahrzeug ausrauben? Wird bisschen schwer!" };
if (currentWeapon _robber == "") exitWith { hint "Ohne Waffe machst du mir keine Angst! Hau bloss ab" }; //versucht er ohne Waffe auszurauben, kommt diese Nachricht
if(_robber distance _shop > 3) exitWith { hint "Du bist zu weit weg!" };
[[_shop,_robber,_action],"ES_fnc_robShops",false,false] spawn ES_fnc_MP; //Nachricht wird an Server gesendet.