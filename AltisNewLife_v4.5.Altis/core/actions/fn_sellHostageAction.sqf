#include <macro.h>
private["_unit","_noesckey"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {};
if(life_enslaved) exitWith {hint "Il a deja été un esclave, attendez un peu avant de l'enchainer a nouveau !"};
_noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
player setPos (getMarkerPos "slave_trader_center");
removeVest player;
removeAllWeapons player;
removeHeadgear player;
removeBackpack player;
player forceAddUniform "U_MillerBody";
player setVariable["restrained",false,true];
player setVariable["escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["enslaved",true,true];
life_enslaved = true;
titleText["Vous avez été vendu comme esclave, travailler si vous voulez sortir de cette condition !","PLAIN"];
hint "Vous avez été vendu comme esclave, travailler si vous voulez sortir de cette condition !";
[[0,format["%1 a été vendu comme esclave !",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
uiSleep 15;
slave_task1 = player createSimpleTask ["slave_task_1"];
slave_task1 setSimpleTaskDescription ["Obtenir sa liberté en roulant 30 cigarettes","LIBERTEEEEEE",""];
slave_task1 setTaskState "Assigned";
player setCurrentTask slave_task1;
[] spawn 
{
	while {life_enslaved && alive player} do 
	{
		if(player distance (getMarkerPos "slave_trader_center") > 40) then
		{	
			player setPos (getMarkerPos "slave_trader_center");
		};
	};
};
waitUntil {!life_enslaved};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _noesckey];