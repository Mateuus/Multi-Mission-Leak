/*
	File: fn_checkChargesPlayer.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/
private["_unit","_cop","_uid","_crimeList","_player","_rebel","_rebelVeh","_bankRobber"];

_cop = _this select 0;
_uid = getPlayerUID player;
_player = player;
_crimeList = [];
_bankRobber = false;
if((DSL_rebel)||(DSL_rebelAdv))then{_rebel = true;}else{_rebel = false;};
if(DSL_rebelVeh)then{_rebelVeh = true;}else{_rebelVeh = false;};

[[DS_wanted_stats,_crimeList,_player,_rebel,_rebelVeh,_bankRobber],"DS_cop_checkChargesPlayerReturn",_cop,false] spawn DS_fnc_MP;

