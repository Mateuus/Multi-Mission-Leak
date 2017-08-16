/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
    Informs a medic when an injured person wants revived
*/

private["_location","_player"];
_location = _this select 0;
_player = [_this,1,"An Unknown Player",[""]] call BIS_fnc_param;

titleText [format ["%1 is requesting a medic for a revive, his location is marked on your map",_player], "PLAIN"];