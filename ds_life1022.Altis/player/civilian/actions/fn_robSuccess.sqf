/*
	Darkside Life
    
	Author: Shawn "Huntah" Macgillivray

	Description:
	Robs your target
*/

[(_this select 0),false,true] call DS_fnc_handleMoney;
_cop = _this select 1;
if(isNil "_cop")then {_cop = false };
hint format ["You have stolen $%1",[(_this select 0)] call DS_fnc_numberText];
systemchat format ["You have stolen $%1",[(_this select 0)] call DS_fnc_numberText];
if((_cop)&&((DS_infoArray select 15) == 16))then { [1] call DS_fnc_questCompleted };