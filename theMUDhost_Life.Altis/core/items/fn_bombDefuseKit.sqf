/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Defuses demolition charges.
*/
private["_vault"];
_vault = cursorTarget;
if(isNull _vault) exitWith {};
if(!(_vault getVariable["dchargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};
if(!([false,"civdefusekit",1] call life_fnc_handleInv)) exitWith { hint "You have no Defusal Kit"; }; //Error?

life_action_inUse = true;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 6;
};

if(!alive player) exitWith {life_action_inUse = false;};

life_action_inUse = false;
hint "Bomb Defused";
_vault setVariable["dchargeplaced",false,true];
_vault setVariable["dchargefound",false,true];