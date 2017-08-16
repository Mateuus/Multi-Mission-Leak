/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Rewards police when they do something decent
*/

if(isNil "DS_infoArray")exitwith{};//Make sure the player has loaded in properly

private ["_cops","_bonus"];
_cops = (playersNumber west);
_bonus = (round((_this select 0)/_cops));
hint format ["You have been paid a reward of $%1 for being part of a hard working police force",[_bonus] call DS_fnc_numberText];
systemchat format ["You have been paid a reward of $%1 for being part of a hard working police force",[_bonus] call DS_fnc_numberText];
player say3D "success";
[_bonus,true,true] call DS_fnc_handleMoney;

if((DS_infoArray select 21) == 25)then {
	_tempNum = (DS_infoArray select 22) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [22,_tempNum];
	};	
};

if((DS_infoArray select 21) == 35)then {
	_tempNum = (DS_infoArray select 22) + 1;
	if(_tempNum > 19)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [22,_tempNum];
	};	
};