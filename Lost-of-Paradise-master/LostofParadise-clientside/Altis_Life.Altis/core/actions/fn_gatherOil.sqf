/*
	File: fn_gatherOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers oil, needs to be revised and changed.
*/
private["_sum"];
_sum = ["oilu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_pickAxeAllowed = false; // blocked pickaxe
life_action_gather = true; // blocked space
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Oil"],"PLAIN"];
	sleep 3;
	if(([true,"oilu",_sum] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Oil"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_gather = false; // enable space
life_pickAxeAllowed = true; // enable pickaxe