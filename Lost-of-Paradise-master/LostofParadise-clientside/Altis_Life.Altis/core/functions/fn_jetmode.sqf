/*
	File: fn_jetmode.sqf
	Author: Sebi /  mdf_feindflug ::: lostofparadise.de / global-gamer.com
	
	Description:
	Gibt dem Piloten Godmode und repariert den Jet
*/
_array = ["O_Plane_CAS_02_F"];
while{true} do
{
    waitUntil{sleep 1; typeOf (vehicle player) in _array};
    player allowDamage false;
    hint "GODMODE AKTIV";
    
    // Position auslesen
    _setPos = [];
    if(surfaceIsWater position player) then {_setPos = getPosASL player} else {_setPos = getPosATL player};
    _near = nearestObjects[_setPos,_array,10];
    _nearJet = (_near select 0);
    if(!isNil "_nearJet") then {_nearJet setDamage 0};
    
    waitUntil{sleep 6; vehicle player == player};
    player allowDamage true;
    hint "GODMODE INAKTIV";
};