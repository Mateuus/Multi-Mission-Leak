#include <macro.h>
/*
    File: fn_gatherWood.sqf
    Author: Barney
    Description:
	Gather Wood near the marker with animation and falling Tree

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
*/
Private["_itemweight","_sum","_trees","_tree"];
closeDialog 0;
// Errorchecks
if(getpos(player) distance getmarkerpos "wood" > 150) exitWith {Hint "Du musst in der Nähe des staatlich genehmigten Feldes sein";};
if(vehicle player != player) exitWith {Hint "Was zur Hölle hast du vor?";};

_itemweight = ["woodu"] call lhm_fnc_itemWeight;
_trees = [];
_sum = round((lhm_maxWeight - lhm_carryWeight)/_itemweight );


if(_sum > 1) then
{
lhm_action_inUse = true;


{ if (str _x find ": t_" > -1) then {  _trees pushBack _x;      };  } forEach nearestObjects [player, [], 10];
 if(count(_trees) <= 0) exitWith{Hint"Kein Baum in der Nähe";};
 _tree = _trees select 0;



		if(_sum > 4) then
		{
			_sum = 4;
			titleText["Fälle Baum...","PLAIN DOWN"];
			player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			playsound "chopwood";
			sleep 3;
			if(([true,"woodu",_sum] call lhm_fnc_handleInv)) then
			{
				titleText[format["Du hast %1 Holz bekommen",_sum],"PLAIN DOWN"];
			};
			_tree setdamage 1;
		}else
		{
			titleText["Fälle Baum...","PLAIN DOWN"];
			player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
			playsound "chopwood";
			sleep 3;
			if(([true,"woodu",_sum] call lhm_fnc_handleInv)) then
			{
				titleText[format["Du hast %1 Holz bekommen",_sum],"PLAIN DOWN"];
			};
			_tree setdamage 1;
		};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

lhm_action_inUse = false;





