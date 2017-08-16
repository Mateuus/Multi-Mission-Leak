/*
	File: BR_delete.sqf
	Author: Bloodwyn

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Description:
	Deletes the Battle Royale Arena.
*/

execVM "addons\admin_menu\Admin_Menu_scripts\eventflag.sqf";
Gericht_1 setVariable ["LHM_BR_eventstarted",false,true];
Gericht_1 setVariable ["LHM_BR_members",[],true];
[[[],{{deleteVehicle _x;}foreach LHM_BR_allObjs; Event_BR_info setPosATL [100,0,0];}],'BIS_FNC_SPAWN',false,false] call lhm_fnc_mp;