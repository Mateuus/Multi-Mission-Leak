class perksMenu {
	idd = 3000;
	name= "perksMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = -0.1;
			y = -0.2;
			w = 1.04;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = -0.1;
			y = -0.2 + (11 / 250);
			w = 1.04;
			h = 1.3 - (5 / 250);
		};
	};
	
	class controls {
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.1;
			y = 1.13;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class SaveButtonKey : Life_RscButtonMenu {
			idc = 2000;
			text = "Spara";
			onButtonClick = "[] spawn life_fnc_lqljjrtesdalsazjhhbglacfkevbsshkfgbooyhatnciwgzdqydvrvc;";
			x = -0.1 + (6.60 / 40);
			y = 1.13;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ResetButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Reset";
			onButtonClick = "[] spawn life_fnc_nvqqjrtgsegnngmrrtcmsqlgjnrnhupjoidztwffvnijyvvbvcjcckngb;";
			x = -0.1 + (13.20 / 40);
			y = 1.13;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "Perks";
			x = -0.1;
			y = -0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class systemDescribtion : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2400;
			x = 0.25;
			y = (5 / 250) - 0.1;
			w = 0.66;
			h = 0.9 + (5 / 250);
		};
		
		class perkName : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2200;
			size = 0.07;
			text = "";
			shadow = 0;
			x = 0.25;
			y = (10 / 250) - 0.1;
			w = 0.66;
			h = (2 / 25);
		};
		
		class perkDescribtion : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2201;
			x = 0.25;
			y = (10 / 250);
			w = 0.66;
			h = 0.35;
		};
		
		class MinusButton : Life_RscButtonMenu {
			idc = 2202;
			size = 0.07;
			text = "-";
			x = 0.25;
			y = 0.4 + (5 / 250);
			w = (2/25);
			h = (2 / 25);
			
			class TextPos
			{
				left = 0.03;
				top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
		};
		
		class Spentpoints : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2203;
			sizeEx = 0.07;
			size = 0.07;
			x = 0.25 + (2/25);
			y = 0.42;
			w = 0.50;
			h = (2 / 25);
		};
		
		class PlusButton : Life_RscButtonMenu {
			idc = 2204;
			size = 0.08;
			text = "+";
			x = 0.75 + (2/25);
			y = 0.4 + (5 / 250);
			w = (2/25);
			h = (2 / 25);
			
			class TextPos
			{
				left = 0.03;
				top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
				right = 0.005;
				bottom = 0.0;
			};
		};
		
		class LockedTier : Life_RscTextPerks {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2205;
			sizeEx = 0.07;
			size = 0.07;
			x = 0.25 + (2/25);
			y = 0.43 + (25 / 250);
			w = 0.50;
			h = (35 / 250);
		};
		
		class LockedIcon : Life_RscButtonPerks {
			idc = 2206;
			colorDisabled[] = {1,1,1,1};
			x = 0.25;
			y = 0.43 + (25 / 250);
			w = 0.08; h = 0.08;
		};
		
		class LockedIcon2 : Life_RscButtonPerks {
			idc = 2207;
			colorDisabled[] = {1,1,1,1};
			x = 0.75 + (2/25);
			y = 0.43 + (25 / 250);
			w = 0.08; h = 0.08;
		};
		
		
		class SaveText : Life_RscButtonPerks {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 2208;
			sizeEx = 0.07;
			size = 0.07;
			font = "PuristaMedium";
			style = 0x10;
			onButtonClick = "[] spawn life_fnc_lqljjrtesdalsazjhhbglacfkevbsshkfgbooyhatnciwgzdqydvrvc;";
			x = 0.25 + (2/25);
			y = 0.43 + (25 / 250);
			w = 0.50;
			h = 0.08;
		};
		
		class SaveIcon : Life_RscButtonPerks {
			idc = 2209;
			x = 0.25;
			y = 0.43 + (25 / 250);
			w = 0.08; h = 0.08;
			onButtonClick = "[] spawn life_fnc_lqljjrtesdalsazjhhbglacfkevbsshkfgbooyhatnciwgzdqydvrvc;";
		};
		
		class SaveIcon2 : Life_RscButtonPerks {
			idc = 2210;
			x = 0.75 + (2/25);
			y = 0.43 + (25 / 250);
			w = 0.08; h = 0.08;
			onButtonClick = "[] spawn life_fnc_lqljjrtesdalsazjhhbglacfkevbsshkfgbooyhatnciwgzdqydvrvc;";
		};
		

		class InfoText3 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2303;
			sizeEx = 0.04;
			text = "";
			x = 0.25;
			y = 1 - (31 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class InfoText2 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2302;
			sizeEx = 0.04;
			text = "";
			x = 0.25;
			y = 1 - (19 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class InfoText1 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2301;
			sizeEx = 0.04;
			text = "";
			x = 0.25;
			y = 1 - (7 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class InfoText0 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2300;
			sizeEx = 0.04;
			text = "";
			x = 0.25;
			y = 1 + (5 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		
		
		class Tiers : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2012;
			sizeEx = 0.06;
			text = "Tier";
			x = -0.098;
			y = -0.142;
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier11 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2011;
			sizeEx = 0.06;
			text = "11";
			x = -0.09;
			y = (10 / 250) - 0.1;
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier10 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2010;
			sizeEx = 0.06;
			text = "10";
			x = -0.09;
			y = (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier9 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2009;
			sizeEx = 0.06;
			text = "9";
			x = -0.09;
			y = 0.1 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier8 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2008;
			sizeEx = 0.06;
			text = "8";
			x = -0.09;
			y = 0.2 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier7 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2007;
			sizeEx = 0.06;
			text = "7";
			x = -0.09;
			y = 0.3 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier6 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2006;
			sizeEx = 0.06;
			text = "6";
			x = -0.09;
			y = 0.4 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier5 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2005;
			sizeEx = 0.06;
			text = "5";
			x = -0.09;
			y = 0.5 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier4 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2004;
			sizeEx = 0.06;
			text = "4";
			x = -0.09;
			y = 0.6 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier3 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2003;
			sizeEx = 0.06;
			text = "3";
			x = -0.09;
			y = 0.7 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier2 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2002;
			sizeEx = 0.06;
			text = "2";
			x = -0.09;
			y = 0.8 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Tier1 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2001;
			sizeEx = 0.06;
			text = "1";
			x = -0.09;
			y = 0.9 + (10 / 250);
			w = 0.6;
			h = (1 / 25);
		};
		
		class Perk0 : Life_RscButtonPerkButton {
			idc = 2100;
			
			x = -0.04;
			y = 0.9 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk1 : Life_RscButtonPerkButton {
			idc = 2101;
			
			x = 0.05;
			y = 0.9 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk2 : Life_RscButtonPerkButton {
			idc = 2102;
			
			x = 0.14;
			y = 0.9 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk3 : Life_RscButtonPerkButton {
			idc = 2103;
			
			x = -0.04;
			y = 0.8 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk4 : Life_RscButtonPerkButton {
			idc = 2104;
			
			x = 0.05;
			y = 0.8 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk5 : Life_RscButtonPerkButton {
			idc = 2105;
			
			x = 0.14;
			y = 0.8 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk6 : Life_RscButtonPerkButton {
			idc = 2106;
			
			x = -0.04;
			y = 0.7 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk7 : Life_RscButtonPerkButton {
			idc = 2107;
			
			x = 0.05;
			y = 0.7 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk8 : Life_RscButtonPerkButton {
			idc = 2108;
			
			x = 0.14;
			y = 0.7 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk9 : Life_RscButtonPerkButton {
			idc = 2109;
			
			x = -0.04;
			y = 0.6 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk10 : Life_RscButtonPerkButton {
			idc = 2110;
			
			x = 0.05;
			y = 0.6 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk11 : Life_RscButtonPerkButton {
			idc = 2111;
			
			x = 0.14;
			y = 0.6 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk12 : Life_RscButtonPerkButton {
			idc = 2112;
			
			x = -0.04;
			y = 0.5 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk13 : Life_RscButtonPerkButton {
			idc = 2113;
			
			x = 0.05;
			y = 0.5 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk14 : Life_RscButtonPerkButton {
			idc = 2114;
			
			x = 0.14;
			y = 0.5 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk15 : Life_RscButtonPerkButton {
			idc = 2115;
			
			x = -0.04;
			y = 0.4 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk16 : Life_RscButtonPerkButton {
			idc = 2116;
			
			x = 0.05;
			y = 0.4 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk17 : Life_RscButtonPerkButton {
			idc = 2117;
			
			x = 0.14;
			y = 0.4 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk18 : Life_RscButtonPerkButton {
			idc = 2118;
			
			x = -0.04;
			y = 0.3 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk19 : Life_RscButtonPerkButton {
			idc = 2119;
			
			x = 0.05;
			y = 0.3 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk20 : Life_RscButtonPerkButton {
			idc = 2120;
			
			x = 0.14;
			y = 0.3 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk21 : Life_RscButtonPerkButton {
			idc = 2121;
			
			x = -0.04;
			y = 0.2 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk22 : Life_RscButtonPerkButton {
			idc = 2122;
			
			x = 0.05;
			y = 0.2 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk23 : Life_RscButtonPerkButton {
			idc = 2123;
			
			x = 0.14;
			y = 0.2 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk24 : Life_RscButtonPerkButton {
			idc = 2124;
			
			x = -0.04;
			y = 0.1 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk25 : Life_RscButtonPerkButton {
			idc = 2125;
			
			x = 0.05;
			y = 0.1 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk26 : Life_RscButtonPerkButton {
			idc = 2126;
			
			x = 0.14;
			y = 0.1 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk27 : Life_RscButtonPerkButton {
			idc = 2127;
			
			x = -0.04;
			y = 0 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk28 : Life_RscButtonPerkButton {
			idc = 2128;
			
			x = 0.05;
			y = 0 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk29 : Life_RscButtonPerkButton {
			idc = 2129;
			
			x = 0.14;
			y = 0 + (5 / 250);
			w = 0.08; h = 0.08;
		};
		
		class Perk30 : Life_RscButtonPerkButton {
			idc = 2130;
			
			x = -0.04;
			y = (5 / 250) - 0.1;
			w = 0.08; h = 0.08;
		};
		
		class Perk31 : Life_RscButtonPerkButton {
			idc = 2131;
			
			x = 0.05;
			y = (5 / 250) - 0.1;
			w = 0.08; h = 0.08;
		};
		
		class Perk32 : Life_RscButtonPerkButton {
			idc = 2132;
			
			x = 0.14;
			y = (5 / 250) - 0.1;
			w = 0.08; h = 0.08;
		};
	};
};