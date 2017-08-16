#include <macro.h>
private["_corpse","_animals","_success"];
_meats = 0;
_meats = _meats + life_inv_henraw + life_inv_roosterraw + life_inv_sheepraw + life_inv_goatraw + life_inv_rabbitraw + life_inv_salema + life_inv_ornate + life_inv_mackerel + life_inv_tuna + life_inv_mullet + life_inv_catshark;
if (_meats == 0) exitWith { hint "Vous n'avez aucune viande a cuire !"; };
[2, format["Vous commencez a faire cuire %1 morceaux de viande.", _meats]] call life_fnc_broadcast;
for "_i" from 1 to _meats do
{
	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	uiSleep 2.3;
};
if (!alive player) exitWith {};
_viande = ["henraw","roosterraw","sheepraw","goatraw","rabbitraw","salema","ornate","mackerel","tuna","mullet","catshark"];
{
	if([false,_x,1] call life_fnc_handleInv) then
	{
		[false,_x,1] call life_fnc_handleInv;
		[true,format["%1p",_x],1] call life_fnc_handleInv;
	};
} forEach _viande;
[2, format["Vous avez cuit %1 morceaux de viandes.", _meats]] call life_fnc_broadcast;