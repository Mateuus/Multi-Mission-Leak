/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Buys a License
*/
disableSerialization;

ctrlShow[66654,false];



if(missionNameSpace getVariable DS_className)exitwith{hint "You already have this license";ctrlShow[66654,true];};
if((DS_className in ["DSL_rebel","DSL_rebelAdv","DSL_rebelVeh"])&&((DS_infoArray select 17) > 34))then{DS_price = (DS_price/2)};
if([DS_price,false] call DS_fnc_checkMoney)exitwith{ctrlShow[66654,true];};//How the fuck?
[DS_price,false,false] call DS_fnc_handleMoney;
missionNameSpace setVariable [DS_className,true];
hint format ["You have bought this license for $%1",[DS_price] call DS_fnc_numberText];
DS_price = 0;
ctrlShow[66654,true];
if(DS_className == "DSL_rebelAdv")then
	{
	DSL_rebel = true;
	if((DS_infoArray select 17) == 0)then
		{
		[2] call DS_fnc_questCompleted;
		};
	};