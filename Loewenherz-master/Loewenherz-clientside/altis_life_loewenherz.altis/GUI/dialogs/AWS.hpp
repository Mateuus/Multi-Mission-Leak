class AWS {
	idd = 5284;
	name= "AWS";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Background_Verletzungen: lhm_RscText
		{
			idc = 1000;
			x = 0.785466 * safezoneW + safezoneX;
			y = 0.046377 * safezoneH + safezoneY;
			w = 0.189739 * safezoneW;
			h = 0.564259 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};
		
		class BAckground_left: lhm_RscText
		{
			idc = 1001;
			x = 0.0260419 * safezoneW + safezoneX;
			y = 0.0435186 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.638 * safezoneH;
			colorBackground[] = {0, 0, 0, 0.7};
		};
	};
	
	class controls {
		class listbox_verletzungen: lhm_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			onLBselChanged = "[] call lhm_fnc_AWS_lbox_injuries_eventhandler;";
			x = 0.787306 * safezoneW + safezoneX;
			y = 0.08002 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.28989 * safezoneH;
		};
		class str_text_header_verletzungen: lhm_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.787512 * safezoneW + safezoneX;
			y = 0.04988 * safezoneH + safezoneY;
			w = 0.185521 * safezoneW;
			h = 0.0281479 * safezoneH;
		};
		class str_text_beschreibung_verletzungen: lhm_RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.788028 * safezoneW + safezoneX;
			y = 0.3713 * safezoneH + safezoneY;
			w = 0.185 * safezoneW;
			h = 0.231851 * safezoneH;
		};

		class str_text_header_material: lhm_RscStructuredText
		{
			idc = 1102;
			text = "";
			x = 0.0286459 * safezoneW + safezoneX;
			y = 0.0472222 * safezoneH + safezoneY;
			w = 0.185521 * safezoneW;
			h = 0.0281479 * safezoneH;
		};
		class str_text_listbox_materialien: lhm_RscListbox
		{
			idc = 1501;
			sizeEx = 0.040;
			onLBselChanged = "[] call lhm_fnc_AWS_lbox_material_eventhandler;";
			x = 0.0281253 * safezoneW + safezoneX;
			y = 0.0768516 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.28989 * safezoneH;
		};
		class str_text_material_beschreibung: lhm_RscStructuredText
		{
			idc = 1103;
			text = "";
			x = 0.028125 * safezoneW + safezoneX;
			y = 0.367592 * safezoneH + safezoneY;
			w = 0.185 * safezoneW;
			h = 0.231851 * safezoneH;
		};
		class Close_BTN_left: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Close"; //--- ToDo: Localize;
			onbuttonClick = "Closedialog 0;";
			x = 0.0286462 * safezoneW + safezoneX;
			y = 0.653705 * safezoneH + safezoneY;
			w = 0.184479 * safezoneW;
			h = 0.0235184 * safezoneH;
		};
		class BTN_use: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Benutzen"; //--- ToDo: Localize;
			onButtonClick = "[true] spawn lhm_fnc_AWS_use_item;";
			x = 0.0286462 * safezoneW + safezoneX;
			y = 0.602778 * safezoneH + safezoneY;
			w = 0.184479 * safezoneW;
			h = 0.0235184 * safezoneH;
		};
		class BTN_wegwerfen: lhm_RscButtonMenu
		{
			idc = 2402;
			text = "Wegwerfen"; //--- ToDo: Localize;
			onButtonClick = "[false] spawn lhm_fnc_AWS_use_item;";
			x = 0.0286458 * safezoneW + safezoneX;
			y = 0.627778 * safezoneH + safezoneY;
			w = 0.184479 * safezoneW;
			h = 0.0235184 * safezoneH;
		};

		class lhm_RscSlider_1900: lhm_RscXSliderH
		{
			idc = 1900;
			text = "";
			onSliderPosChanged = "LHM_shop_Rotate_speed = (_this select 1) ;";
			tooltip = "Rotationsgeschwindigkeit einstellen";
			x = 0.419271 * safezoneW + safezoneX;
			y = 0.856593 * safezoneH + safezoneY;
			w = 0.152291 * safezoneW;
			h = 0.0348519 * safezoneH;
		};
		
		class BTN_torso: lhm_RscButtonSilent
		{
			idc = 1600;
			tooltip = "Torso";
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Torso</t>"";AWS_chosen = ""torso"";";
			x = 0.464584 * safezoneW + safezoneX;
			y = 0.191667 * safezoneH + safezoneY;
			w = 0.0623953 * safezoneW;
			h = 0.254074 * safezoneH;
		};
		class BTN_left_leg: lhm_RscButtonSilent
		{
			idc = 1601;
			tooltip = "Linkes Bein";
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Linkes Bein</t>"";AWS_chosen = ""l_bein"";";
			x = 0.432186 * safezoneW + safezoneX;
			y = 0.453483 * safezoneH + safezoneY;
			w = 0.0588542 * safezoneW;
			h = 0.392259 * safezoneH;
		};
		class BTN_right_leg: lhm_RscButtonSilent
		{
			idc = 1602;
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Rechtes Bein</t>"";AWS_chosen = ""r_bein"";";
			tooltip = "Rechtes Bein";
			x = 0.498958 * safezoneW + safezoneX;
			y = 0.450001 * safezoneH + safezoneY;
			w = 0.0572916 * safezoneW;
			h = 0.402444 * safezoneH;
		};
		class BTN_right_arm: lhm_RscButtonSilent
		{
			idc = 1603;
			tooltip = "Rechter Arm";
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Rechter Arm</t>"";AWS_chosen = ""r_arm"";";
			x = 0.534374 * safezoneW + safezoneX;
			y = 0.209259 * safezoneH + safezoneY;
			w = 0.0557295 * safezoneW;
			h = 0.239481 * safezoneH;
		};
		class BTN_left_arm: lhm_RscButtonSilent
		{
			idc = 1604;
			tooltip = "Linker Arm";
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Linker Arm</t>"";AWS_chosen = ""l_arm"";";
			x = 0.404167 * safezoneW + safezoneX;
			y = 0.200926 * safezoneH + safezoneY;
			w = 0.0557298 * safezoneW;
			h = 0.245963 * safezoneH;
		};
		class BTN_head: lhm_RscButtonSilent
		{
			idc = 1605;
			tooltip = "Kopf";
			OnButtonClick = "if(AWS_working) exitwith {};disableSerialization;_display = findDisplay 5284; _str_text_beschreibung_welche_region = _display displayCtrl 1104;_str_text_beschreibung_welche_region ctrlSetStructuredText parseText ""<t size='1.3'  align='center'>Ausgewählte Region:</t> <br/><br/> <t size='1.1' align='center'>Kopf</t>""; AWS_chosen = ""kopf"";";
			x = 0.456772 * safezoneW + safezoneX;
			y = 0.0638889 * safezoneH + safezoneY;
			w = 0.0712495 * safezoneW;
			h = 0.115185 * safezoneH;
		};
		class str_text_beschreibung_welche_region: lhm_RscStructuredText
		{
			idc = 1104;
			text = "";
			x = 0.266667 * safezoneW + safezoneX;
			y = 0.559259 * safezoneH + safezoneY;
			w = 0.12875 * safezoneW;
			h = 0.174444 * safezoneH;
		};
		
	};
};