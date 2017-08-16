/*
	File: fn_courtDecide.sqf
	Author: Barney

	Description:
	Gives the player the opportunity to vote


	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
Private["_vote","_action"];

closedialog 0;

_action = [
	"Ist der Angeklagte schuldig oder unschuldig?",
	"LOEWENHERZ GERICHT",
	"Schuldig",
	"Unschuldig"
] call BIS_fnc_guiMessage;
waituntil{ str _action == "true" or  str _action == "false"};
sleep random(5);

if (_action) then {
 _vote = Gericht_1 getVariable["vote",[]];
 _vote pushback "schuldig";
 Gericht_1 setVariable["vote",_vote,true];

}else {
 _vote = Gericht_1 getVariable["vote",[]];
 _vote pushback "unschuldig";
 Gericht_1 setVariable["vote",_vote,true];
};