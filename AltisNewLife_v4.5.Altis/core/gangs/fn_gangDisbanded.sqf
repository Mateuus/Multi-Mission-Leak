private["_group"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {};
if(!isNull (findDisplay 2620)) then {closedialog 2620};
hint "Votre chef a supprimé le gang !";
[player] joinSilent (createGroup civilian);
if(count units _group == 0) then {
	deleteGroup _group;
};
closedialog 0;