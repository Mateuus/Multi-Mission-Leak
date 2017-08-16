/*
	Author: DerOnkel
	Avanix Gaming Community
	The usage of this file is restricted to Avanix-Gaming.de
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Interaction Menü
*/
/* Interaction Menu 10 Buttons */
class interaction_menu_10
{
	idd = 9000;
	name= "interaction_menu_10";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.216316 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.567368 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.773368 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0206316 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.221474 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.278211 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.334947 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.391684 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.448421 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_6: emonkeys_RscPictureButton
		{
			idc = 9008;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_7: emonkeys_RscPictureButton
		{
			idc = 9009;
			x = 0.561895 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_8: emonkeys_RscPictureButton
		{
			idc = 9010;
			x = 0.618631 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_9: emonkeys_RscPictureButton
		{
			idc = 9011;
			x = 0.675368 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_10: emonkeys_RscPictureButton
		{
			idc = 9012;
			x = 0.732105 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 9 Buttons */
class interaction_menu_9
{
	idd = 9000;
	name= "interaction_menu_9";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.247263 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.510631 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.747579 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0206316 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.252421 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.309158 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.365895 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.422632 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.479368 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_6: emonkeys_RscPictureButton
		{
			idc = 9008;
			x = 0.536105 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_7: emonkeys_RscPictureButton
		{
			idc = 9009;
			x = 0.592842 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_8: emonkeys_RscPictureButton
		{
			idc = 9010;
			x = 0.649579 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_9: emonkeys_RscPictureButton
		{
			idc = 9011;
			x = 0.706316 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 8 Buttons */
class interaction_menu_8
{
	idd = 9000;
	name= "interaction_menu_8";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.273053 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.453894 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.716631 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0206316 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.278211 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.334947 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.391684 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.448421 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_6: emonkeys_RscPictureButton
		{
			idc = 9008;
			x = 0.561895 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_7: emonkeys_RscPictureButton
		{
			idc = 9009;
			x = 0.618631 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_8: emonkeys_RscPictureButton
		{
			idc = 9010;
			x = 0.675368 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 7 Buttons */
class interaction_menu_7
{
	idd = 9000;
	name= "interaction_menu_7";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.298842 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.397158 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.685684 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0206316 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.304 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.360737 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.417474 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.474211 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.530947 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_6: emonkeys_RscPictureButton
		{
			idc = 9008;
			x = 0.587684 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_7: emonkeys_RscPictureButton
		{
			idc = 9009;
			x = 0.644421 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.046421 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 6 Buttons */
class interaction_menu_6
{
	idd = 9000;
	name= "interaction_menu_6";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.345263 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.309473 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.644421 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.350421 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.402 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.453579 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.556737 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_6: emonkeys_RscPictureButton
		{
			idc = 9008;
			x = 0.608316 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 5 Buttons */
class interaction_menu_5
{
	idd = 9000;
	name= "interaction_menu_5";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.371053 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.257895 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.618631 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.376211 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.42779 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.479368 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.530947 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_5: emonkeys_RscPictureButton
		{
			idc = 9007;
			x = 0.582526 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 4 Buttons */
class interaction_menu_4
{
	idd = 9000;
	name= "interaction_menu_4";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.396842 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.206316 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.592842 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.402 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.453579 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_4: emonkeys_RscPictureButton
		{
			idc = 9006;
			x = 0.556737 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 3 Buttons */
class interaction_menu_3
{
	idd = 9000;
	name= "interaction_menu_3";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.422632 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.154737 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.567053 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.42779 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.479368 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_3: emonkeys_RscPictureButton
		{
			idc = 9005;
			x = 0.530947 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 2 Buttons */
class interaction_menu_2
{
	idd = 9000;
	name= "interaction_menu_2";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.448421 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.103158 * safezoneW;
			h = 0.099 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.541263 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.453579 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class pic_2: emonkeys_RscPictureButton
		{
			idc = 9004;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.077 * safezoneH;
		};
	};
};

/* Interaction Menu 1 Buttons */
class interaction_menu_1
{
	idd = 9000;
	name= "interaction_menu_1";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground 
	{
		class emonkeys_RscTitleBackground: emonkeys_RscText 
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 9001;
			x = 0.474211 * safezoneW + safezoneX;
			y = 0.852029 * safezoneH + safezoneY;
			w = 0.0515789 * safezoneW;
			h = 0.0990081 * safezoneH;
		};
	};

	class controls 
	{
		class close_pic: emonkeys_RscPictureButton
		{
			idc = 9002;
			x = 0.515474 * safezoneW + safezoneX;
			y = 0.841028 * safezoneH + safezoneY;
			w = 0.0154737 * safezoneW;
			h = 0.0330027 * safezoneH;
		};
		class pic_1: emonkeys_RscPictureButton
		{
			idc = 9003;
			x = 0.479368 * safezoneW + safezoneX;
			y = 0.86303 * safezoneH + safezoneY;
			w = 0.0412631 * safezoneW;
			h = 0.0770063 * safezoneH;
		};
	};
};