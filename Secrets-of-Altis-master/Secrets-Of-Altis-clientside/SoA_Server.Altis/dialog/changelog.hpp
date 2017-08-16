class changelog {

	idd = 7800;
	movingEnable = 0;
	EnableSimulation = 1;

	class controlsBackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class frame: Life_RscFrame
		{
			idc = -1;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.374 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class titleupdate: Life_RscText
		{
			idc = -1;
			text = "Neues Update!";
			style = 2;
			shadow = 0;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0.5};
			sizeEx = 2.5 * GUI_GRID_H;
		};
	};

	class controls {

		class infotext: RscStructuredText
		{
			idc = -1;
			text = "<br/><t size='0.8' align='center' >Ein neues Update ist aufgespielt worden.<br/><br/><t color='#006400' size='2'><a href='https://www.secretsofaltis.de/index.php/server/changelog'>Zum Changelog</a></t><br/><br/>Du hast eine Bugmeldung? <t color='#60f467'><a href='https://www.secretsofaltis.de/index.php/bugtracker'>Melde Sie uns!</a></t></t>"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.187 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
		};

		class buttonok: RscButtonMenu
		{
			idc = -1;
			text = "Alles klar!";
			OnButtonClick = "closedialog 0";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};