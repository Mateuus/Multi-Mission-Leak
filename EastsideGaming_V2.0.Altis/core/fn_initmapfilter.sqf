/*
	Datei: fn_initfn_mapfilter.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Initialisiert die Mapfilter.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©Basti | John Collins 2016
*/
marker_felder = [];
marker_verarbeiter = [];
marker_haendler = [];
marker_shops = [];
marker_dp = [];
marker_garagen = [];
marker_cop = [];
marker_med = [];
marker_reb = [];
marker_all = [];
marker_all1 = [];
marker_sonstige = [];
marker_atm = [];
marker_tanke = [];
marker_legaleH = [];
marker_illegaleH = [];
menu_extra_filter = [];
profileNameSpace setVariable ["filter_extra",false];
{
	marker_felder pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_felder"));

{
	marker_verarbeiter pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_verarbeiter"));
{
	marker_haendler pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_haendler"));
{
	marker_shops pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_shops"));
{
	marker_dp pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_dp"));
{
	marker_garagen pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_garagen"));
{
	marker_cop pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_cop"));
{
	marker_med pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_med"));
{
	marker_reb pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_reb"));
{
	if (MarkerType _x isEqualTo "loc_Fuelstation") then {
		marker_tanke pushback _x;
		marker_all1 pushBack _x;
	};
} foreach allMapMarkers;
{
	marker_legaleH pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_Hlegal"));
{
	marker_illegaleH pushback _x;
} foreach (getArray(missionConfigFile >> "CfgInfos" >> "MapFilter" >> "m_Hillegal"));
{
	if (MarkerType _x isEqualTo "loc_Tourism") then {
		marker_atm pushback _x;
		marker_all1 pushback _x;
	};
} foreach allMapMarkers;
{
    marker_all1 append getArray _x;
} forEach (configProperties [missionConfigFile >> "CfgInfos" >> "MapFilter", "isArray _x"]);
{
	if ((!(_x in marker_all1)) && (!(_x isEqualto "safezone_1"))) then {
		marker_sonstige pushback _x;
	};
} foreach allMapMarkers;
marker_all = marker_all1 + marker_sonstige;
disableSerialization;
_display = finddisplay 12;
_bg = _display ctrlCreate ["RscText",-1];
_bg ctrlSetPosition [-0.000156274 * safezoneW + safezoneX,0.412 * safezoneH + safezoneY,0.12375 * safezoneW,0.385 * safezoneH];
_bg ctrlCommit 0;
_bg ctrlSetBackgroundColor [-1,-1,-1,0.5];

_title = _display ctrlCreate ["RscStructuredText",-1];
_title ctrlSetPosition [-0.000156274 * safezoneW + safezoneX,0.39 * safezoneH + safezoneY,0.12375 * safezoneW,0.022 * safezoneH];
_title ctrlCommit 0;
_title ctrlSetStructuredText parseText "<t size='1.2'>Kartenfilter | ES-G.de</t>";
_title ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_felder = _display ctrlCreate ["RscStructuredText",-1];
_txt_felder ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.434 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_felder ctrlCommit 0;
_txt_felder ctrlSetStructuredText parseText "<t size='1.2'>Resourcen</t>";
_txt_felder ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_verarbeiter = _display ctrlCreate ["RscStructuredText",-1];
_txt_verarbeiter ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.467 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_verarbeiter ctrlCommit 0;
_txt_verarbeiter ctrlSetStructuredText parseText "<t size='1.2'>Verarbeiter</t>";
_txt_verarbeiter ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_haendler = _display ctrlCreate ["RscStructuredText",-1];
_txt_haendler ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.5 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_haendler ctrlCommit 0;
_txt_haendler ctrlSetStructuredText parseText "<t size='1.2'>Händler</t>";
_txt_haendler ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_garagen = _display ctrlCreate ["RscStructuredText",-1];
_txt_garagen ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.566 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_garagen ctrlCommit 0;
_txt_garagen ctrlSetStructuredText parseText "<t size='1.2'>Garagen</t>";
_txt_garagen ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_shops = _display ctrlCreate ["RscStructuredText",-1];
_txt_shops ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.533 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_shops ctrlCommit 0;
_txt_shops ctrlSetStructuredText parseText "<t size='1.2'>Shops</t>";
_txt_shops ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_dp = _display ctrlCreate ["RscStructuredText",-1];
_txt_dp ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.599 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_dp ctrlCommit 0;
_txt_dp ctrlSetStructuredText parseText "<t size='1.2'>DP Missionen</t>";
_txt_dp ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_cop = _display ctrlCreate ["RscStructuredText",-1];
_txt_cop ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.632 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_cop ctrlCommit 0;
_txt_cop ctrlSetStructuredText parseText "<t size='1.2'>Polizei</t>";
_txt_cop ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_med = _display ctrlCreate ["RscStructuredText",-1];
_txt_med ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.665 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_med ctrlCommit 0;
_txt_med ctrlSetStructuredText parseText "<t size='1.2'>Medic</t>";
_txt_med ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_reb = _display ctrlCreate ["RscStructuredText",-1];
_txt_reb ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.698 * safezoneH + safezoneY, 0.0876563 * safezoneW, 0.022 * safezoneH];
_txt_reb ctrlCommit 0;
_txt_reb ctrlSetStructuredText parseText "<t size='1.2'>Rebellen</t>";
_txt_reb ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_txt_size = _display ctrlCreate ["RscStructuredText",-1];
_txt_size ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.731 * safezoneH + safezoneY, 0.113437 * safezoneW, 0.022 * safezoneH];
_txt_size ctrlCommit 0;
_txt_size ctrlSetStructuredText parseText "<t size='1.2'>Größe der Marker:</t>";
_txt_size ctrlSetBackgroundColor [0.753,0.145,0.145,1];

_btn_extra = _display ctrlCreate ["RscButtonMenu",-1];
_btn_extra ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0154688 * safezoneW,0.011 * safezoneH];
_btn_extra ctrlCommit 0;
_btn_extra ctrlSetBackgroundColor [0.753,0.145,0.145,1];
_btn_extra ctrlAddEventHandler ["ButtonClick","['extra_menu',0]spawn life_fnc_mapfilter"];

_pic_extra = _display ctrlCreate ["RscPicture",9865];
_pic_extra ctrlSetPosition [0.108125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0154688 * safezoneW,0.011 * safezoneH];
_pic_extra ctrlCommit 0;
_pic_extra ctrlSetText "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_right_ca.paa";

_cb_felder = _display ctrlCreate ["RscCheckbox",-1];
_cb_felder ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.434 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_felder ctrlCommit 0;
_cb_felder cbSetChecked (profileNameSpace getVariable ["filter_felder",true]);
_cb_felder ctrlAddEventHandler ["CheckedChanged","['felder',_this select 1]spawn life_fnc_mapfilter"];

_cb_verarbeiter = _display ctrlCreate ["RscCheckbox",-1];
_cb_verarbeiter ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.467 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_verarbeiter ctrlCommit 0;
_cb_verarbeiter cbSetChecked (profileNameSpace getVariable ["filter_verarbeiter",true]);
_cb_verarbeiter ctrlAddEventHandler ["CheckedChanged","['verarbeiter',_this select 1]spawn life_fnc_mapfilter"];

_cb_haendler = _display ctrlCreate ["RscCheckbox",-1];
_cb_haendler ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.5 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_haendler ctrlCommit 0;
_cb_haendler cbSetChecked (profileNameSpace getVariable ["filter_haendler",true]);
_cb_haendler ctrlAddEventHandler ["CheckedChanged","['haendler',_this select 1]spawn life_fnc_mapfilter"];

_cb_shops = _display ctrlCreate ["RscCheckbox",-1];
_cb_shops ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.533 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_shops ctrlCommit 0;
_cb_shops cbSetChecked (profileNameSpace getVariable ["filter_shops",true]);
_cb_shops ctrlAddEventHandler ["CheckedChanged","['shops',_this select 1]spawn life_fnc_mapfilter"];

_cb_garagen = _display ctrlCreate ["RscCheckbox",-1];
_cb_garagen ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.566 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_garagen ctrlCommit 0;
_cb_garagen cbSetChecked (profileNameSpace getVariable ["filter_garagen",true]);
_cb_garagen ctrlAddEventHandler ["CheckedChanged","['garagen',_this select 1]spawn life_fnc_mapfilter"];

_cb_dp = _display ctrlCreate ["RscCheckbox",-1];
_cb_dp ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.599 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_dp ctrlCommit 0;
_cb_dp cbSetChecked (profileNameSpace getVariable ["filter_dp",true]);
_cb_dp ctrlAddEventHandler ["CheckedChanged","['dp',_this select 1]spawn life_fnc_mapfilter"];

_cb_cop = _display ctrlCreate ["RscCheckbox",-1];
_cb_cop ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.632 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_cop ctrlCommit 0;
_cb_cop cbSetChecked (profileNameSpace getVariable ["filter_cop",true]);
_cb_cop ctrlAddEventHandler ["CheckedChanged","['cop',_this select 1]spawn life_fnc_mapfilter"];

_cb_med = _display ctrlCreate ["RscCheckbox",-1];
_cb_med ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.665 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_med ctrlCommit 0;
_cb_med cbSetChecked (profileNameSpace getVariable ["filter_med",true]);
_cb_med ctrlAddEventHandler ["CheckedChanged","['med',_this select 1]spawn life_fnc_mapfilter"];

_cb_reb = _display ctrlCreate ["RscCheckbox",-1];
_cb_reb ctrlSetPosition [0.0978125 * safezoneW + safezoneX, 0.698 * safezoneH + safezoneY, 0.0154688 * safezoneW, 0.022 * safezoneH];
_cb_reb ctrlCommit 0;
_cb_reb cbSetChecked (profileNameSpace getVariable ["filter_reb",true]);
_cb_reb ctrlAddEventHandler ["CheckedChanged","['reb',_this select 1]spawn life_fnc_mapfilter"];

_slider_size = _display ctrlCreate ["RscSlider",-1];
_slider_size ctrlSetPosition [0.00499997 * safezoneW + safezoneX, 0.764 * safezoneH + safezoneY, 0.108281 * safezoneW, 0.022 * safezoneH];
_slider_size ctrlCommit 0;
_slider_size ctrlAddEventHandler ["SliderPosChanged","['size',_this select 1]spawn life_fnc_mapfilter"];
_slider_size sliderSetRange [0.1, 2];
_slider_size sliderSetPosition 1;