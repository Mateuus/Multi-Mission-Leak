/*
	File: fn_map_Marker_Menu.sqf
	Author: Barney

	Description:

*/
private ["_display","_All_farming_Markers","_Illegal_farming_Markers","_Legal_farming_Markers","_police_Markers","_medic_Markers","_Legende","_Gang_Markers","_tankstellen_Markers","_alle_shops","_illegal_shops","_legal_shops","_LSA_Markers","_sonstige_marker","_garagen_Marker","_DP_Marker","_Lizenzen_shops","_atm_markers","_chopChops"];
if(isnull (findDisplay 2500)) then {
	closeDialog 0;

	createDialog "Map_Marker_Menu";
};

_display                 = findDisplay 2500;
_All_farming_Markers     = _display displayCtrl 1018;
_Illegal_farming_Markers = _display displayCtrl 1019;
_Legal_farming_Markers   = _display displayCtrl 1020;
_police_Markers          = _display displayCtrl 1021;
_medic_Markers           = _display displayCtrl 1022;
_basebuild               = _display displayCtrl 1023;
_Gang_Markers            = _display displayCtrl 1024;
_tankstellen_Markers     = _display displayCtrl 1025;
_alle_shops              = _display displayCtrl 1026;
_illegal_shops           = _display displayCtrl 1027;
_legal_shops             = _display displayCtrl 1028;
_LSA_Markers             = _display displayCtrl 1029;
_sonstige_marker         = _display displayCtrl 1030;
_garagen_Marker          = _display displayCtrl 1031;
_DP_Marker               = _display displayCtrl 1032;
_Lizenzen_shops          = _display displayCtrl 1033;
_atm_markers             = _display displayCtrl 1034;
_chopChops               = _display displayCtrl 1035;


ctrlSetText[8888,format["%1:%2", LHM_clock select 3, LHM_clock select 4]];


if(LHM_Marker_all_Farm) then {
	_All_farming_Markers ctrlSetTextColor [0,1,0,1];
	_All_farming_Markers ctrlSetText localize"STR_SM_ON";
	_All_farming_Markers buttonSetAction "[""_All_farming_Markers"",""remove""] call lhm_fnc_hideMarkers; LHM_Marker_all_Farm = false; LHM_Marker_illegal_Farm = false;  LHM_Marker_legal_Farm = false; [] call lhm_fnc_map_Marker_Menu;";

}else {
	_All_farming_Markers ctrlSetTextColor [1,0,0,1];
	_All_farming_Markers ctrlSetText localize"STR_SM_OFF";
	_All_farming_Markers buttonSetAction "[""_All_farming_Markers"",""add""] call lhm_fnc_hideMarkers; LHM_Marker_all_Farm = true;  LHM_Marker_illegal_Farm = true;  LHM_Marker_legal_Farm = true; [] call lhm_fnc_map_Marker_Menu;";
};


if(LHM_Marker_illegal_Farm) then {
	_Illegal_farming_Markers ctrlSetTextColor [0,1,0,1];
	_Illegal_farming_Markers ctrlSetText localize"STR_SM_ON";
	_Illegal_farming_Markers buttonSetAction "[""_Illegal_farming_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_illegal_Farm = false; [] call lhm_fnc_map_Marker_Menu; ";

}else {
	_Illegal_farming_Markers ctrlSetTextColor [1,0,0,1];
	_Illegal_farming_Markers ctrlSetText localize"STR_SM_OFF";
	_Illegal_farming_Markers buttonSetAction "[""_Illegal_farming_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_illegal_Farm = true;if(LHM_Marker_legal_Farm) then {LHM_Marker_all_Farm = true;};  [] call lhm_fnc_map_Marker_Menu;";
};


if(LHM_Marker_legal_Farm) then {
	_Legal_farming_Markers ctrlSetTextColor [0,1,0,1];
	_Legal_farming_Markers ctrlSetText localize"STR_SM_ON";
	_Legal_farming_Markers buttonSetAction "[""_Legal_farming_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_legal_Farm = false; [] call lhm_fnc_map_Marker_Menu; ";

}else {
	_Legal_farming_Markers ctrlSetTextColor [1,0,0,1];
	_Legal_farming_Markers ctrlSetText localize"STR_SM_OFF";
	_Legal_farming_Markers buttonSetAction "[""_Legal_farming_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_legal_Farm = true;if(LHM_Marker_illegal_Farm) then {LHM_Marker_all_Farm = true;};  [] call lhm_fnc_map_Marker_Menu; ";
};


if(LHM_Marker_Police) then {
	_police_Markers ctrlSetTextColor [0,1,0,1];
	_police_Markers ctrlSetText localize"STR_SM_ON";
	_police_Markers buttonSetAction "[""_police_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Police = false;[] call lhm_fnc_map_Marker_Menu; ";

}else {
	_police_Markers ctrlSetTextColor [1,0,0,1];
	_police_Markers ctrlSetText localize"STR_SM_OFF";
	_police_Markers buttonSetAction "[""_police_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Police = true;  [] call lhm_fnc_map_Marker_Menu;";
};


if(LHM_Marker_Medic) then {
	_medic_Markers ctrlSetTextColor [0,1,0,1];
	_medic_Markers ctrlSetText localize"STR_SM_ON";
	_medic_Markers buttonSetAction "[""_medic_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Medic = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_medic_Markers ctrlSetTextColor [1,0,0,1];
	_medic_Markers ctrlSetText localize"STR_SM_OFF";
	_medic_Markers buttonSetAction "[""_medic_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Medic = true; [] call lhm_fnc_map_Marker_Menu; ";
};



if(LHM_Marker_Basen) then {
	_basebuild ctrlSetTextColor [0,1,0,1];
	_basebuild ctrlSetText localize"STR_SM_ON";
	_basebuild buttonSetAction "[""_basebuild"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Basen = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_basebuild ctrlSetTextColor [1,0,0,1];
	_basebuild ctrlSetText localize"STR_SM_OFF";
	_basebuild buttonSetAction "[""_basebuild"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Basen = true; [] call lhm_fnc_map_Marker_Menu; ";
};


if(LHM_Marker_Gang) then {
	_Gang_Markers ctrlSetTextColor [0,1,0,1];
	_Gang_Markers ctrlSetText localize"STR_SM_ON";
	_Gang_Markers buttonSetAction "[""_Gang_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Gang = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_Gang_Markers ctrlSetTextColor [1,0,0,1];
	_Gang_Markers ctrlSetText localize"STR_SM_OFF";
	_Gang_Markers buttonSetAction "[""_Gang_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Gang = true; [] call lhm_fnc_map_Marker_Menu; ";
};




if(LHM_Marker_Tankstellen) then {
	_tankstellen_Markers ctrlSetTextColor [0,1,0,1];
	_tankstellen_Markers ctrlSetText localize"STR_SM_ON";
	_tankstellen_Markers buttonSetAction "[""_tankstellen_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Tankstellen = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_tankstellen_Markers ctrlSetTextColor [1,0,0,1];
	_tankstellen_Markers ctrlSetText localize"STR_SM_OFF";
	_tankstellen_Markers buttonSetAction "[""_tankstellen_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Tankstellen = true;  [] call lhm_fnc_map_Marker_Menu;";
};




if(LHM_Marker_all_Shops) then {
	_alle_shops ctrlSetTextColor [0,1,0,1];
	_alle_shops ctrlSetText localize"STR_SM_ON";
	_alle_shops buttonSetAction "[""_alle_shops"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_all_Shops = false; LHM_Marker_legal_Shops = false; LHM_Marker_illegal_Shops = false; [] call lhm_fnc_map_Marker_Menu;";

}else {
	_alle_shops ctrlSetTextColor [1,0,0,1];
	_alle_shops ctrlSetText localize"STR_SM_OFF";
	_alle_shops buttonSetAction "[""_alle_shops"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_all_Shops = true; LHM_Marker_legal_Shops = true; LHM_Marker_illegal_Shops = true;[] call lhm_fnc_map_Marker_Menu; ";
};


if(LHM_Marker_legal_Shops) then {
	_legal_shops ctrlSetTextColor [0,1,0,1];
	_legal_shops ctrlSetText localize"STR_SM_ON";
	_legal_shops buttonSetAction "[""_legal_shops"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_legal_Shops = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_legal_shops ctrlSetTextColor [1,0,0,1];
	_legal_shops ctrlSetText localize"STR_SM_OFF";
	_legal_shops buttonSetAction "[""_legal_shops"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_legal_Shops = true; if(LHM_Marker_illegal_Shops) then {LHM_Marker_all_Shops = true;}; [] call lhm_fnc_map_Marker_Menu; ";
};

if(LHM_Marker_illegal_Shops) then {
	_illegal_shops ctrlSetTextColor [0,1,0,1];
	_illegal_shops ctrlSetText localize"STR_SM_ON";
	_illegal_shops buttonSetAction "[""_illegal_shops"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_illegal_Shops = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_illegal_shops ctrlSetTextColor [1,0,0,1];
	_illegal_shops ctrlSetText localize"STR_SM_OFF";
	_illegal_shops buttonSetAction "[""_illegal_shops"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_illegal_Shops = true; if(LHM_Marker_legal_Shops) then {LHM_Marker_all_Shops = true;};  [] call lhm_fnc_map_Marker_Menu;";
};




if(LHM_Marker_LSA) then {
	_LSA_Markers ctrlSetTextColor [0,1,0,1];
	_LSA_Markers ctrlSetText localize"STR_SM_ON";
	_LSA_Markers buttonSetAction "[""_LSA_Markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_LSA = false;[] call lhm_fnc_map_Marker_Menu; ";

}else {
	_LSA_Markers ctrlSetTextColor [1,0,0,1];
	_LSA_Markers ctrlSetText localize"STR_SM_OFF";
	_LSA_Markers buttonSetAction "[""_LSA_Markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_LSA = true;  [] call lhm_fnc_map_Marker_Menu;";
};


if(LHM_Marker_Sonstige) then {
	_sonstige_marker ctrlSetTextColor [0,1,0,1];
	_sonstige_marker ctrlSetText localize"STR_SM_ON";
	_sonstige_marker buttonSetAction "[""_sonstige_marker"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Sonstige = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_sonstige_marker ctrlSetTextColor [1,0,0,1];
	_sonstige_marker ctrlSetText localize"STR_SM_OFF";
	_sonstige_marker buttonSetAction "[""_sonstige_marker"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Sonstige = true;  [] call lhm_fnc_map_Marker_Menu;";
};



if(LHM_Marker_Garagen) then {
	_garagen_Marker ctrlSetTextColor [0,1,0,1];
	_garagen_Marker ctrlSetText localize"STR_SM_ON";
	_garagen_Marker buttonSetAction "[""_garagen_Marker"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Garagen = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_garagen_Marker ctrlSetTextColor [1,0,0,1];
	_garagen_Marker ctrlSetText localize"STR_SM_OFF";
	_garagen_Marker buttonSetAction "[""_garagen_Marker"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Garagen = true;  [] call lhm_fnc_map_Marker_Menu;";
};



if(LHM_Marker_DP) then {
	_DP_Marker ctrlSetTextColor [0,1,0,1];
	_DP_Marker ctrlSetText localize"STR_SM_ON";
	_DP_Marker buttonSetAction "[""_DP_Marker"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_DP = false; [] call lhm_fnc_map_Marker_Menu;";

}else {
	_DP_Marker ctrlSetTextColor [1,0,0,1];
	_DP_Marker ctrlSetText localize"STR_SM_OFF";
	_DP_Marker buttonSetAction "[""_DP_Marker"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_DP = true;  [] call lhm_fnc_map_Marker_Menu;";
};


if(LHM_Marker_Lizenzen_shops) then {
	_Lizenzen_shops ctrlSetTextColor [0,1,0,1];
	_Lizenzen_shops ctrlSetText localize"STR_SM_ON";
	_Lizenzen_shops buttonSetAction "[""_Lizenzen_shops"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_Lizenzen_shops = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_Lizenzen_shops ctrlSetTextColor [1,0,0,1];
	_Lizenzen_shops ctrlSetText localize"STR_SM_OFF";
	_Lizenzen_shops buttonSetAction "[""_Lizenzen_shops"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_Lizenzen_shops = true; [] call lhm_fnc_map_Marker_Menu;";
};



if(LHM_Marker_atm) then {
	_atm_markers ctrlSetTextColor [0,1,0,1];
	_atm_markers ctrlSetText localize"STR_SM_ON";
	_atm_markers buttonSetAction "[""_atm_markers"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_atm = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_atm_markers ctrlSetTextColor [1,0,0,1];
	_atm_markers ctrlSetText localize"STR_SM_OFF";
	_atm_markers buttonSetAction "[""_atm_markers"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_atm = true; [] call lhm_fnc_map_Marker_Menu; ";
};


if(LHM_Marker_ChopChop) then {
	_chopChops ctrlSetTextColor [0,1,0,1];
	_chopChops ctrlSetText localize"STR_SM_ON";
	_chopChops buttonSetAction "[""_chopChops"",""remove""] call lhm_fnc_hideMarkers;  LHM_Marker_ChopChop = false;  [] call lhm_fnc_map_Marker_Menu;";

}else {
	_chopChops ctrlSetTextColor [1,0,0,1];
	_chopChops ctrlSetText localize"STR_SM_OFF";
	_chopChops buttonSetAction "[""_chopChops"",""add""] call lhm_fnc_hideMarkers;  LHM_Marker_ChopChop = true;  [] call lhm_fnc_map_Marker_Menu;";
};


