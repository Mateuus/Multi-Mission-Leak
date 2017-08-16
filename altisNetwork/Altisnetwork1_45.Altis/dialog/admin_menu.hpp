class life_admin_menu {
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";

	class controlsBackground {
	class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
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

		class PlayerList_Admin : Life_RscListBox
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "[_this] spawn life_fnc_adminQuery";

			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};

		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class AdminID : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Admin_GetID";
			onButtonClick = "[] call life_fnc_admingetID;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Compensate : Life_RscButtonMenu {
			idc = 2904;
			text = "$STR_Admin_Compensate";
			onButtonClick = "createDialog ""Life_Admin_Compensate"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Spectate : Life_RscButtonMenu {
			idc = 2905;
			text = "$STR_Admin_Spectate";
			onButtonClick = "[] call life_fnc_adminSpectate;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Teleport : Life_RscButtonMenu {
			idc = 2906;
			text = "$STR_Admin_Teleport";
			onButtonClick = "[] call life_fnc_adminTeleport; hint 'Select where you would like to teleport';";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class TeleportHere : Life_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_TpHere";
			onButtonClick = "[] call life_fnc_adminTpHere;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class God : Life_RscButtonMenu {
			idc = 2908;
			text = "$STR_Admin_God";
			onButtonClick = "[] call life_fnc_adminGodMode;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Freeze : Life_RscButtonMenu {
			idc = 2909;
			text = "$STR_Admin_Freeze";
			onButtonClick = "[] call life_fnc_adminFreeze;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Markers : Life_RscButtonMenu {
			idc = 2910;
			text = "$STR_Admin_Markers";
			onButtonClick = "[] spawn life_fnc_adminMarkers;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};

		class Debug : Life_RscButtonMenu {
			idc = 2911;
			text = "$STR_Admin_Debug";
			onButtonClick = "[] call life_fnc_adminDebugCon;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};
        class FogControl : Life_RscButtonMenu {
			idc = 2907;
			text = "$STR_Admin_Fog";
			onButtonClick = "[] call life_fnc_adminFog;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.930;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};
		class Purge: Life_RscButtonMenu {
			idc = 6847;
			text = "The Purge";
			onButtonClick = "[] execVM 'core\functions\fn_purge.sqf'";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.930;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};
        class Revive: Life_RscButtonMenu {
			idc = -1;
			text = "Revive";
			onButtonClick = "[] call life_fnc_adminRevive;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.930;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};
        class Gear: Life_RscButtonMenu {
			idc = -1;
			text = "Gear";
			onButtonClick = "[] call life_fnc_admingear;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.930;
			w = (6.25 / 40);
			h = (1 / 25);
			class Attributes {
				align = "center";
			};
		};
	};
};
