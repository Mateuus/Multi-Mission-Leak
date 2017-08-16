class Interaction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "showChat false;";
	onUnLoad = "showChat true;";
	
	class controlsBackground
	{
		class hudbig : Life_RscPicture
		{
			idc = 37401;
			text = "images\hud\hudleftbig.paa";
			colorText[] = {0,0,0,0};
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.473 * safezoneH;
		};

		class hudsmall : Life_RscPicture
		{
			idc = 37402;
			text = "images\hud\hudleftbig.paa";
			colorText[] = {0,0,0,0};
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class Title : life_RscTitle
		{
			idc = 37403;
			text = "";
			style = 2;
			sizeEx = 0.028;
			colorText[] = {0,1,0,0.8};
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonTwo : ButtonOne
		{
			idc = 37451;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonThree : ButtonOne
		{
			idc = 37452;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonFour : ButtonOne
		{
			idc = 37453;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonFive : ButtonOne
		{
			idc = 37454;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonSix : ButtonOne
		{
			idc = 37455;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonSeven : ButtonOne
		{
			idc = 37456;
			colorBackground[] = {0,0,0,0.5};
			text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class ButtonEight : ButtonOne
        {
            idc = 37457;
            colorBackground[] = {0,0,0,0.5};
            text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
        };
		
		class ButtonNine : ButtonOne
        {
            idc = 37458;
            colorBackground[] = {0,0,0,0.5};
            text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
        };
		
		class ButtonTen : ButtonOne
        {
            idc = 37459;
            colorBackground[] = {0,0,0,0.5};
            text = "";
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
        };
	};
};