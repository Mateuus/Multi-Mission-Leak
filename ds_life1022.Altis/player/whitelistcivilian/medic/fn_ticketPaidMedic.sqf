/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Medic receiving money for services
*/

hint format ["Because %1 has paid his charge, you have received the value of $%2 in your bank",name (_this select 0),[(_this select 1)] call DS_fnc_numberText];
systemchat format ["Because %1 has paid his charge, you have received the value of $%2 in your bank",name (_this select 0),[(_this select 1)] call DS_fnc_numberText];
[(_this select 1),true,true] spawn DS_fnc_handleMoney;
if(((_this select 1) > 999)&&((DS_infoArray select 10) == 6))then { [3] call DS_fnc_questCompleted };

if((player getVariable ["medic",false])&&((_this select 1) > 19999)&&((DS_infoArray select 10) == 17))then { [3] call DS_fnc_questCompleted };
if((player getVariable ["mechanic",false])&&((_this select 1) > 0)&&((DS_infoArray select 23) == 3))then { [3] call DS_fnc_questCompleted };
if((player getVariable ["mechanic",false])&&((_this select 1) > 9999)&&((DS_infoArray select 23) == 14))then { [3] call DS_fnc_questCompleted };