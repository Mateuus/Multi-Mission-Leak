class BA_admin_menu_extended {
	idd = 9858;
	name= "BA_admin_menu_extended";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "";

	class controlsBackground {
		class Background_left_side: lhm_RscText
		{
			idc = 1000;
			x = -0.00531252 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.621458 * safezoneW;
			h = 1.03093 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Background_right_side_hide: lhm_RscText
		{
			idc = 1001;
			x = 0.615624 * safezoneW + safezoneX;
			y = -0.00555577 * safezoneH + safezoneY;
			w = 0.406354 * safezoneW;
			h = 0.595741 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};

	class controls {
		class allplayers: lhm_RscListbox
		{
			idc = 1500;
			sizeEx = 0.040;
			x = 0.0317094 * safezoneW + safezoneX;
			y = 0.113179 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.823741 * safezoneH;
		};
		class Header_alle_spieler: lhm_RscStructuredText
		{
			idc = 1100;
			x = 0.032031 * safezoneW + safezoneX;
			y = 0.06263 * safezoneH + safezoneY;
			w = 0.15974 * safezoneW;
			h = 0.022926 * safezoneH;
		};
		class TextFeld_suche_spieler: lhm_RscEdit
		{
			idc = 1400;
			text = "";
			onkeydown = "[] call lhm_fnc_new_admin_menu_search_listbox;";
			x = 0.0317707 * safezoneW + safezoneX;
			y = 0.0861111 * safezoneH + safezoneY;
			w = 0.159636 * safezoneW;
			h = 0.0237408 * safezoneH;
		};
		class BTN_refresh_players: lhm_RscButtonMenu
		{
			idc = 2400;
			text = "Aktualisieren!"; //--- ToDo: Localize;
			onButtonClick = "[] call lhm_fnc_new_admin_menu_refresh_players;";
			x = 0.0317707 * safezoneW + safezoneX;
			y = 0.936815 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.0209629 * safezoneH;
		};
		class All_skripts_LB: lhm_RscListbox
		{
			idc = 1501;
			onLBDblClick = "[] call lhm_fnc_new_admin_menu_switch_do;";
			sizeEx = 0.040;
			x = 0.215885 * safezoneW + safezoneX;
			y = 0.0919627 * safezoneH + safezoneY;
			w = 0.191198 * safezoneW;
			h = 0.844815 * safezoneH;
		};
		class Header_skripts: lhm_RscStructuredText
		{
			idc = 1101;
			x = 0.216303 * safezoneW + safezoneX;
			y = 0.0670747 * safezoneH + safezoneY;
			w = 0.190729 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class Header_modus: lhm_RscStructuredText
		{
			idc = 1102;
			x = 0.423959 * safezoneW + safezoneX;
			y = 0.0685185 * safezoneH + safezoneY;
			w = 0.190208 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class Listbox_modus: lhm_RscListbox
		{
			idc = 1502;
			onLBDblClick = "[] call lhm_fnc_new_admin_menu_mode_dbl_click;";
			sizeEx = 0.040;
			x = 0.423959 * safezoneW + safezoneX;
			y = 0.0935187 * safezoneH + safezoneY;
			w = 0.190157 * safezoneW;
			h = 0.213333 * safezoneH;
		};
		class Header_gespeicherte_skripts: lhm_RscStructuredText
		{
			idc = 1103;
			x = 0.423853 * safezoneW + safezoneX;
			y = 0.310185 * safezoneH + safezoneY;
			w = 0.190833 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		class lb_gespreicherte_skripts: lhm_RscListbox
		{
			idc = 1503;
			sizeEx = 0.040;
			onLBDblClick = "[] spawn lhm_fnc_new_admin_menu_exec_Code_custom;";
			x = 0.422916 * safezoneW + safezoneX;
			y = 0.337963 * safezoneH + safezoneY;
			w = 0.190157 * safezoneW;
			h = 0.213333 * safezoneH;
		};
		class INFO_TEXT: lhm_RscStructuredText
		{
			idc = 1104;
			x = 0.423437 * safezoneW + safezoneX;
			y = 0.556481 * safezoneH + safezoneY;
			w = 0.190313 * safezoneW;
			h = 0.37663 * safezoneH;
		};
		class EDIT_Skripts: lhm_RscEdit
		{
			idc = 1401;
			type = 2;
			style = 16;
			text = "";
			x = 0.618958 * safezoneW + safezoneX;
			y = 0.0953703 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.451 * safezoneH;
		};
		class Header_konsole: lhm_RscStructuredText
		{
			idc = 1105;
			x = 0.61875 * safezoneW + safezoneX;
			y = 0.0694444 * safezoneH + safezoneY;
			w = 0.370937 * safezoneW;
			h = 0.0235185 * safezoneH;
		};
		class BTN_LOCAL: lhm_RscButtonMenu
		{
			idc = 2401;
			text = "Lokal"; //--- ToDo: Localize;
			OnButtonClick = "[] call lhm_fnc_new_admin_menu_doCode;";
			x = 0.618645 * safezoneW + safezoneX;
			y = 0.550148 * safezoneH + safezoneY;
			w = 0.0588542 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		class BTN_Server: lhm_RscButtonMenu
		{
			idc = 2402;
			text = "Server"; //--- ToDo: Localize;
			x = 0.68177 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.0619792 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		class BTN_REmote: lhm_RscButtonMenu
		{
			idc = 2403;
			text = "Remote"; //--- ToDo: Localize;
			x = 0.747916 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.0619792 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		class BTN_Clear_console: lhm_RscButtonMenu
		{
			idc = 2404;
			text = "Clear Console"; //--- ToDo: Localize;
			onButtonClick = "[] call lhm_fnc_new_admin_menu_clearCode;";
			x = 0.890104 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		class BTN_save_skript: lhm_RscButtonMenu
		{
			idc = 2405;
			text = "Save Code"; //--- ToDo: Localize;
			OnButtonClick = "[] spawn lhm_fnc_new_admin_menu_open_save_skript_menu;";
			x = 0.819271 * safezoneW + safezoneX;
			y = 0.550926 * safezoneH + safezoneY;
			w = 0.0619792 * safezoneW;
			h = 0.0320741 * safezoneH;
		};
		class Insignia: lhm_RscStructuredText
		{
			idc = 1106;
			x = 0.795313 * safezoneW + safezoneX;
			y = 0.972926 * safezoneH + safezoneY;
			w = 0.206354 * safezoneW;
			h = 0.0246667 * safezoneH;
		};


	};
};