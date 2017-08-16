class safezone
{
	idd = 400;
	name = "safezone";
	movingEnabled = 0;
	enableSimulation = 1;
	fadein = 1;
	duration = 99999999;
	fadeout = 1;
	

	class controlsBackground {

		class pic: Life_RscPicture
		{
			idc = -1;
			text = "images\safezone.paa";
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.231 * safezoneH;
		};
	};

	class controls {};
};