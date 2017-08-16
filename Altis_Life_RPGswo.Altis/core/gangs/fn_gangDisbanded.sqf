/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies members that the gang has been disbanded.
*/
private["_group"];
_group = param [0,grpNull,[grpNull]];
if(isNull _group) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};
hint "Der Leader hat die Gang aufgelöst.";
[player] joinSilent (createGroup civilian);
if(count units _group == 0) then {
	deleteGroup _group;
};