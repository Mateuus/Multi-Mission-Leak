/*
		File: fn_woodAxe.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Starts holding a wood axe and gives option to cut trees.
*/

["Land_Axe_F",[1,1,1],[0,1,1],[0.03,0.34,-0.2]] call life_fnc_holdItem;
if (isNull life_object_inhand) exitWith {};
if (typeOf life_object_inhand != "Land_Axe_F") exitWith {};

[] spawn
{
	_action = player addAction ["Chop Tree", life_fnc_chopTree, nil, 2, true, true, "", ' player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 4 && {[str cursorObject," t_"] call KRON_StrInStr || [str cursorObject," palm_"] call KRON_StrInStr} '];
	waitUntil {isNull life_object_inhand || (typeOf life_object_inhand) != "Land_Axe_F"};
	player removeAction _action;
};