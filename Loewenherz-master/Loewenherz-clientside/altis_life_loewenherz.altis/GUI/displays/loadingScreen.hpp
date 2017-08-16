class lh_loadingScreen
{
  	idd=-1;
  	movingEnable=0;
  	duration=99999999999999999999999999999999999999999999;
  	fadein=0;
  	fadeout=0;
  	name="lh_loadingScreen";
  	onLoad="uiNamespace setVariable ['lh_loadingScreen',_this select 0]";
  	controls[]={"loading1"};

  	class loading1
	{
		access = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,0.7};
		deletable = 0;
		fade = 0;
		fixedWidth = 0;
		font = "TahomaB";
		idc = -1;
		lineSpacing = 0;
		shadow = 0;
		sizeEx = 0;
		style = 48;
		text="lh_loadingScreen.paa";
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};
		tooltipColorText[] = {1,1,1,1};
		type = 0;
		h = "safezoneH";
		w = "safezoneWAbs";
		x = "safezoneXAbs";
		y = "safezoneY";
	};
};