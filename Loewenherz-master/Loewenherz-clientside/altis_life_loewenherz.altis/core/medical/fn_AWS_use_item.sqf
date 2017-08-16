/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/


private ["_use","_display","_lbox_materialien","_str_text_beschr_material","_sel","_item","_fail","_lbox_verletzungen","_sel_v","_verletzung","_index","_item_inv","_name_verletzungen","_name_verletzungen_progr","_beschreibung_Verletzungen","_verletzt","_str_text_beschreibung_welche_region","_temp","_temp_text","_time","_d","_foreachindex","_conf","_yesORno","_number"];



_use = param[0,true,[true]];
if(AWS_working) exitWith {titletext["Du kannst immer nur eine Sache gleichzeitig benutzen","PLAIN DOWN"];};
disableSerialization;
_display = findDisplay 5284;
_lbox_materialien = _display displayCtrl 1501;
_str_text_beschr_material = _display displayCtrl 1103;

_name_verletzungen = [];
_name_verletzungen_progr = [];
_beschreibung_Verletzungen = [];
_verletzt = false;

_sel = lbCurSel _lbox_materialien;
if(_sel isEqualTo -1) exitWith {};
_item = _lbox_materialien lbdata _sel;
if(_item isEqualTo "") exitWith {};
_fail = false;

_str_text_beschreibung_welche_region = _display displayCtrl 1104;


_lbox_verletzungen = _display displayCtrl 1500;
_slider = _display displayCtrl 1900;




/*
    Verletzungen:
    "broken_left_leg"
    "broken_right_leg"
    "broken_left_arm"
    "broken_right_arm"
    "bullet_wound_left_arm"
    "Bullet_wound_right_arm"
    "bullet_wound_left_leg"
    "bullet_wound_right_leg"
    "bullet_wound_torso"
    "big_wound_torso"
    "big_wound_left_arm"
    "big_wound_right_arm"
    "big_wound_left_leg"
    "big_wound_right_leg"
    "traumatic_brain_injury"
    "fever"
*/


if(_use) then {

	_sel_v = lbCurSel _lbox_verletzungen;
	if(_sel_v == -1) exitWith {titletext["Wähle eine Verletzung/Krankheit aus, welche du behandeln möchtest","PLAIN DOWN"];};
	_verletzung = _lbox_verletzungen lbdata _sel_v;
	_index = _lbox_verletzungen lbvalue _sel_v;



    switch (_item) do
    {
        case "tourniquet":
        {
        	if(_verletzung in ["fever","traumatic_brain_injury","bullet_wound_torso","big_wound_torso","broken_left_leg","broken_right_leg","broken_left_arm","broken_right_arm"]) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

        case "Israeli_bandage":
        {
        	if(_verletzung in ["broken_right_arm","broken_left_arm","broken_right_leg","broken_left_leg","fever"]) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

        case "combat_gauze":
        {
        	if(_verletzung in ["broken_right_arm","broken_left_arm","broken_right_leg","broken_left_leg","fever","traumatic_brain_injury"]) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

         case "druckverband":
        {
        	if(_verletzung in ["broken_right_arm","broken_left_arm","broken_right_leg","broken_left_leg","fever"]) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

         case "morphin":
        {
        	if(!(_verletzung in ["broken_right_arm","broken_left_arm","broken_right_leg","broken_left_leg"])) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

         case "tabletten":
        {
        	if(!(_verletzung in ["fever"])) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};
        	AWS_Body setVariable[_verletzung,nil,true];

            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };

         case "schiene":
        {
        	if(!(_verletzung in ["broken_right_arm","broken_left_arm","broken_right_leg","broken_left_leg"])) exitWith {titletext["Dieses Material kann für eine solche Verletzung nicht genutzt werden","PLAIN DOWN"]; _fail = true;};

            AWS_Body setVariable[_verletzung,nil,true];
            [[_index,false], "lhm_fnc_AWS_config_parsing", [AWS_Body], true] call lhm_fnc_mp;

            _item_inv = [_item,0] call lhm_fnc_varhandle;
            _temp = missionNamespace getVariable[_item_inv,0];
            missionNamespace setVariable[_item_inv,(_temp - 1)];
        };
    };

    if(_fail) exitWith {AWS_working = false;};
    AWS_working = true;
    _temp_text = ctrlText _str_text_beschreibung_welche_region;

    [] spawn {
        While{true} do {
            if(isnull LHM_shop_show_vehicle) exitWith {};
            if(!AWS_working) exitWith {LHM_shop_show_vehicle switchmove "amovpercmstpsnonwnondnon";};
            LHM_shop_show_vehicle switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
            _time = 0;
            waitUntil {_time = _time +1;uisleep 1; _time >=6;};

        };

    };
    _slider ctrlshow false;
    _temp_speed = LHM_shop_Rotate_speed;
    LHM_shop_Rotate_speed = 0;
    for "_d" from 0 to 100 do {


        sleep 0.3;
        if(isnull (findDisplay 5284)) exitWith {_fail = true;};
        if(!alive player) exitWith {_fail = true;};
        if(!alive AWS_Body) exitWith {_fail = true;};
        _str_text_beschreibung_welche_region ctrlSetStructuredText parseText format["<t size='1.3'  align='center'>Fortschritt:</t> <br/><br/> <t size='1.1' align='center'>%1 %2</t>",_d,"%"];

    };

    if(_fail) exitWith {AWS_working = false; closeDialog 0;};
     _slider ctrlshow true;
    LHM_shop_Rotate_speed = _temp_speed;
    LHM_shop_show_vehicle switchmove "amovpercmstpsnonwnondnon";
    AWS_working = false;

    _str_text_beschreibung_welche_region ctrlSetStructuredText parseText "";

} else {



	_item_inv = [_item,0] call lhm_fnc_varhandle;
	missionNamespace setVariable[_item_inv,0];


};




lbclear _lbox_materialien;
lbClear _lbox_verletzungen;



{
    if(missionNamespace getvariable[_x,0] >= 1) then {
        _id = _lbox_materialien lbadd format["[%1] - %2",missionNamespace getvariable[_x,0],([_x] call lhm_fnc_vartoStr)];
        _lbox_materialien lbSetData [_id,([_x,1] call lhm_fnc_varhandle)];
        _lbox_materialien lbsetvalue [_id,_foreachindex];

    };

    } foreach ["lhm_inv_tourniquet","lhm_inv_Israeli_bandage","lhm_inv_combat_gauze","lhm_inv_druckverband","lhm_inv_morphin","lhm_inv_tabletten","lhm_inv_schiene"];


_conf = [true,true] call lhm_fnc_AWS_config;

{
    _name_verletzungen_progr pushback (_x select 0);
    _name_verletzungen pushback (_x select 1);
    _beschreibung_Verletzungen pushback (_x select 2);


} foreach _conf;



{
    _yesORno = AWS_Body getVariable[_x,false];
    if(_yesORno) then {
        _number = _lbox_verletzungen lbadd format["- %1",(_name_verletzungen select _foreachindex)];
        _lbox_verletzungen lbsetvalue[_number,_foreachindex];
        _lbox_verletzungen lbSetData[_number,_x];
        _verletzt = true;
    };

} foreach _name_verletzungen_progr;

if(!_verletzt) then {
    _lbox_verletzungen lbadd "- Gesund";
    _lbox_verletzungen lbSetValue [0,-1];

};