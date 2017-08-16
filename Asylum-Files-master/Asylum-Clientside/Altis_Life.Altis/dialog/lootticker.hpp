

class lootticker_menu {
	idd = 12200;
	name = "lootticker_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.176 * safezoneH;
		};
	};
	
	class controls {
		class RscFrame_1800: Life_RscFrame
		{
			idc = -1;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.154 * safezoneH;
			colorText[] = {-1,-1,-1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class RscPicture_1200: Life_RscPicture
		{
			idc = 12202;
			text = "";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscPicture_1201: Life_RscPicture
		{
			idc = 12201;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscPicture_1202: Life_RscPicture
		{
			idc = 12203;
			text = "";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RewardFrame: Life_RscPicture
		{
			idc = 12205;
			text = "images\lootreward.paa";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.132 * safezoneH;
		};
	};

};