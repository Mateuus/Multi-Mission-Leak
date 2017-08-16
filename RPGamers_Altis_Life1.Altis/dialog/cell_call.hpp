class Life_cell_phone_call {
	idd = 5000;
	name= "life_cell_phone_call";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cell_call";
	
	class controlsBackground {
		class EXphone: life_RscPicture
		{
			idc = 3001;

			text = "textures\phone.paa"; //--- ToDo: Localize;
			x = 0.439625 * safezoneW + safezoneX;
			y = 0.14692 * safezoneH + safezoneY;
			w = 0.426562 * safezoneW;
			h = 0.725732 * safezoneH;
		};
	};
	
	class controls {
		class TextTime: Life_RscStructuredText
		{
			idc = 90035;

			x = 0.5525 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,0};
		};
		class TextStatusLeft: Life_RscStructuredText
		{
			idc = 90036;

			x = 13.4 * GUI_GRID_W + GUI_GRID_X;
			y = 4.13 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1.25 * GUI_GRID_H;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,0};
		};
		class TextStatusRight: Life_RscStructuredText
		{
			idc = 90037;

			x = 0.650937 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.1575 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0,0,0,0};
		};
		class TextTitle: Life_RscStructuredText
		{
			idc = -1;

			text = "Phone Status"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.168 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class TextStatus: Life_RscStructuredText
		{
			idc = 5003;

			text = "Idle"; //--- ToDo: Localize;
			x = 0.5525 * safezoneW + safezoneX;
			y = 0.332 * safezoneH + safezoneY;
			w = 0.168 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class CallButton: Life_RscButtonMenu
		{
			idc = 5015;
			onButtonClick = "[true,objNull] call life_fnc_phoneCall";

			text = "Call"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.039375 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class PlayerList: Life_RscCombo
		{
			idc = 5004;

			x = 0.600937 * safezoneW + safezoneX;
			y = 0.444 * safezoneH + safezoneY;
			w = 0.126 * safezoneW;
			h = 0.028 * safezoneH;
		};
		class HangUpButton: Life_RscButtonMenu
		{
			idc = 5016;
			onButtonClick = "[] call life_fnc_phoneEnd";

			text = "Hang Up"; //--- ToDo: Localize;
			x = 0.559062 * safezoneW + safezoneX;
			y = 0.474 * safezoneH + safezoneY;
			w = 0.168 * safezoneW;
			h = 0.028 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0,0,0.5};
		};
		class ButtonClose: Life_RscButtonInvisible
		{
			onButtonClick = "closeDialog 0;";

			idc = 1009;
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