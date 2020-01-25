class hst_life_core_tabletVisa {
	idd = 61301;
	name= "hst_life_core_tabletVisa";
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
		class nameInput: Life_RscEdit {
			idc = 3001;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.06;
			w = 0.25;
			h = 0.04;
		};
		class nameTitle: Life_RscText {
			idc = -1;
			text = "Imie:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.06;
			w = 0.5;
			h = 0.04;
		};
		class surnameInput: Life_RscEdit {
			idc = 3002;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.12;
			w = 0.25;
			h = 0.04;
		};
		class surnameTitle: Life_RscText {
			idc = -1;
			text = "Nazwisko:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.12;
			w = 0.5;
			h = 0.04;
		};
		class fatherInput: Life_RscEdit {
			idc = 3003;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.18;
			w = 0.25;
			h = 0.04;
		};
		class fatherTitle: Life_RscText {
			idc = -1;
			text = "Imie ojca:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.18;
			w = 0.5;
			h = 0.04;
		};
		class motherInput: Life_RscEdit {
			idc = 3004;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.24;
			w = 0.25;
			h = 0.04;
		};
		class motherTitle: Life_RscText {
			idc = -1;
			text = "Imie matki:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.24;
			w = 0.5;
			h = 0.04;
		};
		class motherSurnameInput: Life_RscEdit {
			idc = 3005;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.30;
			w = 0.25;
			h = 0.04;
		};
		class motherSurnameTitle: Life_RscText {
			idc = -1;
			text = "Nazwisko panienskie matki:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.30;
			w = 0.5;
			h = 0.04;
		};
		class peselInput: Life_RscEdit {
			idc = 3006;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.36;
			w = 0.25;
			h = 0.04;
		};
		class peselTitle: Life_RscText {
			idc = -1;
			text = "PESEL:";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.36;
			w = 0.5;
			h = 0.04;
		};
		class birthInput: Life_RscEdit {
			idc = 3007;
			text = "";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.3;
			y = TABLET_GRID_Y + 0.42;
			w = 0.25;
			h = 0.04;
		};
		class birthTitle: Life_RscText {
			idc = -1;
			text = "Data urodzenia (dd.mm.rr):";
			style = 1;
			x = TABLET_GRID_X + 0.025;
			y = TABLET_GRID_Y + 0.42;
			w = 0.5;
			h = 0.04;
		};
		class buttonAdd: Life_RscButton {
			idc = 3008;
			type = 1;
			text = "Dodaj";
			action = "[] spawn hst_life_core_fnc_visaCreate;";
			x = (TABLET_GRID_X + TABLET_WIDTH) - 0.30;
			y = (TABLET_GRID_Y + TABLET_HEIGHT) - 0.08;
			w = 0.15;
			h = 0.06;
		};
		class buttonExit: Life_RscButton {
			idc = 3009;
			type = 1;
			text = "Anuluj";
			action = "closeDialog 0;";
			x = (TABLET_GRID_X + TABLET_WIDTH) - 0.13;
			y = (TABLET_GRID_Y + TABLET_HEIGHT) - 0.08;
			w = 0.10;
			h = 0.06;
		};
	};
};