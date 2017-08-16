/*
	File: fn_cop_classification_open.sqf
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

private ["_opl","_gibtNICHT","_temp","_online","_fertig","_erstellen","_off","_display","_lb_Kavala","_lb_BP_West","_lb_BP_West_2","_lb_BP_Mitte","_lb_BP_Ueberall","_lb_BP_East","_lb_AP_1","_lb_AP_2","_lb_HWP","_lb_Sonstige","_lb_Uneingeteile","_text_Header","_btn_einteilen","_combo_Patr","_combo_Dienst","_config","_foreachindex","_wasGEHTSO","_was","_info","_header","_count","_fail"];
if(playerside != west) exitWIth {hint "Du bist kein Cop";};
closeDialog 0;
createDialog "Cop_classification";
waitUntil {dialog};
_opl = param[0,"",[""]];
_gibtNICHT = false;
_temp = [];
_online = [];
_fertig = [];
_erstellen = false;
_off = false;
_fail = false;
if(_opl == "opl" && (call lhm_coplevel) > 1) then {
	if(Gericht_1 getvariable["In_Benutzung",""] != "") exitWith {hint format["%1 benutzt aktuell dieses Menü",Gericht_1 getvariable["In_Benutzung",""]];_fail = true;};
};
if(_fail) exitWith {};
disableSerialization;

if(_opl == "opl" && (call lhm_coplevel) > 1) then {
	Gericht_1 setVariable["In_Benutzung",name player,true];
};

{
	if(side _x == west) then {
		_online pushback (name _x);
	};

} foreach playableUnits;


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
_btn_zuweisen    = _display displayCtrl 2799;
//Comboboxen
_combo_Patr      = _display displayCtrl 2100;
_combo_Dienst    = _display displayCtrl 2101;

lbClear _lb_Kavala;
lbClear _lb_BP_West;
lbClear _lb_BP_West_2;
lbClear _lb_BP_Mitte;
lbClear _lb_BP_Ueberall;
lbClear _lb_BP_East;
lbClear _lb_AP_1;
lbClear _lb_AP_2;
lbClear _lb_HWP;
lbClear _lb_Sonstige;
lbClear _lb_Uneingeteile;

lbClear _combo_Patr;
lbClear _combo_Dienst;


if((call lhm_coplevel) < 2) then   {
	_btn_einteilen buttonSetAction "[] call lhm_fnc_cop_classification_update;";
	_btn_einteilen ctrlSetText "Update";
	_combo_Patr    ctrlShow false;
	_combo_Dienst  ctrlShow false;
	_btn_zuweisen ctrlshow false;

} else {

	if(_opl == "opl") then {
		_btn_einteilen buttonSetAction "[] call lhm_fnc_cop_classification_organize;";
		_btn_einteilen ctrlSetText "Einteilen";

		{
			_combo_Patr lbadd _x;
			_combo_Patr lbsetdata[_foreachindex,_x];


		} foreach ["Kavala","BP_West","BP_West2","BP_Mitte","BP_Ueberall","BP_East","AP1","AP2","HWP","Sonstige","Nichts"];


		{
			_combo_Dienst lbadd _x;
			_combo_Dienst lbSetData[_foreachindex,_x];

		} foreach ["DD","OPL","Nichts"];

	} else {

			_btn_einteilen buttonSetAction "[] call lhm_fnc_cop_classification_update;";
			_btn_einteilen ctrlSetText "Update";
			_combo_Patr    ctrlShow false;
			_combo_Dienst  ctrlShow false;
			_btn_zuweisen ctrlshow false;
	};

};


_wasGEHTSO = Gericht_1 getVariable "Einteilung";

if(isnil "_wasGEHTSO") then {
	_was = [[],[],[],[],[],[],[],[],[],[],"","",""];
	Gericht_1 setVariable["Einteilung",_was,true];
	_erstellen = true;
};

if(_erstellen) then {
	_info = _was;
} else {
	_info = _wasGEHTSO;
};


if(_info select 10 != "") then {
	_header = format["Loewenherz Cops - Einteilung - Last Edit by %1",(_info select 10)];
	_text_Header ctrlSetText _header;
} else {
	_header = format["Loewenherz Cops - Einteilung - Last Edit by %1","Nobody"];
	_text_Header ctrlSetText _header;
};




_config = [_lb_Kavala,_lb_BP_West,_lb_BP_West_2,_lb_BP_Mitte,_lb_BP_Ueberall,_lb_BP_East,_lb_AP_1,_lb_AP_2,_lb_HWP,_lb_Sonstige,_lb_Uneingeteile];
_count = 0;

{
	if(typeName _x != "array") exitWith {};

	{
		if(_x in _online) then {
			if(_x == (_info select 11)) then {
				(_config select _count) lbadd format["%1 - OPL",_x];
				(_config select _count) lbsetdata[_foreachindex,_x];
				_fertig pushback _x;
			} else {
				if(_x == (_info select 12)) then {
					(_config select _count) lbadd format["%1 - DD",_x];
					(_config select _count) lbsetdata[_foreachindex,_x];
					_fertig pushback _x;
				} else {
					(_config select _count) lbadd _x;
					(_config select _count) lbsetdata[_foreachindex,_x];
					_fertig pushback _x;
				};

			};

		} else {
			_temp = _info select _count;
			_temp = _temp - [_x];
			_info set [_count,_temp];
			_off = true;
		};

	} foreach (_info select _foreachindex);

	_count = _count + 1;
} foreach _info;

if(_off) then {
	Gericht_1 setvariable["Einteilung",_info,true];
};


_online = _online - _fertig;


{
	if(_x == (_info select 11)) then {
				_lb_Uneingeteile lbadd format["%1 - OPL",_x];
				_lb_Uneingeteile lbsetdata[_foreachindex,_x];
			} else {
				if(_x == (_info select 12)) then {
					_lb_Uneingeteile lbadd format["%1 - DD",_x];
					_lb_Uneingeteile lbsetdata[_foreachindex,_x];
				} else {
					_lb_Uneingeteile lbadd _x;
					_lb_Uneingeteile lbsetdata[_foreachindex,_x];
				};

			};

} foreach _online;
if(_opl == "opl" && (call lhm_coplevel) > 1) then {
	waitUntil {isnull (finddisplay 4890)};

	Gericht_1 setVariable["In_Benutzung","",true];
};