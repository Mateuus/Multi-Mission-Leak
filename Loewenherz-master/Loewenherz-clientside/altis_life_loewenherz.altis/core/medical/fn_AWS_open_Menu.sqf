/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/




private ["_who","_name_verletzungen","_name_verletzungen_progr","_beschreibung_Verletzungen","_verletzt","_display","_lbox_verletzungen","_str_text_header_verletzungen","_str_text_beschr_verletzungen","_str_text_header_material","_lbox_materialien","_str_text_beschr_material","_BTN_USE","_BTN_wegwerfen","_slider","_conf","_yesORno","_number","_foreachindex","_classname","_temp"];

_who = param[0,Objnull,[objNull]];
_name_verletzungen = [];
_name_verletzungen_progr = [];
_beschreibung_Verletzungen = [];
_verletzt = false;
if(isnull _who) exitWith {};

AWS_Body = _who;

createdialog "AWS";
waitUntil {!isnull (findDisplay 5284)};
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

disableSerialization;
_display = findDisplay 5284;
_lbox_verletzungen = _display displayCtrl 1500;
_str_text_header_verletzungen = _display displayCtrl 1100;
_str_text_beschr_verletzungen = _display displayCtrl 1101;
_str_text_header_material = _display displayCtrl 1102;
_lbox_materialien = _display displayCtrl 1501;
_str_text_beschr_material = _display displayCtrl 1103;
_BTN_USE = _display displayctrl 2400;
_BTN_wegwerfen = _display displayctrl 2402;
_slider = _display displayCtrl 1900;


_str_text_header_verletzungen ctrlSetStructuredText parseText "<t size='1.3' color='#FF0000' align='center'>Verletzungen:</t>";
_str_text_header_material ctrlSetStructuredText parseText "<t size='1.3' color='#FF0000' align='center'>Materialien:</t>";

slidersetRange [1900,0,1.5];
sliderSetPosition [1900, 0];



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
	_yesORno = _who getVariable[_x,false];
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

B1 = "MetalBarrel_burning_F" createVehicleLocal [0,0,0];
B2 = "MetalBarrel_burning_F" createVehicleLocal [0,0,0];
B3 = "MetalBarrel_burning_F" createVehicleLocal [0,0,0];
B4 = "MetalBarrel_burning_F" createVehicleLocal [0,0,0];

{
	(_x select 0) setposatl (_x select 1);

} foreach [[B1,[20082.6,20064.5,0.0851135]],[B2,[20079,20069.2,0.125906]],[B3,[20073.6,20066.4,0.190907]],[B4,[20075.5,20060.6,0.182396]]];

_classname = typeof _who;
LHM_shop_show_vehicle = _classname createvehiclelocal [0,0,0];
LHM_shop_show_vehicle setposatl [20078.3,20063.3,0.135773];
LHM_shop_show_vehicle removeweaponglobal (primaryweapon LHM_shop_show_vehicle);
LHM_shop_show_vehicle removeweaponglobal (secondaryWeapon LHM_shop_show_vehicle);
removeVest LHM_shop_show_vehicle;
removeUniform LHM_shop_show_vehicle;
removeHeadgear LHM_shop_show_vehicle;
removeBackpackGlobal LHM_shop_show_vehicle;
LHM_shop_show_vehicle action ["SwitchWeapon", LHM_shop_show_vehicle, LHM_shop_show_vehicle, 100];
LHM_shop_show_vehicle forceAddUniform (uniform _who);
LHM_shop_show_vehicle addVest (vest _who);
LHM_shop_show_vehicle addBackpackGlobal (backpack _who);
LHM_shop_show_vehicle addHeadgear (headgear _who);
LHM_shop_show_vehicle setObjectTexture [0, ((getObjectTextures player) select 0) ];
LHM_shop_show_vehicle switchmove "amovpercmstpsnonwnondnon";

if(side _who in [west,opfor]) then {
	(unitBackpack LHM_shop_show_vehicle) setObjectTextureGlobal [0, ""];

} else {
	if(!isnull (unitBackpack player)) then {
		if(((getObjectTextures (unitBackpack AWS_Body)) select 0) != "") then {
			(unitBackpack LHM_shop_show_vehicle) setObjectTextureGlobal [0, ((getObjectTextures (unitBackpack AWS_Body)) select 0)];

		};
	};

};


LHM_shop_show_vehicle setposatl [20078,20063.5,0.140268];

LHM_shop_cam = "CAMERA" camCreate getPosatl (LHM_shop_show_vehicle);
showCinemaBorder false;
LHM_shop_cam cameraEffect ["Internal", "Back"];
LHM_shop_cam camSetPos ([20080.3,20059.3,1.135773]);
LHM_shop_cam camSetTarget ([20078.3,20062.96,0.940773]);
LHM_shop_cam camSetFocus [50, 0];
LHM_shop_cam camSetFOV .35;
LHM_shop_cam camCommit 0;

LHM_VehShop_Showcase = true;
LHM_VehShop_Dir = 155;
_temp = LHM_shop_Rotate_speed;
LHM_shop_Rotate_speed = 0;
[] spawn lhm_fnc_circleVehicleShow;



waituntil {isnull (findDisplay 5284);};
LHM_shop_Rotate_speed = _temp;

LHM_VehShop_Showcase = false;
LHM_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy LHM_shop_cam;

deleteVehicle LHM_shop_show_vehicle;

{
	deleteVehicle _x;

} foreach [B1,B2,B3,B4];

