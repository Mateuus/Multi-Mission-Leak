/*
	File: fnc_playerquery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the query on a player.
*/
private["_ret"];
_ret = _this select 0;
if(isNull _ret) exitWith {};
if(isNil "_ret") exitWith {};

[[life_atmmoney,life_money,player getVariable ["ownerID", -1],player],"life_fnc_admininfo",_ret,false] spawn life_fnc_MP;