/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Informs the creator that his gang is ready
*/
if(player != (_this select 0))exitwith{};//DF....

hint format ["Your gang %1 has been created, open the gang dialog to manage your gang",((_this select 1) getVariable "gangName")];
DS_doingStuff = false;
player setVariable ["myGang",(_this select 1),true];
[] spawn DS_civ_menuGangMain;
if((DS_infoArray select 15) == 0)then
	{
	[1] call DS_fnc_questCompleted;
	};

























