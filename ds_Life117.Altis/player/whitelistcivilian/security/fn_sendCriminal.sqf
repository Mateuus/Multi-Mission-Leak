/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Sends a criminal to the nearest police station for processing
*/
private["_unit","_player"];
_unit = DS_cursorTarget;
_player = player;

if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(side _unit == west) exitWith {}; //Not a civ

if(!([1] call DS_fnc_countPlayers))exitWith	
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'><br/>You can not accept a bounty when there is no cops online!, Send this man to a holding cell instead<br/></t>",_unit];
	hint _str;	
	};

hint "Ride Pending... Wait here with the criminal for 2 minutes until they are transported to the local police station";
systemchat "Ride Pending... Wait here with the criminal for 2 minutes until they are transported to the local police station";
[[_player],"DS_fnc_bountyDropCheck",_unit,false] spawn DS_fnc_MP;