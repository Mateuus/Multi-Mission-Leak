class DWEV_admin_menu {
	idd = 2900;
	name= "DWEV_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_adminMenu;";

	class controlsBackground
	{
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
	};

	class controls {
		class Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Admin Menü";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class Spieler_Liste : DWEV_RscListBox
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn DWEV_fnc_adminQuery";
			x = 0.14;
			y = 0.26;
			w = 0.30;
			h = 0.4;
		};

		class PlayerBInfo : DWEV_RscStructuredText
		{
			idc = 2903;
			text = "";
			colorBackground[] = {0,0,0,0};
			x = 0.46;
			y = 0.26;
			w = 0.4;
			h = 0.4;
		};

		class ctrl_grafik_Spectate: DWEV_RscPicture
		{
			idc = 507029;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_gucken.paa";
			x = 0.38;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_Spectate: DWEV_RscButtonInvisible
		{
			idc = 507030;
			text = "";
			tooltip = "Spieler Zuschauen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call DWEV_fnc_gucken;";
			x = 0.38;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_grafik_Kick: DWEV_RscPicture
		{
			idc = 507031;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.46;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
/*
		class ctrl_button_Kick: DWEV_RscButtonInvisible
		{
			idc = 507032;
			text = "";
			tooltip = "Spieler Kicken";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call DWEV_fnc_adminKick;";
			x = 0.46;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_grafik_ban: DWEV_RscPicture
		{
			idc = 507033;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ban.paa";
			x = 0.54;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_ban: DWEV_RscButtonInvisible
		{
			idc = 507034;
			text = "";
			tooltip = "Spieler Banen (Datenbank)";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;[] call DWEV_fnc_adminBan;";
			x = 0.54;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};
*/
		class ctrl_icon_grafik_schliessen: DWEV_RscPicture
		{
			idc = 507001;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_schliessen.paa";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_button_schliessen: DWEV_RscButtonInvisible
		{
			idc = 507002;
			text = "";
			tooltip = "Admin Menü schließen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.87;
			y = 0.075;
			w = 0.05;
			h = 0.05;
		};

		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet kann nicht ausgeschaltet werden, solange ein Programm läuft";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
	};
};
