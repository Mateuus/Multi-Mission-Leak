class checkadmin {

	idd = 8600;
	movingEnable = 1;
	EnableSimulation = 1;

	class controlsBackground {

		class background: Life_RscText
		{
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.132 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class maintitle: Life_RscText
		{
			idc = -1;
			text = "Bitte trage einen Grund für die Verwendung ein!";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};

	};

	class controls {

		class eingabe: Life_RscEdit
		{
			idc = 8601;
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class eintragenbutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Eintragen"; 
			OnButtonClick = "admingrund = ctrlText 8601; closedialog 0;";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
};