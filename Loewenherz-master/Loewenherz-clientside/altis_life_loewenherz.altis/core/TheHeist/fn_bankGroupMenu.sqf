/*
	File: fn_bankGroupMenu.sqf
	Author: Barney

	Description:
	Fills/Updates the dialog..... and so on



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/
private["_display","_allplayers","_playersSelected","_btnADD","_btnREMOVE","_btnACCEPT","_players","_groupBank","_id","_headerCosts","_header"];
_refresh = param[0,0,[0]];
if(Gericht_1 getVariable ["Bank_Befragung",false]) exitWIth {hint "Es findet bereits eine Befragung statt"};
disableSerialization;
if(_refresh != 1) then {
	closeDialog 0;
	createDialog "LHM_bank_group_menu";
	waitUntil {!isNull (findDisplay 9573)};
} ;
_display = findDisplay 9573;

_allplayers = _display displayCtrl 1500;
lbClear _allplayers;
_playersSelected = _display displayCtrl 1501;
lbClear _playersSelected;
_btnADD = _display displayCtrl 2400;
_btnREMOVE = _display displayCtrl 2401;
_btnACCEPT = _display displayCtrl 2403;
_header =  _display displayCtrl 1002;
_headerCosts =  _display displayCtrl 1003;

_players = playableUnits - [player];
_groupBank = LHM_group_Bank - [Objnull];
_groupBank = _groupBank - [player];

ctrlSetText[7858,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];




{
	if((side _x in [west,opfor,independent]) || (_x in _groupBank) || (!alive _x)) then {_players = _players - [_x]; };
} foreach _players;


{
	_id = _allplayers lbadd (name _x);
	_allplayers lbsetdata [_id,(netid _x)];
} foreach _players;



{
	_id = _playersSelected lbadd (name _x);
	_playersSelected lbsetdata [_id,(netid _x)];
} foreach _groupBank;


_btnADD ctrlSetText ">>>>>>>>>";
_btnADD buttonSetAction "[""add""] call lhm_fnc_playerAddBank; [1] spawn lhm_fnc_bankGroupMenu;";

_btnREMOVE ctrlSetText "<<<<<<<<<";
_btnREMOVE buttonSetAction "[""remmove""] call lhm_fnc_playerAddBank; [1] spawn lhm_fnc_bankGroupMenu;";

_btnACCEPT ctrlSetText "Bestätige";
_btnACCEPT buttonSetAction "[] spawn lhm_fnc_GroupBankInvite;closeDialog 0;";

_header ctrlSetText "PayDay! - Waehle dein Team";

_headerCosts ctrlSetText format["1 Invite kostet %1$ von deinem Konto",LHM_Bank_invite_costs];



