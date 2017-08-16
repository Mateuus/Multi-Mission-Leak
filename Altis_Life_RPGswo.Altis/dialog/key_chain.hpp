class DWEV_key_management {
	idd = 2700;
	name= "DWEV_key_chain";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton; [] spawn DWEV_fnc_keyMenu;";

	class controlsBackground {
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
			text = "Schlüsselbund";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;
		};

		class KeyChainList : DWEV_RscListBox
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 2701;
			text = "";
			sizeEx = 0.030; //0.035
			x = 0.22;
			y = 0.26;
			w = 0.56;
			h = 0.370;
		};

		class NearPlayers : DWEV_RscCombo
		{
			idc = 2702;
			x = 0.3625;
			y = 0.645;
			w = 0.275;
			h = 0.03;
		};

		class ctrl_grafik_keygeben: DWEV_RscPicture
		{
			idc = 507005;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_ok.paa";
			x = 0.630;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_keygeben: DWEV_RscButtonInvisible
		{
			idc = 507006;
			text = "";
			tooltip = "Schlüssel geben";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_keyGive";
			x = 0.630;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_grafik_DropKey: DWEV_RscPicture
		{
			idc = 507007;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_nein.paa";
			x = 0.270;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

		class ctrl_button_DropKey: DWEV_RscButtonInvisible
		{
			idc = 507008;
			text = "";
			tooltip = "Schlüssel wegwerfen";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "[] call DWEV_fnc_keyDrop";
			x = 0.270;
			y = 0.69;
			w = 0.075;
			h = 0.075;
		};

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
			tooltip = "Schlüsselbund schließen";
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
