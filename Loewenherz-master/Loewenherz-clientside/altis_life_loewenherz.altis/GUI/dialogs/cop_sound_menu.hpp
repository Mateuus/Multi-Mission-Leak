class cop_sound_menu {
	idd = 8735;
	name= "cop_sound_menu";
	movingEnable = false;
	enableSimulation = false;

	class controlsBackground {
		class MainBackground: lhm_RscText
		{
			idc = -1;
			x = 0.3375;
			y = 0.141683;
			w = 0.293813;
			h = 0.611986;
			colorBackground[] = {0,0,0,0.3};
		};
		class TEXT_HEADER: lhm_RscText
		{
			idc = -1;
			text = "Loewenherz Cops"; //--- ToDo: Localize;
			x = 0.337501;
			y = 0.1;
			w = 0.293813;
			h = 0.0416836;
			colorBackground[] = {0,0,0,0.5};
		};

	};

	class controls {
		class Listbox_spngs: lhm_RscListbox
		{
			idc = 1500;
			sizeEX = 0.040;
			onLBDblClick = "disableSerialization;if(isnull (findDisplay 8735)) exitWith {hint ""Fehler: Falsches Display""};_display = findDisplay 8735;_listbox = _display displayCtrl 1500;if(lbCurSel _listbox == -1) exitWith {hint ""Du hast Nichts ausgewählt!""};_what = _listbox lbvalue (lbCurSel _listbox);_temp = LHM_Police_sounds select _what;_code = compile (_temp select 1);[] call _code; closeDialog 0;";
			x = 0.347726;
			y = 0.146936;
			w = 0.274999;
			h = 0.54;
		};
		class BTN_ABSPIELEN: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Abspielen"; //--- ToDo: Localize;
			x = 0.487626;
			y = 0.687811;
			w = 0.132575;
			h = 0.0568351;
		};
		class BTN_CLOSE: lhm_RscButtonMenu
		{
			idc = 2401;
			OnButtonClick = "CloseDialog 0;";
			text = "Close"; //--- ToDo: Localize;
			x = 0.347854;
			y = 0.688013;
			w = 0.132954;
			h = 0.0551515;
		};

	};
};