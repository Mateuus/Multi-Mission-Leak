#define BGX 0.35
#define BGY 0.2
#define BGW 0.3

class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = 1;
	
	class controlsBackground
	{

		class RscTitleBackground: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_logo.jpg";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.287408 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class MainBackground: ES_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.319 * safezoneH;
		};
	};

	class controls
		{
			class ButtonClose: ES_RscButtonMenu
			{
				idc = -1;
				//shortcuts[] = {0x00050000 + 2};
				text = "$STR_Global_Close";
				onButtonClick = "closeDialog 0;";
				x = 0.31901 * safezoneW + safezoneX;
				y = 0.663259 * safezoneH + safezoneY;
				w = 0.0938542 * safezoneW;
				h = 0.0294074 * safezoneH;
			};

			class ButtonOne: ES_RscButtonMenu
			{
				idc = 37450;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.357 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonTwo: ES_RscButtonMenu
			{
				idc = 37451;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.401 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonThree: ES_RscButtonMenu
			{
				idc = 37452;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.445 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonFour: ES_RscButtonMenu
			{
				idc = 37453;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.489 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonFive: ES_RscButtonMenu
			{
				idc = 37454;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.533 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonSix: ES_RscButtonMenu
			{
				idc = 37455;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.329844 * safezoneW + safezoneX;
				y = 0.577 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};

			class ButtonSeven: ES_RscButtonMenu
			{
				idc = 37456;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				text = "";
				sizeEx = 0.025;
				x = 0.494844 * safezoneW + safezoneX;
				y = 0.357 * safezoneH + safezoneY;
				w = 0.134062 * safezoneW;
				h = 0.033 * safezoneH;
			};
		};
	};

class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = 1;
	

	class controlsBackground
		{

			class RscTitleBackground: ES_RscPicture
			{
				idc = -1;
				text = "images\Logos\menu_logo.jpg";
				x = 0.319531 * safezoneW + safezoneX;
				y = 0.287408 * safezoneH + safezoneY;
				w = 0.319688 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class MainBackground: ES_RscText
			{
				idc = -1;
				colorBackground[] = {0,0,0,0.7};
				x = 0.319531 * safezoneW + safezoneX;
				y = 0.335 * safezoneH + safezoneY;
				w = 0.319688 * safezoneW;
				h = 0.319 * safezoneH;
			};
		};

		class controls
			{
				class ButtonClose: ES_RscButtonMenu
				{
					idc = -1;
					//shortcuts[] = {0x00050000 + 2};
					text = "$STR_Global_Close";
					onButtonClick = "closeDialog 0;";
					x = 0.31901 * safezoneW + safezoneX;
					y = 0.663259 * safezoneH + safezoneY;
					w = 0.0938542 * safezoneW;
					h = 0.0294074 * safezoneH;
				};

				class ButtonOne: ES_RscButtonMenu
				{
					idc = 37450;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.357 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};

				class ButtonTwo: ES_RscButtonMenu
				{
					idc = 37451;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.401 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};

				class ButtonThree: ES_RscButtonMenu
				{
					idc = 37452;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.445 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};

				class ButtonFour: ES_RscButtonMenu
				{
					idc = 37453;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.489 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};

				class ButtonFive: ES_RscButtonMenu
				{
					idc = 37454;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.533 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};

				class ButtonSix: ES_RscButtonMenu
				{
					idc = 37455;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					text = "";
					sizeEx = 0.025;
					x = 0.329844 * safezoneW + safezoneX;
					y = 0.577 * safezoneH + safezoneY;
					w = 0.134062 * safezoneW;
					h = 0.033 * safezoneH;
				};
			};
		};


class interaction_menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = 1;
	
	onLoad = "_display = _this select 0;for ""_i"" from 0 to 15 do {_id = 37450 + _i;_ctrl = _display displayCtrl _id;_ctrl ctrlShow false;};";

	class controlsBackground
	{
		class RscTitleBackground:ES_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.183504 * safezoneW + safezoneX;
			y = 0.264725 * safezoneH + safezoneY;
			w = 0.143319 * safezoneW;
			h = 0.0280089 * safezoneH;
		};
		
		class Title : ES_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "";
			x = 0.183504 * safezoneW + safezoneX;
			y = 0.264725 * safezoneH + safezoneY;
			w = 0.143319 * safezoneW;
			h = 0.0280089 * safezoneH;
		};
	};
	
	class controls
	{
		#define startId 37450
		#define heightMultiplier 0.0280089 * safezoneH
		#define startY 0.292734 * safezoneH + safezoneY

		class ButtonOne: ES_RscButtonMenu
		{
			idc = 37450;

			x = 0.183504 * safezoneW + safezoneX;
			y = startY;
			w = 0.143319 * safezoneW;
			h = 0.0280089 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
		};

		class ButtonTwo: ButtonOne {idc = startId + 1; y = startY + (heightMultiplier * 1);};
		class ButtonThree: ButtonOne {idc = startId + 2; y = startY + (heightMultiplier * 2);};
		class ButtonFour: ButtonOne {idc = startId + 3; y = startY + (heightMultiplier * 3);};
		class ButtonFive: ButtonOne {idc = startId + 4; y = startY + (heightMultiplier * 4);};
		class ButtonSix: ButtonOne {idc = startId + 5; y = startY + (heightMultiplier * 5);};
		class ButtonSeven: ButtonOne {idc = startId + 6; y = startY + (heightMultiplier * 6);};
		class ButtonEight: ButtonOne {idc = startId + 7; y = startY + (heightMultiplier * 7);};
		class ButtonNine: ButtonOne {idc = startId + 8; y = startY + (heightMultiplier * 8);};
		class ButtonTen: ButtonOne {idc = startId + 9; y = startY + (heightMultiplier * 9);};
		class ButtonEleven: ButtonOne {idc = startId + 10; y = startY + (heightMultiplier * 10);};
		class ButtonTwelve: ButtonOne {idc = startId + 11; y = startY + (heightMultiplier * 11);};
		class ButtonThirteen: ButtonOne {idc = startId + 12; y = startY + (heightMultiplier * 12);};
		class ButtonFourteen: ButtonOne {idc = startId + 13; y = startY + (heightMultiplier * 13);};
		class ButtonFifteen: ButtonOne {idc = startId + 14; y = startY + (heightMultiplier * 14);};
	};
};