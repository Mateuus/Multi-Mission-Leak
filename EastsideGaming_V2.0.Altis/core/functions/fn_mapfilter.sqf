/*
	Datei: fn_fn_mapfilter.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Hauptfile für die Mapfilter.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©Basti | John Collins 2016
*/
_mode = _this select 0;
_cbcheck = _this select 1;
switch (_mode) do {
	case "felder": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_felder;
			profileNameSpace setVariable ["filter_felder",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_felder;
			profileNameSpace setVariable ["filter_felder",false];
		};
	};
	
	case "verarbeiter": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_verarbeiter;
			profileNameSpace setVariable ["filter_verarbeiter",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_verarbeiter;
			profileNameSpace setVariable ["filter_verarbeiter",false];
		};
	};
	
	case "haendler": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_haendler;
			profileNameSpace setVariable ["filter_haendler",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_haendler;
			profileNameSpace setVariable ["filter_haendler",false];
		};
	};
	
	case "shops": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_shops;
			profileNameSpace setVariable ["filter_shops",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_shops;
			profileNameSpace setVariable ["filter_shops",false];
		};
	};
	
	case "garagen": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_garagen;
			profileNameSpace setVariable ["filter_garagen",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_garagen;
			profileNameSpace setVariable ["filter_garagen",false];
		};
	};
	
	case "dp": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_dp;
			profileNameSpace setVariable ["filter_dp",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_dp;
			profileNameSpace setVariable ["filter_dp",false];
		};
	};
	
	case "cop": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_cop;
			profileNameSpace setVariable ["filter_cop",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_cop;
			profileNameSpace setVariable ["filter_cop",false];
		};
	};
	
	case "med": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_med;
			profileNameSpace setVariable ["filter_med",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_med;
			profileNameSpace setVariable ["filter_med",false];
		};
	};
	
	case "reb": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_reb;
			profileNameSpace setVariable ["filter_reb",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_reb;
			profileNameSpace setVariable ["filter_reb",false];
		};
	};
	
	case "size": {
		{
			if (!(_x in ["marker_3"])) then {
				_x setMarkerSizeLocal [_cbcheck,_cbcheck];
			};
		}foreach allMapMarkers;
	};
	
	case "extra_menu": {
		disableSerialization;
		_pic = ((findDisplay 12) displayCtrl 9865);
		if (!(profileNameSpace getVariable "filter_extra")) then
		{
			_display = findDisplay 12;
			_title_extra = _display ctrlCreate ["RscStructuredText",9999];
			_title_extra ctrlSetPosition [0.123594 * safezoneW + safezoneX,0.544 * safezoneH + safezoneY,0.12375 * safezoneW,0.022 * safezoneH];
			_title_extra ctrlCommit 0;
			_title_extra ctrlSetStructuredText parseText "<t size='1.2'>Extra Kartenfilter</t>";
			_title_extra ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _title_extra;
			_bg = _display ctrlCreate ["RscText",9998];
			_bg ctrlSetPosition [0.123594 * safezoneW + safezoneX,0.566 * safezoneH + safezoneY,0.12375 * safezoneW,0.231 * safezoneH];
			_bg ctrlCommit 0;
			_bg ctrlSetBackgroundColor [-1,-1,-1,0.5];
			menu_extra_filter pushBack _bg;
			_txt_atm = _display ctrlCreate ["RscStructuredText",9997];
			_txt_atm ctrlSetPosition [0.12875 * safezoneW + safezoneX,0.577 * safezoneH + safezoneY,0.0876563 * safezoneW,0.022 * safezoneH];
			_txt_atm ctrlCommit 0;
			_txt_atm ctrlSetStructuredText parseText "<t size='1.2'>Bankautomaten</t>";
			_txt_atm ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _txt_atm;
			_txt_tanke = _display ctrlCreate ["RscStructuredText",9996];
			_txt_tanke ctrlSetPosition [0.12875 * safezoneW + safezoneX,0.621 * safezoneH + safezoneY,0.0876563 * safezoneW,0.022 * safezoneH];
			_txt_tanke ctrlCommit 0;
			_txt_tanke ctrlSetStructuredText parseText "<t size='1.2'>Tankstellen</t>";
			_txt_tanke ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _txt_tanke;
			_txt_sons = _display ctrlCreate ["RscStructuredText",9995];
			_txt_sons ctrlSetPosition [0.12875 * safezoneW + safezoneX,0.665 * safezoneH + safezoneY,0.0876563 * safezoneW,0.022 * safezoneH];
			_txt_sons ctrlCommit 0;
			_txt_sons ctrlSetStructuredText parseText "<t size='1.2'>Sonstiges</t>";
			_txt_sons ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _txt_sons;
			_txt_lh = _display ctrlCreate ["RscStructuredText",9994];
			_txt_lh ctrlSetPosition [0.12875 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0876563 * safezoneW,0.022 * safezoneH];
			_txt_lh ctrlCommit 0;
			_txt_lh ctrlSetStructuredText parseText "<t size='1.2'>Legale Händler</t>";
			_txt_lh ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _txt_lh;
			_txt_Ih = _display ctrlCreate ["RscStructuredText",9993];
			_txt_Ih ctrlSetPosition [0.12875 * safezoneW + safezoneX,0.753 * safezoneH + safezoneY,0.0876563 * safezoneW,0.022 * safezoneH];
			_txt_Ih ctrlCommit 0;
			_txt_Ih ctrlSetStructuredText parseText "<t size='1.2'>Illegale Händler</t>";
			_txt_Ih ctrlSetBackgroundColor [0.753,0.145,0.145,1];
			menu_extra_filter pushBack _txt_Ih;
			
			_cb_atm = _display ctrlCreate ["RscCheckbox",9992];
			_cb_atm ctrlSetPosition [0.226719 * safezoneW + safezoneX,0.577 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
			_cb_atm ctrlCommit 0;
			_cb_atm cbSetChecked (profileNameSpace getVariable ["filter_atm",true]);
			_cb_atm ctrlAddEventHandler ["CheckedChanged","['atm',_this select 1]spawn life_fnc_mapfilter"];
			menu_extra_filter pushBack _cb_atm;
			_cb_tanke = _display ctrlCreate ["RscCheckbox",9991];
			_cb_tanke ctrlSetPosition [0.226719 * safezoneW + safezoneX,0.621 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
			_cb_tanke ctrlCommit 0;
			_cb_tanke cbSetChecked (profileNameSpace getVariable ["filter_tanke",true]);
			_cb_tanke ctrlAddEventHandler ["CheckedChanged","['tanke',_this select 1]spawn life_fnc_mapfilter"];
			menu_extra_filter pushBack _cb_tanke;
			_cb_sons = _display ctrlCreate ["RscCheckbox",9990];
			_cb_sons ctrlSetPosition [0.226719 * safezoneW + safezoneX,0.665 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
			_cb_sons ctrlCommit 0;
			_cb_sons cbSetChecked (profileNameSpace getVariable ["filter_sons",true]);
			_cb_sons ctrlAddEventHandler ["CheckedChanged","['sonstiges',_this select 1]spawn life_fnc_mapfilter"];
			menu_extra_filter pushBack _cb_sons;
			_cb_lh = _display ctrlCreate ["RscCheckbox",9989];
			_cb_lh ctrlSetPosition [0.226719 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
			_cb_lh ctrlCommit 0;
			_cb_lh cbSetChecked (profileNameSpace getVariable ["filter_legalH",true]);
			_cb_lh ctrlAddEventHandler ["CheckedChanged","['legalH',_this select 1]spawn life_fnc_mapfilter"];
			menu_extra_filter pushBack _cb_lh;
			_cb_Ih = _display ctrlCreate ["RscCheckbox",9988];
			_cb_Ih ctrlSetPosition [0.226719 * safezoneW + safezoneX,0.753 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
			_cb_Ih ctrlCommit 0;
			_cb_Ih cbSetChecked (profileNameSpace getVariable ["filter_illegalH",true]);
			_cb_Ih ctrlAddEventHandler ["CheckedChanged","['illegalH',_this select 1]spawn life_fnc_mapfilter"];
			menu_extra_filter pushBack _cb_Ih;
			
			profileNameSpace setVariable ["filter_extra",true];
			_pic ctrlSetText "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_left_ca.paa";
		}
		else
		{
			{
				ctrlDelete _x;
			} foreach menu_extra_filter;
			profileNameSpace setVariable ["filter_extra",false];
			_pic ctrlSetText "a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_right_ca.paa";
		};
	};
	
	case "atm": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_atm;
			profileNameSpace setVariable ["filter_atm",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_atm;
			profileNameSpace setVariable ["filter_atm",false];
		};
	};
	
	case "tanke": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_tanke;
			profileNameSpace setVariable ["filter_tanke",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_tanke;
			profileNameSpace setVariable ["filter_tanke",false];
		};
	};
	
	case "sonstiges": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_sonstige;
			profileNameSpace setVariable ["filter_sons",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_sonstige;
			profileNameSpace setVariable ["filter_sons",false];
		};
	};
	
	case "legalH": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_legaleH;
			profileNameSpace setVariable ["filter_legalH",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_legaleH;
			profileNameSpace setVariable ["filter_legalH",false];
		};
	};
	
	case "illegalH": {
		if (_cbcheck isEqualTo 1) then {
			{
				_x setMarkerAlphaLocal 1;
			}foreach marker_illegaleH;
			profileNameSpace setVariable ["filter_illegalH",true];
		}
		else
		{
			{
				_x setMarkerAlphaLocal 0;
			}foreach marker_illegaleH;
			profileNameSpace setVariable ["filter_illegalH",false];
		};
	};
};