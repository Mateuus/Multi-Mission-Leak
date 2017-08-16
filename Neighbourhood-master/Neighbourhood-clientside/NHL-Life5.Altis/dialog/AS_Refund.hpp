class AS_Refund
{
	idd = 16100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.366423 * safezoneW + safezoneX;
			y = 0.433989 * safezoneH + safezoneY;
			w = 0.261082 * safezoneW;
			h = 0.0990166 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 16101;
			text = "";
			x = 0.372495 * safezoneW + safezoneX;
			y = 0.466994 * safezoneH + safezoneY;
			w = 0.248939 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "REFUND CASH TO PLAYER"; //--- ToDo: Localize;
			x = 0.414997 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.176078 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[] spawn life_fnc_ASrefund;";
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			x = 0.366423 * safezoneW + safezoneX;
			y = 0.433989 * safezoneH + safezoneY;
			w = 0.261082 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorBackground[] = {0,0.26,0.6,1};
		};
	};
};