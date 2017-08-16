/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Treats any sicknesses that a player may have
*/
private["_sickness","_action"];
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
_player = DS_cursorTarget;
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
hint format ["Taking a look at %1",name _player];
systemchat format ["Taking a look at %1",name _player];
sleep 5;
hint format ["You have healed %1 of his illnesses, make sure you charge him for your services",name _player];
systemchat format ["You have healed %1 of his illnesses, make sure you charge him for your services",name _player];
[] remoteExecCall ["DS_fnc_sicknessHealed",_player];
DS_doingStuff = false;
if((DS_infoArray select 10) == 9)then { [3] call DS_fnc_questCompleted };