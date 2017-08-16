#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private "_group";
ES_action_gangInUse = nil;

if(ES_atmbank < (ES_SETTINGS(getNumber,"gang_price"))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((ES_SETTINGS(getNumber,"gang_price"))-ES_atmbank)] call ES_fnc_numberText];
	{group player setVariable [_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

ES_atmbank = ES_atmbank - (ES_SETTINGS(getNumber,"gang_price"));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(ES_SETTINGS(getNumber,"gang_price"))] call ES_fnc_numberText];