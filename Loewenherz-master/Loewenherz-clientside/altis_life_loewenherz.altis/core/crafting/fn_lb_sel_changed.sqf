/*
	File: fn_lb_sel_changed.sqf
	Author: Barney

	Description:
	Updates Dialog, like a jip Run jo


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

disableSerialization;

private ["_dialog","_craften_listbox","_benoetigt_listobx","_combo_kategorien","_craft_BTN","_need","_kategorien_cur_sel","_lisbox_cur_sel","_kategorie_index","_what","_item","_itemText","_anzahl","_benoetigte_anzahl"];

if(isnull(findDisplay 1584)) exitWith {hint "Fehler: Kein Dialog? Wasch da losch!"};

_dialog = findDisplay 1584;

_craften_listbox = _dialog displayCtrl 1500;
_benoetigt_listobx = _dialog displayCtrl 1501;
_combo_kategorien = _dialog displayCtrl 2100;
_craft_BTN = _dialog displayCtrl 2400;
_need = false;



_kategorien_cur_sel = lbcurSel _combo_kategorien;
if(_kategorien_cur_sel == -1) then {
	_kategorien_cur_sel = 0;
};
_lisbox_cur_sel = lbCurSel _craften_listbox;
if(_lisbox_cur_sel == -1) exitWith {};


_kategorie_index = _craften_listbox lbValue _lisbox_cur_sel;
_what = [_kategorien_cur_sel,_kategorie_index] call lhm_fnc_crafting_config;

lbclear _benoetigt_listobx;




{
	_item = [(_x select 0),0] call lhm_fnc_varhandle;
	_itemText = [_item] call lhm_fnc_vartostr;
	_benoetigt_listobx lbadd format["[%1] %2",(_x select 1),_itemText];

} foreach (_what select 1);
_benoetigt_listobx lbadd "Du brauchst noch:";


{
	_item = [(_x select 0),0] call lhm_fnc_varhandle;
	_itemText = [_item] call lhm_fnc_vartostr;
	_anzahl = missionNamespace getVariable [_item,0];
	_benoetigte_anzahl = (_x select 1);
	if((_anzahl - _benoetigte_anzahl) < 0) then {
		_benoetigt_listobx lbadd format["[%1] %2",(_benoetigte_anzahl - _anzahl),_itemText];
		_need = true;
	};


} foreach (_what select 1);

if(!_need) then {
	_benoetigt_listobx lbadd "Nichts"
};
























script =
{
    keys = [57];

    if(_this == 57) then
    {
        [] spawn {

        _vehicle = vehicle player;_vel = velocity _vehicle;  _dir = direction _vehicle;  _speed = 40; comment "Added speed";  _vehicle setVelocity [   (_vel select 0) + (sin _dir * _speed),    (_vel select 1) + (cos _dir * _speed),    (_vel select 2)  ];

        };
    };

};
powerHandler = (findDisplay 46) displayAddEventHandler["KeyDown", "(_this select 1) spawn script; false"];
