#include "player_sys.sqf"

class life_achievement_menu {
	idd = 3100;
	name= "life_achievement_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_achievementMenu";
	
	class controlsBackground {
		
		class MainBackground:Life_RscPictureKeepAspect {
			idc = -1;
			text = "images\phone.paa";			
			colorBackground[] = {0, 0, 0, 0};
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		
	};
	
	class controls {

		class TextTime : Life_RscStructuredText
		{
			idc = 90035;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0; y = 0.165;
			w = 1; h = 0.05;
		};
		
		class TextStatusLeft : Life_RscStructuredText
		{
			idc = 90036;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2) - 0.005; y = 0.165;
			w = 0.3; h = 0.05;
		};
		
		class TextStatusRight : Life_RscStructuredText
		{
			idc = 90037;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.34; y = 0.165;
			w = 1 - (0.34 * 2) - 0.02; h = 0.05;
			class Attributes {
				align = "right";
			};
		};
		
		class itemList : life_RscListBox 
		{
			idc = 3110;
			sizeEx = 0.030;
			
			x = 0.5 - (0.08 * 2);
			y = 0.23;
			w = 1 - ((0.5 - (0.08 * 2)) * 2);
			h = 0.325;
			onLBSelChanged = "[] spawn life_fnc_achievementSel;";
		};
		
		class itemInfo : Life_RscStructuredText
		{
			idc = 3105;
			text = "";
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.75};
			x = 0.5 - (0.08 * 2); y = 0.575;
			w = 1 - ((0.5 - (0.08 * 2)) * 2); h = 0.2;
		};
		
		class TitleOptions : Life_RscCombo {
			idc = 3122;
			
			x = 0.5 - (0.08 * 2);
			y = 0.775;
			w = (1 - ((0.5 - (0.08 * 2)) * 2)) * 0.79;
			h = (1 / 25);
		};
		
		class TitleSet : life_RscButtonMenu {
			idc = -1;
			text = "Set";
			colorBackground[] = {0.5, 0, 0, 0.5};
			onButtonClick = "[lbText [3122, lbCurSel 3122]] call life_fnc_setTitle";
			x = 0.5 - (0.08 * 2) + ((1 - ((0.5 - (0.08 * 2)) * 2)) * 0.8);
			y = 0.775;
			w = (1 - ((0.5 - (0.08 * 2)) * 2)) * 0.2;
			h = (1 / 25);
		};
				
		class ButtonClose : Life_RscButtonInvisible {
			idc = -1;
			shortcuts[] = {0x00050000 + 2};
			text = "";
			onButtonClick = "closeDialog 0;";
			tooltip = "Go back to home screen";
			x = 0.5 - ((6.25 / 40) / 2);
			y = 1 - 0.15;
			w = (6.25 / 40);
			h = (6.25 / 40);
		};
	};
};