/*
	
	fn_gangDisbanded.sqf
	Description:
	Notifies members that the gang has been disbanded.
*/

params [["_group", grpNull, [grpNull]]];

if(isNull _group) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};
hint localize "STR_GNOTF_DisbandWarn_2";
[player] joinSilent (createGroup civilian);
if(count units _group == 0) then {
	deleteGroup _group;
};
