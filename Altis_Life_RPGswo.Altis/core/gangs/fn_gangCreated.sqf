#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
DWEV_action_gangInUse = nil;

if(dwf_atmcash < (__GETC__(DWEV_gangPrice))) exitWith {
	hint format["Du hast nicht genug Geld auf deiner Bank.\n\nDir fehlen: %1€",[((__GETC__(DWEV_gangPrice))-dwf_atmcash)] call DWEV_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

__SUB__(dwf_atmcash,(__GETC__(DWEV_gangPrice)));

hint format["Du hast die Gang %1 für %2€ erstellt.",(group player) getVariable "gang_name",[(__GETC__(DWEV_gangPrice))] call DWEV_fnc_numberText];