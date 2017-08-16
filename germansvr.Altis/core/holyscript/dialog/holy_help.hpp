/*
 *
 *	@File:		holy_help.hpp
 *	@Autor: 	AustrianNoob
 *	@Date:		02.11.2016
 *
 *	You are not allowed to use this script or remove the credits of the script without the permission of the author.
 *	WERTE:
 *	-0.712121 //SafezoneX
 *	2.42424 //SafezoneW
 * 	-0.409091 //SafezoneY
 * 	1.81818 //SafezoneH
 *
 * hint format ["safezoneX: %1 \n safezoneW: %2 \n safezoneY: %3 \n safezoneH:  %4",safezoneX,safezoneW,safezoneY,safezoneH]; 
 * IDD: 1337
 * IDC: 1338
 */
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
			//colorText[] = {0,0,0,0.7};
			//colorBackground[] = {0,0,0,0.7};
			text = "textures\holy_helpBACK.jpg";
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
			text = "NextGeneration Life Hilfe Menü"; //<-- Servernamen einfügen
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
			text = "Übersicht";
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
			text = "Lizenspreise"; 
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
			text = "Polizei"; 
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
			text = "Medic"; 
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
			text = "Illegale Güter";
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
			text = "Legale Güter"; 
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
			text = "Bankraub ?"; 
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
			text = "Neureich ?"; 
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
			text = "Gangkrieg ?"; 
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
			text = "Das Team"; 
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
			text = "Credits"; 
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
			text = "Schließen"; 
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