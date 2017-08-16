class godmode {

	idd = 79500;
	movingEnable = 0;
	EnableSimulaton = 0;
	fadein=1;
	duration = 999999999999;
	fadeout=1;
	onLoad="uiNamespace setVariable ['godmode',_this select 0]";
	
	class ControlsBackground {

		class godmode: RscPicture
		{
			idc = 79501;
			text = "#(argb,8,8,3)color(0,1,0,1)";
			x = 0.984687 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.00515625 * safezoneW;
			h = 0.011 * safezoneH;
			colorText[] = {1,1,1,0.4};
		};
	};
		
	class controls {};
};