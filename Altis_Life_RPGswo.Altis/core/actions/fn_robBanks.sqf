#include "..\..\macros.hpp"
/*
	Sending robbery-request to server 
*/
private["_shop","_robber"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]]; 
_action = param [2];
_robberCount = 0;

_objects = nearestObjects [_shop, ["Air","Car","Ship","Man"], 50];
	{
		if ( (side _x)  == west ) exitWith {};
		if (getPlayerUID _x != "" ) then 
			{
				_robberCount = _robberCount + 1;
			};
			false;
	} count _objects;

if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Du bist Polizist und kein Verbrecher!" };
if(DWEV_lock_bankfilialenraub) exitWith {hint "Wir sind pleite, es war schon jemand anderes hier. Versuch es später erneut.";};
if ({(_x getVariable["coplevel",0]) > 1} count playableUnits < 6 ) exitWith {hint "Es muessen mindestens 6 Wachmeister oder höhere Beamte im Dienst sein."};
if(_robberCount < 3) exitWith{hint "Ihr seid nicht genug Leute um die Bankfiliale auszurauben!!\n\nIhr müsst mindestens zu viert sein";};
if (vehicle player != _robber) exitWith { hint "Komm aus dem Fahrzeug du Feigling!!1" };
if (currentWeapon _robber == "" && currentWeapon _robber != "Binocular" && currentWeapon _robber != "Rangefinder") exitWith { hint "Haha ich hab keine Angst vor dir. HAU AB DU HUND!!!" };
if(_robber distance _shop > 3) exitWith { hint "Komm näher wenn du mein Geld willst!" };

[_shop,_robber,_action] remoteExec ["DWF_fnc_robBanks",2];