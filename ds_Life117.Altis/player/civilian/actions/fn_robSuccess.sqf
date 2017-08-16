/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Robs your target
*/
[(_this select 0),false,true] call DS_fnc_handleMoney;
hint format ["You have stolen $%1",[(_this select 0)] call DS_fnc_numberText];
systemchat format ["You have stolen $%1",[(_this select 0)] call DS_fnc_numberText];