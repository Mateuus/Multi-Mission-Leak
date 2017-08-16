/*
	File: fn_killMessages.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays custom kill messages
*/
private["_timesDied","_killer","_killerGang","_myGang"];

_killer = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_myGang = (group player) getVariable "gangName";
_killersGang = (group _killer) getVariable "gangName";

//Weird Bug 
if(isNil {_killer})exitWith{};



if((player == _killer)&&(playerside == west))exitWith
	{
	[[0,format["(Officer) %1 has just killed himself",(name player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	};
if(player == _killer)exitWith
	{
	[[0,format["%1 has just killed himself",(name player)]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	};
	
//Officer Kills Gang members
if(((side _killer) == west)&&(!isNil {_myGang}))exitWith
	{
	[[0,format["(Officer) %1 has just killed %2 (%3)",name _killer,name player,_myGang]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	//[0] spawn life_fnc_recordAdd;
	};
	
//Officer Kills Non-Gang members	
if((side _killer) == west)exitWith
	{
	[[0,format["(Officer) %1 has just killed %2",name _killer,name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	//[0] spawn life_fnc_recordAdd;
	};
	
//Officer killed by gang member
if((playerside == west)&&(!isNil {_killersGang}))exitWith
	{
	[[0,format["%1 (%3) has just killed (Officer) %2",name _killer,name player,_killersGang]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	};
	
//Officer killed by non-gang member
if(playerside == west)exitWith
	{
	[[0,format["%1 has just killed (Officer) %2",name _killer,name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	};
	
//Check if no gangs
if(isNil {_myGang})then{_myGang = "No Gang"};
if(isNil {_killersGang})then{_killersGang = "No Gang"};
if(playerside == independent)then{_myGang = "WL Civ"};	
if((side _killer) == independent)then{_killersGang = "WL Civ"};

if(DS_headShot)then
	{
	[[0,format["%1 (%2) Has just killed %3 (%4)  --! HEAD SHOT !--",name _killer,_killersGang,name player,_myGang]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	//[0] spawn life_fnc_recordAdd;
	}
	else
	{
	[[0,format["%1 (%2) Has just killed %3 (%4)",name _killer,_killersGang,name player,_myGang]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	//[0] spawn life_fnc_recordAdd;
	};