/*
	File: fn_GroupBankInVite.sqf
	Author: Barney

	Description:
	Starts the bank group process and asks every selected member if it wants to join..

	You're not allowed to modify this file!
   	 Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private ["_time","_wieviele","_countdown","_wer","_arr"];



_time = 60;
LHM_group_Bank = LHM_group_Bank - [player];
LHM_group_Bank = LHM_group_Bank - [Objnull];

_wieviele = count(LHM_group_Bank);

if(_wieviele == 0) exitWIth {hint "Du hast niemanden ausgewählt"};
if(_wieviele > LHM_Group_Bank_max_Members) exitWith {hint format["Es sind nur %1 Member in der Truppe erlaubt", LHM_Group_Bank_max_Members];};
if(Gericht_1 getVariable ["Bank_Befragung",false]) exitWIth {hint "Es findet bereits eine Befragung statt"};
if(LHM_atmcash - (_wieviele * LHM_Bank_invite_costs) <= 0) exitWIth {hint "Du hast nicht genügend Geld auf deinem Konto"};

LHM_atmcash = LHM_atmcash - (_wieviele * LHM_Bank_invite_costs);

if(Gericht_1 getVariable ["Bank_Befragung",false]) exitWIth {hint "Es findet bereits eine Befragung statt"};



hint "Die ausgewählten Mitglieder der Misison werden nun befragt";

Gericht_1 setVariable ["Bank_Befragung",true,true];
//Gericht_1 setVariable ["Bank_mitglieder",[],true];

// [[player],"lhm_fnc_bankGroupAsked",LHM_group_Bank,false] call lhm_fnc_mp;
[[player,LHM_group_Bank],"lhm_fnc_bankHeist_teamInvite",false,false] call lhm_fnc_mp;
LHM_group_Bank = nil;
while{_time >= 0} do {
	_countdown = [_time,"MM:SS"] call BIS_fnc_secondsToString;
	uisleep 1;
	_time = _time -1;

	//_wer = Gericht_1 getVariable "Bank_mitglieder";
	//if(count (_wer) == _wieviele) exitWith {};
	hintsilent format["Verbleibende Zeit \n %1",_countdown];

};
waitUntil {!isnil "LHM_group_Bank"};
Gericht_1 setVariable ["Bank_Befragung",false,true];

if(count(LHM_group_Bank) <= 0) then {
	hint "Es hat keiner zugesagt";
} else {
	hint "Ausreichend Personen wollen teilnehmen, es kann los gehen";
	//LHM_group_Bank = Gericht_1 getVariable "Bank_mitglieder";
	LHM_group_Bank pushback player;
	LHM_group_Bank = LHM_group_Bank - [Objnull];
	// [[LHM_BANK_Way,LHM_group_Bank],"lhm_fnc_bankHeist_Monitor",false,false] call lhm_fnc_mp;
	if(LHM_BANK_Way == "Way1") then {
		[] spawn lhm_fnc_way_one_1;
	};

};



