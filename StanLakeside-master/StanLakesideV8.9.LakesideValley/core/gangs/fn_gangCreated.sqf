#include <macro.h>
/*
	
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(cash_in_bank < (__GETC__(life_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-cash_in_bank)] call life_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(cash_in_bank,(__GETC__(life_gangPrice)));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];