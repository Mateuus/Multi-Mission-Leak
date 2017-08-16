/*
	File: fn_gangDisbanded.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies members that the gang has been disbanded.
*/
private "_group";
_group = param [0,grpNull,[grpNull]];
if(isNull _group) exitWith {}; //Fail horn please.
if(!isNull (findDisplay 2620)) then {closedialog 2620};

hint  "Du bist dabei, die Gang aufzulösen. Durch Auflösung der Gang wird sie aus der Datenbank entfernt. <br/><br/>Bist du sicher, dass du die Gang auflösen willst? Du erhältst den Preis für die Erstellung nicht zurück._2";
[player] joinSilent (createGroup civilian);

if(count units _group == 0) then {
	deleteGroup _group;
};
