/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Play sounds from the donor menu
*/

private ["_sound","_targets"];

if((lbCurSel 1502) isEqualTo -1)exitWith{hint "You have not selected a sound to play"};

_sound = lbData [1502,lbCurSel 1502];
if(player getVariable ["restrained",false])exitWith{hint "Can't do this while in a vehicle or restrained"};
if(DS_donorUsed3)exitWith{hint "You have used this too recently. It can only be used once every 20 seconds"};
DS_donorUsed3 = true;

_targets = allPlayers select {(_x distance player) < 100};
[player,_sound] remoteExecCall ["DS_fnc_playSounds",_targets];

sleep 20;
DS_donorUsed3 = false;