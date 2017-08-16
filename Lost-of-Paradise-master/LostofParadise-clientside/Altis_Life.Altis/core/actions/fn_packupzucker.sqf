private["_zucker"];
_zucker = nearestObjects[getPos player,["Land_CanisterPlastic_F"],2] select 0;
if(isNil "_zucker") exitWith {};

_spawn = "Land_CanisterPlastic_F";
_poszucker = [((getPos _zucker) select 0) + 0.001, ((getPos _zucker) select 1) + 0.001, 0];

if(([true,"zucker",1] call life_fnc_handleInv)) then
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1.0;
    titleText["Du hast 4kg Zucker aufgehoben.","PLAIN"];
    deleteVehicle _zucker;
};

sleep 20;
    _spawn createVehicle (_poszucker);