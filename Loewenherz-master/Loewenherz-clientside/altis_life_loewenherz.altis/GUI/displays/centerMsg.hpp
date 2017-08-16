class CenterMsg
{
	name = "CenterMsg";
	idd = 9000;
	movingenable=false;
	fadeIn = 1;
	duration = 30;
	fadeout = 1;
	onLoad="uiNamespace setVariable ['CenterMsg',_this select 0]";
	objects[]={};	
	
	class controlsBackground
	{	
		class txtMsg: lhm_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.836 * safezoneH;
			//sizeEx = 10;
			class Attributes {
                align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				underline = false;
            };	
		};	
		
	}
}