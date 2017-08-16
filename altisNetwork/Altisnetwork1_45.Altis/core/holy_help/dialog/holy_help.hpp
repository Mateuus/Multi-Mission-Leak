class holy_help
{
    idd = 1337;
	name = "holy_help";
    movingEnable = false;
    enableSimulation = false; //Default: true
	onLoad = "[1] spawn life_fnc_holy_help;";//[1] spawn life_fnc_holy_help
	
	class controlsBackground
	{
		class total_background: Life_RscPicture
		{
			idc = -1;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.74 * safezoneH;
			colorText[] = {0,0,0,0.7};
			colorBackground[] = {0,0,0,0.7};
			//text = "textures\holy_helpBACK.jpg";
		};
		class TITLEback: Life_RscText
		{
			idc = -1;
			text = ""; 
			x = 0.2 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.024 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class CtrlGrp: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.425 * safezoneW;
			h = 0.64 * safezoneH;
			class Controls
			{
				class TEXTBOX: Life_RscStructuredText
				{
					idc = 1338;
					text = "";
					x = 0;
					y = 0;
					w = 0.425 * safezoneW;
					h = 0;
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,0.5};
				};
			};
		};
	};
	class controls //Buttonsshit
	{
		class TITLE: Life_RscStructuredText
		{
			idc = -1;
			text = "Help menu";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.128 * safezoneH + safezoneY;
			w = 0.6 * safezoneW;
			h = 0.024 * safezoneH;
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
		};
		class Button1: Life_RscButton
		{
			idc = -1;
			text = "Overview";
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[1] spawn life_fnc_holy_help";//[1] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button2: Life_RscButton
		{
			idc = -1;
			text = "Test2"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[2] spawn life_fnc_holy_help";//[2] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button3: Life_RscButton
		{
			idc = -1;
			text = "Test3"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.3 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[3] spawn life_fnc_holy_help";//[3] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button4: Life_RscButton
		{
			idc = -1;
			text = "Test4"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[4] spawn life_fnc_holy_help";//[4] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button5: Life_RscButton
		{
			idc = -1;
			text = "Test5"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[5] spawn life_fnc_holy_help";//[5] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button6: Life_RscButton
		{
			idc = -1;
			text = "Test6"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.48 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[6] spawn life_fnc_holy_help";//[6] spawn life_fnc_holy_help
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button7: Life_RscButton
		{
			idc = -1;
			text = "Test7"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[7] spawn life_fnc_holy_help";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button8: Life_RscButton
		{
			idc = -1;
			text = "Test8"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.6 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[8] spawn life_fnc_holy_help";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button9: Life_RscButton
		{
			idc = -1;
			text = "Test9"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[9] spawn life_fnc_holy_help";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button10: Life_RscButton
		{
			idc = -1;
			text = "Test10"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[10] spawn life_fnc_holy_help";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class Button11: Life_RscButton
		{
			idc = -1;
			text = "Test11"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			action = "[11] spawn life_fnc_holy_help";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class BUGTRACKER: Life_RscButton
		{
			idc = -1;
			text = "Bugtracker"; 
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.425 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			tooltip = "Hiermit kannst du uns Bugs melden"; 
			action = "closeDialog 0; createDialog 'holy_bug';";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
		class CLOSEIT: Life_RscButton
		{
			idc = -1;
			text = "Close Menu"; 
			x = 0.2125 * safezoneW + safezoneX;
			y = 0.84 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.7};
			tooltip = "Schließt diesen Dialog..."; 
			action = "closeDialog 0;";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
		};
	};
};