#define BGX 0.35
#define BGY 0.2
#define BGW 0.3

class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
		class PlayerInteractionHeader: Life_RscText
		{
			idc = 37401;
			text = "    Player Interaction Menu";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
	};
	class controls
	{
		class ButtonOne: Life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTwo: Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonThree: Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonFour: Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonFive: Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSix: Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSeven: Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonEight: Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonNine: Life_RscButtonMenu
		{
			idc = 37458;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTen: Life_RscButtonMenu
		{
			idc = 37459;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonEleven: Life_RscButtonMenu
		{
			idc = 37460;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTwelve: Life_RscButtonMenu
		{
			idc = 37461;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PIntCloseButton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close Menu";
			onButtonClick = "closeDialog 0;";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
		class PlayerInteractionHeader: Life_RscText
		{
			idc = 37401;
			text = "   Vehicle Interaction Menu";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			colorActive[] = {0,0,0,0.7};
		};
	};
	class controls
	{
		class ButtonOne: Life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTwo: Life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonThree: Life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonFour: Life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonFive: Life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSix: Life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonSeven: Life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonEight: Life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonNine: Life_RscButtonMenu
		{
			idc = 37458;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTen: Life_RscButtonMenu
		{
			idc = 37459;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonEleven: Life_RscButtonMenu
		{
			idc = 37460;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class ButtonTwelve: Life_RscButtonMenu
		{
			idc = 37461;
			text = "";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class PIntCloseButton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close Menu";
			onButtonClick = "closeDialog 0;";
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
