/*

	fn_medDekon.sqf
	Author: G00golplexian

	Description: Decontaminates the player for roleplay reasons.
*/
private["_cursortarget"];

_cursortarget = _this select 0;

hint "Steige nun in das ABC-Fahrzeug um den Vorgang zu starten, vergewissere dich, dass die verstrahlten Personen ebenfalls im Fahrzeug sitzen!";
waitUntil{player == driver _cursortarget};

[vehicle player,"beep"] remoteExecCall ["say3D",0];
sleep 1;
[vehicle player,"xray"] remoteExecCall ["say3D",0];
sleep 14;
[vehicle player,"beep"] remoteExecCall ["say3D",0];
["Gesund"] remoteExecCall ["life_fnc_zustand",(crew vehicle player)];
hint "Personen dekontaminiert.";