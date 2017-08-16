/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Knocks someone out
*/
private["_victim"];
_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(((player distance (getMarkerPos "civ_spawn_1") < 900)||(player distance (getMarkerPos "auctionHouse") < 500))&&(playerside == civilian))exitwith{hint "You cant knock somebody out in a safezone";};

if(isNull _victim) exitWith {};
if(player getVariable ["surrender",false])exitwith{};
if(!isPlayer _victim) exitWith {};
if(player distance _victim > 4) exitWith {};
DS_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"DS_fnc_animSync",nil,false] spawn DS_fnc_MP;
sleep 0.08;
[[player,"punch"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
[[_victim,player getVariable["name",name player]],"DS_fnc_koed",_victim,false] spawn DS_fnc_MP;
[10,false] spawn DS_fnc_moralAlter;
sleep 3;
DS_knockout = false;
if((DS_infoArray select 15) == 2)then
	{
	[1] call DS_fnc_questCompleted;
	};