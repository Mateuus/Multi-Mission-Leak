class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = 0;
	enableSimulation = 1;

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\HUD\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
	};

	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "$STR_Admin_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Larguage : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_Larguage";
			onButtonClick = "createDialog ""life_larguage"";";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Purge : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_Purge";
			onButtonClick = "createDialog ""life_purge"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class Inpound : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_Inpound";
			onButtonClick = "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
