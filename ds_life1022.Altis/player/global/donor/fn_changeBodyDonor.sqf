/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Play sounds from the donor menu
*/

private ["_body"];

if((lbCurSel 1503) isEqualTo -1)exitWith{hint "You have not selected a body to change into"};

_body = lbData [1503,lbCurSel 1503];
if(player getVariable ["restrained",false])exitWith{hint "Can't do this while in a vehicle or restrained"};
if(DS_donorUsed3)exitWith{hint "You have used this too recently. It can only be used once every 20 seconds"};
DS_donorUsed3 = true;

[player,_body] remoteExec ["HUNT_fnc_setupBody",2];

sleep 20;
DS_donorUsed3 = false;