#include <macro.h>
private["_group"];
life_action_gangInUse = nil;
if(compte_banque < 50000) exitWith {
	hint format["Vous n'avez pas assez d'argent sur votre compte.\n\nIl vous manque : %1€",[(50000 - compte_banque)] call life_fnc_numberText];
	{(grpPlayer) SVAR[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};
SUB(compte_banque,50000);
hint format["Vous avez crée le gang %1 pour 50000€",(grpPlayer) getVariable "gang_name"];