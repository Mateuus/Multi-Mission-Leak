/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/

private ["_car","_besitzer","_obj"];
_car = param[0,objNull,[objNull]];

hint "Untersuche Fahrzeug....";

sleep 3;

if((_car getvariable["injection",0]) > 0) then {
        hint "Dieses Fahrzeug besitzt ein illegales Einspritzungssystem!";
        _car setvariable["injection",nil,true];
        _besitzer = _car getVariable["owner",""];
        if(_besitzer != "") then {
                _obj = objNull;
                {
                        if(name _x == _besitzer) then {
                                _obj = _x;
                        };
                } foreach playableUnits;
                if(!isnull _obj) then {
                         [[getPlayerUID _obj,name _obj,"1337"],"lhm_fnc_wantedAdd",false,false] spawn lhm_fnc_mp;
                };
        };


} else {
        hint "Alle Systeme in diesem Fahrzeug sind legal.";
};