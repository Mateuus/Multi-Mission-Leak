class mainMenu {

	idd = 5000;
	movingEnable = false;
	enableSimulation = false;
	name = "life_mainMenu";
	onLoad = "";
	
	class controlsBackground {

	/*
		class BotLeft: Life_RscPicture
		{
			idc = -1;
			//text = "textures\TextBotLeft.paa";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.374 * safezoneH;
		};
		*/
		class MainMenu: Life_RscPicture
		{
			idc = -1;
			text = "textures\TextMainMenu.paa";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.187 * safezoneH;
		};
		
		class YourStats: Life_RscPicture
		{
			idc = -1;
			text = "textures\TextYourStats.paa";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.187 * safezoneH;
		};
	};
	
	class controls {

		class StatsInfo: Life_RscStructuredText
		{
			idc = 5002;
			text = "";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h =0.264 * safezoneH;
		};


		class WelcomeTest: Life_RscText
		{
			idc = 5001;
			text = "Welcome, "; //--- ToDo: Localize;
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			class Attributes
			{
				font = "PuristaLight";
				color = "#343EFA";
				align = "right";
				shadow = "true";
			};
		};

		class ContinueGame: Life_RscButtonMenu
		{
			onButtonClick = "closedialog 0; [] spawn life_fnc_spawnMenu;";

			idc = -1;
			text = "CONTINUE GAME"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.6};
			class Attributes
			{
				font = "PuristaLight";
				color = "#343EFA";
				align = "right";
				shadow = "true";
			};

		};

		class ExitLobby: Life_RscButtonMenu
		{
			onButtonClick = "closedialog 0; [] call life_fnc_exitLobby; ";

			idc = -1;
			text = "RETURN TO LOBBY"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.6};
			class Attributes
			{
				font = "PuristaLight";
				color = "#343EFA";
				align = "right";
				shadow = "true";
			};

		};

		class SettingsMenu: Life_RscButtonMenu
		{
			onButtonClick = "[1] call life_fnc_settingsMenu";

			idc = -1;
			text = "SETTINGS"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.6};
			class Attributes
			{
				font = "PuristaLight";
				color = "#343EFA";
				align = "right";
				shadow = "true";
			};


		};		
	};
};