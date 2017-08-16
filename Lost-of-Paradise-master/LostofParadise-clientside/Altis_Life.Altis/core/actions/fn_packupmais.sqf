/*
    moonshine script by spll3r
*/
private["_mais"];
_mais = nearestObjects[getPos player,["Land_Sack_F"],2] select 0;
if(isNil "_mais") exitWith {};

_spawn = "Land_Sack_F";
_posmais = [((getPos _mais) select 0) + 0.001, ((getPos _mais) select 1) + 0.001, 0];
//_dirplr = getDir player;
//_spwnmais = _spawn createVehicle (_posmais);


if(([true,"mais",1] call life_fnc_handleInv)) then
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1.0;	
    titleText["Du hast 2kg Mais aufgehoben.","PLAIN"];
    deleteVehicle _mais;
       
};

sleep 20;
    _spawn createVehicle (_posmais);

