class life_synced_phone {

	idd = 9392;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {

		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\synced.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
	};
			
	class controls {
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1012;
			x = 0.601719 * safezoneW + safezoneX;
			y = 0.801 * safezoneH + safezoneY;
			w = 0.0820312 * safezoneW;
			h = 0.0875 * safezoneH;
			colorText[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
			tooltip = "Go back"; //--- ToDo: Localize;
		};
	};
};