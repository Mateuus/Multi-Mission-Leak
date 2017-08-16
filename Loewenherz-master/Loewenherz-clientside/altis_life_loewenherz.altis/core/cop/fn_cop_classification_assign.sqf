/*
	File: fn_cop_classification_organize.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/



private ["_welche","_patr","_dienst","_config","_lb_Kavala","_lb_BP_West","_lb_BP_West_2","_lb_BP_Mitte","_lb_BP_Ueberall","_lb_BP_East","_lb_AP_1","_lb_AP_2","_lb_HWP","_lb_Sonstige","_lb_Uneingeteile","_info","_display","_text_Header","_btn_einteilen","_combo_Patr","_combo_Dienst","_combo_sel_Patr","_combo_sel_Dienst","_combo_data_Patr","_combo_data_Dienst","_temp","_wen","_wahl","_data","_man","_sel","_was"];

if(playerside != west) exitWIth {hint "Du bist kein Cop"; closeDialog 0;};


if(!dialog) exitWIth {hint "Fehler 1";};
disableSerialization;
_welche = [];
_patr = false;
_dienst = false;
_wahl = false;
_config = [_lb_Kavala,_lb_BP_West,_lb_BP_West_2,_lb_BP_Mitte,_lb_BP_Ueberall,_lb_BP_East,_lb_AP_1,_lb_AP_2,_lb_HWP,_lb_Sonstige,_lb_Uneingeteile];

_info = Gericht_1 getvariable "Einteilung";
if(isnil "_info") exitWIth {hint "Fehler 2";};

_display 	 = findDisplay 4890;
//Listboxes
_lb_Kavala 	 = _display displayCtrl 1501;
_lb_BP_West 	 = _display displayCtrl 1502;
_lb_BP_West_2 	 = _display displayCtrl 1503;
_lb_BP_Mitte	 = _display displayCtrl 1504;
_lb_BP_Ueberall  = _display displayCtrl 1505;
_lb_BP_East 	 = _display displayCtrl 1506;
_lb_AP_1	 = _display displayCtrl 1507;
_lb_AP_2 	 = _display displayCtrl 1508;
_lb_HWP 	 = _display displayCtrl 1509;
_lb_Sonstige     = _display displayCtrl 1510;
_lb_Uneingeteile = _display displayCtrl 1500;
// Text Header
_text_Header     = _display displayCtrl 1012;
// Einteilen Button
_btn_einteilen   = _display displayCtrl 2401;
//Comboboxen
_combo_Patr      = _display displayCtrl 2100;
_combo_Dienst    = _display displayCtrl 2101;
//if(!(ctrlshown _combo_Patr )) exitWith {hint "Fehler 3";};
if(call lhm_coplevel < 2) exitWIth {hint "Das kannst du noch nicht!";};
//-----------------------------------------------------------------

_combo_sel_Dienst = lbCurSel _combo_Dienst;

_combo_data_Dienst =  _combo_Dienst lbdata _combo_sel_Dienst;

if(_combo_sel_Dienst == -1) exitWith {hint "Du hast Nichts ausgewählt";};
//if(_combo_sel_Patr != -1   &&  _combo_sel_Dienst != -1) exitWith {hint "Das geht nicht gleichzeitig";};

//RAUSFINDEN WEN DER PLAYER AUSGEWÄHLT HAT
	if(lbCurSel _lb_Kavala != -1) then {
		_wen = _lb_Kavala lbdata (lbCurSel _lb_Kavala);
		_welche pushback _wen;
		_wahl = true;

	};


	if(lbCurSel _lb_BP_West != -1) then {
		_wen = _lb_BP_West lbdata (lbCurSel _lb_BP_West);
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_BP_West_2 != -1) then {
		_wen = _lb_BP_West_2 lbdata (lbCurSel _lb_BP_West_2);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_Mitte != -1) then {
		_wen = _lb_BP_Mitte lbdata (lbCurSel _lb_BP_Mitte);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_Ueberall != -1) then {
		_wen = _lb_BP_Ueberall lbdata (lbCurSel _lb_BP_Ueberall);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_East != -1) then {
		_wen = _lb_BP_East lbdata (lbCurSel _lb_BP_East);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_AP_1 != -1) then {
		_wen = _lb_AP_1 lbdata (lbCurSel _lb_AP_1);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_AP_2 != -1) then {
		_wen = _lb_AP_2 lbdata (lbCurSel _lb_AP_2);
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_HWP != -1) then {
		_wen = _lb_HWP lbdata (lbCurSel _lb_HWP);
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_Sonstige != -1) then {
		_wen = _lb_Sonstige lbdata (lbCurSel _lb_Sonstige);
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_Uneingeteile != -1) then {
		_wen = _lb_Uneingeteile lbdata (lbCurSel _lb_Uneingeteile);
		_welche pushback _wen;
		_wahl = true;
	};
_welche = _welche - [""];
diag_log str _welche;
if(!_wahl) exitWith {hint "Du hast niemanden ausgewählt";};
//__________________________________________________________________________________
//----------------------------------------------------------------------------------
//==================================================================================

if(lbCurSel _combo_Dienst != -1) then {
	_sel = lbCurSel _combo_Dienst;
	_was = _combo_Dienst lbdata _sel;

	{
		if(_x == "") then {
			_welche deleteAt _foreachindex;
		};

	} foreach _welche;

diag_log str _welche;
	if(_was == "DD") then {
		if(count(_welche) == 1) then {
			_info set[12,(_welche select 0)];
		} else {
			if(count(_welche) > 1) then {
				hint "Du hast zu viele Personen ausgewählt(Nur eine erlaubt)!"
			} else {
				hint "Du hast niemanden ausgewählt!"
			};
		};
	};
	if(_was == "OPL") then {
		diag_log str _welche;
		if(count(_welche) == 1) then {
			_info set[11,(_welche select 0)];
		} else {
			if(count(_welche) > 1) then {
				hint "Du hast zu viele Personen ausgewählt(Nur eine erlaubt)!"
			} else {
				hint "Du hast niemanden ausgewählt!"
			};
		};
	};
	if(_was == "Nichts") then {
		if(count(_welche) == 1) then {
			if((_info select 12) in _welche) then {
				_info set[12,""];
			};
			if((_info select 11) in _welche) then {
				_info set[11,""];
			};
		} else {
			if(count(_welche) > 1) then {
				hint "Du hast zu viele Personen ausgewählt(Nur eine erlaubt)!"
			} else {
				hint "Du hast niemanden ausgewählt!"
			};
		};
	};

};

_info set[10,name player];
diag_log str _info;
Gericht_1 setVariable["Einteilung",_info,true];

[] call lhm_fnc_cop_classification_update;




