/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;
_blacklist =["U_I_CombatUniform"," U_I_Protagonist_VR","U_O_Protagonist_VR","U_B_Protagonist_VR","U_I_Protagonist_VR","launch_NLAW_F","srifle_GM6_SOS_F","srifle_LRR_F","srifle_LRR_SOS_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","launch_I_Titan_F","launch_O_Titan_F","launch_Titan_F","launch_I_Titan_short_F","launch_O_Titan_short_F","launch_Titan_short_F","srifle_GM6_LRPS_F","srifle_LRR_LRPS_F"];
if(isNull _unit OR _item == "") exitWith {}; 

switch(playerSide) do
{
	case west: {}; //Blah
	case civilian: {
		
		if(_item in _blacklist) then {
			[_item,false,false,false,false] call EMonkeys_fnc_handleItem;
		};
	};
	case east: {
		
		if(_item in _blacklist) then {
			[_item,false,false,false,false] call EMonkeys_fnc_handleItem;
		};
	};
	case independent: {};
};