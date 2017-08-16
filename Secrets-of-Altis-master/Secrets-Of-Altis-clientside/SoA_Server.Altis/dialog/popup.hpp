class life_popup {

	idd = 6100;
	name = "life_popup";
	movingEnabled = false;
	enableSimulation = true;
	fadein = 2;
	duration = 5;
	fadeout = 5;
	onLoad="uiNamespace setVariable ['life_popup',_this select 0]";
	
	class controlsBackground {

		class RscPicture_1200: Life_RscPicture
		{
			idc = 6103;
			text = "";
			x = 0.075;
			y = 0.82;
			w = 0.825;
			h = 0.52;
		};
		class RscButtonMenu_2400: Life_RscText
		{
			idc = 6101;
			text = "";
			style=2;
			shadow=1;
			x = 0.366415;
			y = 1.09663;
			w = 0.375;
			h = 0.06;
			colorText[] = {0,0,0,1};
		};
		class RscPicture_1201: Life_RscPicture
		{
			idc = 6102;
			text = "";
			x = 0.121086;
			y = 0.993266;
			w = 0.15;
			h = 0.18;
		};
	};
};