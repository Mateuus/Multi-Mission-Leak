class ADT_JobCentre {
	idd = 999665;
	name= "ADT_JobCentre";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn ADTC_fnc_JobcentreOnload";
	onUnLoad = "";
	class controlsBackground
	{
		class RscText_1000: Life_rscText
		{
			idc = -1;
			x = 0.44328 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.363 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_rscText
		{
			idc = -1;
			text = "ADT Jobs"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.94,0.43,0,1};
		};
	};
	class controls
	{
		class ADT_JobCentre_listBox: Life_RscListbox
		{
			idc = 9956630;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.3014 * safezoneH;
			sizeEx = 0.035;
		};
		class ADT_JobCentre_Exit: Life_RscButtonMenu
		{
			idc = 9956631;
			text = "Exit"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.94,0.43,0,1};
			onButtonClick =  "closeDialog 0";
		};
		class ADT_JobCentre_Confirm: Life_RscButtonMenu
		{
			idc = 9956632;
			text = "Confirm"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.94,0.43,0,1};
			onButtonClick =  "[] spawn ADTC_fnc_JoinJob";
		};
	};
};