class life_loadoutsPanel {
	idd = 4000;
	name= "life_loadoutsPanel";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] spawn life_fnc_loadoutMenu;";

	class controlsBackground {
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x=safezoneX;
			y=safezoneY;
			w=safezoneW;
			h=safezoneH;
		};

		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = { 128, 108, 0 };
			idc = -1;
			x = safezoneX + safezoneW / 4;
			y = safezoneY + safezoneH / 6;
			w = safezoneW / 2;
			h = 0.04;
		};

		class Life_RscTitleBackgroundLoadouts : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			sizeEx = 0.03;
			x = safezoneX + (safezoneW / 2);
			y = safezoneY + (safezoneH / 6) + 0.04;
			w = safezoneW / 4;
			h = safezoneH * 0.455 - 0.04;
		};
	};

	class controls {

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			color[] = {0,0,0, 1.0};
			idc = -1;
			text = "Police Loadouts";
			x = safezoneX + safezoneW / 4;
			y = safezoneY + safezoneH / 6;
			w = safezoneW / 2;
			h = 0.04;
		};

		class TitleName : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4001;
			x = safezoneX + 0.2;
			y = safezoneY;
			w = 0.2;
			h = 0.04;
		};

		class TitleLoadoutName : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			color[] = {0,0,0, 1.0};
			idc = -1;
			text = "Loadout Name";
			x = safezoneX + (safezoneW / 2) + 0.013;
			y = safezoneY + (safezoneH / 6) + 0.05;
			w = safezoneW / 2;
			h = 0.04;
		};

		class LoadoutList : Life_RscListBox
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 4002;
			sizeEx = 0.04;
			rowHeight=0;
			x = safezoneX + (safezoneW / 4);
			y = safezoneY + (safezoneH / 6) + 0.04;
			w = safezoneW / 4;
			h = safezoneH * 0.455 - 0.041;
		};

		//Buttons

		class LoadoutSaveFunctions : Life_RscButtonMenu {
			colorBackground[] = { 214, 182, 0 };
			color[] = {0,0,0, 1.0};
			idc = 4003;
			text = "Save current loadout";
			onButtonClick = " [] spawn life_fnc_saveLoadout;";
			x = safezoneX + (safezoneW / 2) + 0.02;
			y = safezoneY + (safezoneH / 6) + 0.14;
			w = 0.5;
			h = 0.04;
		};

		class LoadoutLoadFunctions : Life_RscButtonMenu {
			colorBackground[] = { 128, 108, 0 };
			color[] = {0,0,0, 1.0};
			idc = 4004;
			text = "Load selected loadout";
			onButtonClick = " [] spawn life_fnc_loadLoadout;";
			x = safezoneX + (safezoneW / 2) + 0.02;
			y = safezoneY + (safezoneH / 6) + 0.19;
			w = 0.5;
			h = 0.04;
		};

		class LoadoutDeleteFunctions : Life_RscButtonMenu {
			colorBackground[] = { 128, 108, 0 };
			color[] = {0,0,0, 1.0};
			idc = 4005;
			text = "Delete selected loadout";
			onButtonClick = " [] spawn life_fnc_deleteLoadout;";
			x = safezoneX + (safezoneW / 2) + 0.02;
			y = safezoneY + (safezoneH / 6) + 0.24;
			w = 0.5;
			h = 0.04;
		};

		class Close : Life_RscButtonMenu {
			colorBackground[] = { 128, 108, 0 };
			color[] = {0,0,0, 1.0};
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = safezoneX + (safezoneW / 2) + 0.02;
			y = safezoneY + (safezoneH / 6) + 0.29;
			w = 0.5;
			h = 0.04;
		};

		class AdminLoadoutsText : Life_RscEdit {
			idc = 4006;
			text = "";
			x = safezoneX + (safezoneW / 2) + 0.02;
			y = safezoneY + (safezoneH / 6) + 0.09;
			w = 0.5;
			h = 0.04;
		};
		/*
		class Close : Life_RscButtonMenu {
			colorBackground[] = { 128, 108, 0 };
			idc = 4009;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = safezoneX + (safezoneW / 4) + (safezoneW / 2) - 0.2;
			y = safezoneY + (safezoneH / 6) + (safezoneH * 0.455);
			w = 0.2;
			h = 0.04;
		};
*/
	};
};
