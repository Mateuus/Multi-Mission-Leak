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
_wahl = false;
_nichts = false;
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

_combo_sel_Patr = lbCurSel _combo_Patr;

_combo_data_Patr =  _combo_Patr lbdata _combo_sel_Patr;

if(_combo_sel_Patr == -1) exitWith {hint "Du hast Nichts ausgewählt";};
//if(_combo_sel_Patr != -1   &&  _combo_sel_Dienst != -1) exitWith {hint "Das geht nicht gleichzeitig";};

//RAUSFINDEN WEN DER PLAYER AUSGEWÄHLT HAT
	if(lbCurSel _lb_Kavala != -1) then {
		_temp = _info select 0;
		_wen = _lb_Kavala lbdata (lbCurSel _lb_Kavala);
		diag_log _wen;
		_temp = _temp - [_wen];
		_info set[0,_temp];
		diag_log str _info;
		_welche pushback _wen;
		_wahl = true;

	};


	if(lbCurSel _lb_BP_West != -1) then {
		_temp = _info select 1;
		_wen = _lb_BP_West lbdata (lbCurSel _lb_BP_West);
		_temp = _temp - [_wen];
		_info set[1,_temp];
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_BP_West_2 != -1) then {
		_temp = _info select 2;
		_wen = _lb_BP_West_2 lbdata (lbCurSel _lb_BP_West_2);
		_temp = _temp - [_wen];
		_info set[2,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_Mitte != -1) then {
		_temp = _info select 3;
		_wen = _lb_BP_Mitte lbdata (lbCurSel _lb_BP_Mitte);
		_temp = _temp - [_wen];
		_info set[3,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_Ueberall != -1) then {
		_temp = _info select 4;
		_wen = _lb_BP_Ueberall lbdata (lbCurSel _lb_BP_Ueberall);
		_temp = _temp - [_wen];
		_info set[4,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_BP_East != -1) then {
		_temp = _info select 5;
		_wen = _lb_BP_East lbdata (lbCurSel _lb_BP_East);
		_temp = _temp - [_wen];
		_info set[5,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_AP_1 != -1) then {
		_temp = _info select 6;
		_wen = _lb_AP_1 lbdata (lbCurSel _lb_AP_1);
		_temp = _temp - [_wen];
		_info set[6,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_AP_2 != -1) then {
		_temp = _info select 7;
		_wen = _lb_AP_2 lbdata (lbCurSel _lb_AP_2);
		_temp = _temp - [_wen];
		_info set[7,_temp];
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_HWP != -1) then {
		_temp = _info select 8;
		_wen = _lb_HWP lbdata (lbCurSel _lb_HWP);
		_temp = _temp - [_wen];
		_info set[8,_temp];
		_welche pushback _wen;
		_wahl = true;
	};

	if(lbCurSel _lb_Sonstige != -1) then {
		_temp = _info select 9;
		_wen = _lb_Sonstige lbdata (lbCurSel _lb_Sonstige);
		_temp = _temp - [_wen];
		_info set[9,_temp];
		_welche pushback _wen;
		_wahl = true;
	};


	if(lbCurSel _lb_Uneingeteile != -1) then {
		_wen = _lb_Uneingeteile lbdata (lbCurSel _lb_Uneingeteile);
		_welche pushback _wen;
		_wahl = true;
	};

if(!_wahl) exitWith {hint "Du hast niemanden ausgewählt";};
//__________________________________________________________________________________
//----------------------------------------------------------------------------------
//==================================================================================
diag_log str _combo_sel_Patr;
if(_combo_sel_Patr != -1 ) then {


// Patroullie herausfinden

	_data = _combo_Patr lbdata (lbCurSel _combo_Patr);

	if(_data == "Kavala") then {

		{
			_man = _info select 0;
			_man pushback _x;
			_info set[0,_man];
			_lb_Kavala lbadd _x;
			_lb_Kavala lbsetdata[(lbSize _lb_Kavala),_x];

		} foreach _welche;
	};

	if(_data == "BP_West") then {
		{
			_man = _info select 1;
			_man pushback _x;
			_info set[1,_man];
			_lb_BP_West lbadd _x;
			_lb_BP_West lbsetdata[(lbSize _lb_BP_West),_x];

		} foreach _welche;
	};

	if(_data == "BP_West2") then {
		{
			_man = _info select 2;
			_man pushback _x;
			_info set[2,_man];
			_lb_BP_West_2 lbadd _x;
			_lb_BP_West_2 lbsetdata[(lbSize _lb_BP_West_2),_x];

		} foreach _welche;
	};

	if(_data == "BP_Mitte") then {
		{
			_man = _info select 3;
			_man pushback _x;
			_info set[3,_man];
			_lb_BP_Mitte lbadd _x;
			_lb_BP_Mitte lbsetdata[(lbSize _lb_BP_Mitte),_x];

		} foreach _welche;
	};

	if(_data == "BP_Ueberall") then {
		{
			_man = _info select 4;
			_man pushback _x;
			_info set[4,_man];
			_lb_BP_Ueberall lbadd _x;
			_lb_BP_Ueberall lbsetdata[(lbSize _lb_BP_Ueberall),_x];

		} foreach _welche;
	};

	if(_data == "BP_East") then {
		{
			_man = _info select 5;
			_man pushback _x;
			_info set[5,_man];
			_lb_BP_East lbadd _x;
			_lb_BP_East lbsetdata[(lbSize _lb_BP_East),_x];

		} foreach _welche;
	};

	if(_data == "AP1") then {
		{
			_man = _info select 6;
			_man pushback _x;
			_info set[6,_man];
			_lb_AP_1 lbadd _x;
			_lb_AP_1 lbsetdata[(lbSize _lb_AP_1),_x];

		} foreach _welche;
	};

	if(_data == "AP2") then {
		{
			_man = _info select 7;
			_man pushback _x;
			_info set[7,_man];
			_lb_AP_2 lbadd _x;
			_lb_AP_2 lbsetdata[(lbSize _lb_AP_2),_x];

		} foreach _welche;
	};

	if(_data == "HWP") then {
		{
			_man = _info select 8;
			_man pushback _x;
			_info set[8,_man];
			_lb_HWP lbadd _x;
			_lb_HWP lbsetdata[(lbSize _lb_HWP),_x];

		} foreach _welche;
	};

	if(_data == "Sonstige") then {
		{
			_man = _info select 9;
			_man pushback _x;
			_info set[9,_man];
			_lb_Sonstige lbadd _x;
			_lb_Sonstige lbsetdata[(lbSize _lb_Sonstige),_x];

		} foreach _welche;
	};

	if(_data == "Nichts") then {
		_nichts = true;

	};


};

if(_nichts) then {

	{
		if(typename _x != "array") exitWith {};
		_tump = _x;
		{
			_tump = _tump - [_x];
		} foreach _welche;
		_info set[_foreachindex,_tump];
	} foreach _info;


};



_info set[10,name player];
diag_log str _info;
Gericht_1 setVariable["Einteilung",_info,true];

[] call lhm_fnc_cop_classification_update;




