class hst_life_core_tabletVisaSelect {
	idd = 61304;
	name= "hst_life_core_tabletVisaSelect";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	class controlsBackground {
		class MainBackground : Life_RscPicture {
			text = "\hst_life_core\images\tablet.paa";
			idc = -1;
			style = "2096";
			x = TABLET_GRID_X - 0.08;
			y = TABLET_GRID_Y - 0.32;
			w = TABLET_WIDTH + 0.165;
			h = TABLET_HEIGHT + 0.64;
		};
		class TabletBackground: Life_RscText {
			idc = -1;
			x = TABLET_GRID_X;
			y = TABLET_GRID_Y;
			w = TABLET_WIDTH;
			h = TABLET_HEIGHT;
			colorBackground[] = {0,0,0,0.7};
			text = "";
		};
	};
	class controls {
		class visaList: Life_RscListBox {
			idc = 3001;
			x = TABLET_GRID_X + 0.03;
			y = TABLET_GRID_Y + 0.03;
			w = (TABLET_WIDTH - 0.06) / 2;
			h = TABLET_HEIGHT - 0.06;
		};
		class visaInfo: Life_RscText {
			idc = 3002;
			text = "TEST TEST TEST";
			style = 16;
			x = TABLET_GRID_X + (TABLET_WIDTH / 2) + 0.03;
			y = TABLET_GRID_Y + 0.03;
			w = (TABLET_WIDTH - 0.06) / 2;
			h = (TABLET_HEIGHT / 2) - 0.06;
		};
		class previewButton: Life_RscButton {
			idc = 3003;
			type = 1;
			text = "Podglad";
			action = "hint 'Todo';";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.24;
			y = TABLET_GRID_Y + TABLET_HEIGHT - 0.07;
			w = 0.10;
			h = 0.05;
		};
		class giveButton: Life_RscButton {
			idc = 3004;
			type = 1;
			text = "Przekaz";
			action = "[cursorTarget, lbData[3001, (lbCurSel 3001)]] spawn hst_life_core_fnc_visaGive";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.36;
			y = TABLET_GRID_Y + TABLET_HEIGHT - 0.07;
			w = 0.10;
			h = 0.05;
		};
		class exitButton: Life_RscButton {
			idc = 3005;
			type = 1;
			action = "closeDialog 0;";
			text = "Wyjscie";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.12;
			y = TABLET_GRID_Y + TABLET_HEIGHT - 0.07;
			w = 0.10;
			h = 0.05;
		};
	};
};