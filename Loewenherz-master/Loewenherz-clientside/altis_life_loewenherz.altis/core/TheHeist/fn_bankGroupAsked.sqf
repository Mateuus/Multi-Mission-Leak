/*
	File: fn_bankGroupAsked.sqf
	Author: Barney

	Description:
	Shows a Yes/NO Dialog on the players screen, whether if he wants to join the team or not



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/


private ["_vonWem","_action","_mitglieder","_name"];
_vonWem =  param [0,ObjNull,[ObjNull]];
_name = name _vonWem;

sleep random 7;

closedialog 0;

_action = [
	format["Sie wurden von %1 als Mitglied für einen Banküberfall ausgewählt, wollen Sie teilnehmen?",_name],
	"Operation Banküberfall",
	"JA",
	"NE"
] call BIS_fnc_guiMessage;

waituntil{ str _action == "true" or  str _action == "false"};

if(!(Gericht_1 getVariable ["Bank_Befragung",false])) exitWith {hint "Du hast leider zu spät geantwortet"};

if(_action) then {
	sleep random 3;
	//_mitglieder = Gericht_1 getVariable ["Bank_mitglieder",[]];
	//_mitglieder pushback player;
	//Gericht_1 setVariable ["Bank_mitglieder",_mitglieder,true];
	[[player],"lhm_fnc_bankheist_teaminvite_acc",false,false] call Lhm_fnc_mp;
	systemChat "Sie haben sich dem Banküberfall angeschlossen";

};





