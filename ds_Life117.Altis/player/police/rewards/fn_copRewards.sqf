/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Rewards police when they do something decent
*/

if((_this select 0) == 666)exitwith
	{
	if((DS_infoArray select 21) == 20)then{[3] call DS_fnc_questCompleted;};
	if((DS_infoArray select 21) > 20)then
		{
		hint format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(playableUnits))*9375)] call DS_fnc_numberText];
		systemchat format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(playableUnits))*9375)] call DS_fnc_numberText];
		player say3D "success";
		[((count(playableUnits))*9375),true,true] call DS_fnc_handleMoney;
		}
		else
		{
		hint format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(playableUnits))*7500)] call DS_fnc_numberText];
		systemchat format ["For completing a police convoy mission, $%1 has been deposited into your bank account",[((count(playableUnits))*7500)] call DS_fnc_numberText];
		player say3D "success";
		[((count(playableUnits))*7500),true,true] call DS_fnc_handleMoney;
		};
	};
	
if(((_this select 1) == "Have defended a checkpoint")&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
	{
	hint format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %2 %3",[((_this select 0)*2)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[((_this select 0)*2),true,true] call DS_fnc_handleMoney;
	}
	else
	{
	hint format ["You have been paid a reward of $%1 because %2 %3",[(_this select 0)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	systemchat format ["You have been paid a reward of $%1 because %2 %3",[(_this select 0)] call DS_fnc_numberText,(_this select 2),(_this select 1)];
	player say3D "success";
	[(_this select 0),true,true] call DS_fnc_handleMoney;
	};

if(((player distance cp1 < 130)||(player distance cp2 < 130)||(player distance cp3 < 130))&&((DS_infoArray select 21) == 3))then
	{
	_tempNum = DS_infoArray select 22;
	_tempNum = _tempNum + 1;
	DS_infoArray set [22,_tempNum];
	if((DS_infoArray select 22) > 1)then
		{
		[3] call DS_fnc_questCompleted;
		};
	};

//[[7500,"The police have collected the spy documents",(name player)],"DS_cop_copRewards",false,false] spawn BIS_fnc_MP;