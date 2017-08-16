/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Informs someone that he has joined a gang
*/


hint format ["You have joined the %1 gang",(_this select 0)];
[] spawn DS_civ_menuGangMain;
_gang = (group player) getVariable ["gangName",""];
if(_gang isEqualTo "")exitwith{};//WTF
player setVariable ["myGang",_gang,true];

{
	if((group _x) == (group player))then
		{
		[[0,format["%1 has joined your gang",name player]],"DS_fnc_globalMessage",_x,false] spawn DS_fnc_MP;
		[[1,format["%1 has joined your gang",name player]],"DS_fnc_globalMessage",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;























