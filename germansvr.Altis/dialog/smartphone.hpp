class Life_my_smartphone {
	idd = 88888;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_smartphone;";
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.95;
			h = 0.7 - (22 / 250);
		};
		class PlayerListTitleBackground:Life_RscText {
			colorBackground[] = {0.588, 0.424, 0.145, 1.0};
			idc = -1;
			x = 0.11;
			y = 0.25;
			w = 0.2;
			h = (1 / 25);
		};
		class MessageTitleBackground:Life_RscText {
			colorBackground[] = {0.588, 0.424, 0.145, 1.0};
			idc = -1;
			x = 0.325;
			y = 0.25;
			w = 0.7;
			h = (1 / 25);
		};
		class RandomTitleBackground:Life_RscText {
			colorBackground[] = {0.588, 0.424, 0.145, 1.0};
			idc = -1;
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.7;
			h = (1 / 25);
		};
	};
	class controls {
		class MessageTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.325;
			y = 0.25;
			w = 0.7;
			h = (1 / 25);
		};
		class RandomTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "$STR_SMARTPHONE_RANDOMTITLE";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.7;
			h = (1 / 25);
		};
		class PlayerList : Life_RscListBox {
			idc = 88881;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.11;
			y = 0.25 + (1 / 25);
			w = 0.2;
			h = 0.5;
		};
		class MessageList : Life_RscListNBox {
			idc = 88882;
			onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_showMsg;";
			//sizeEx = 0.04;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			x = 0.325;
			y = 0.25 + (1 / 25);
			w = 0.7;
			h = 0.3;
		};
		class TextShow : Life_RscControlsGroup {
			x = 0.325;
			y = 0.25 + 0.3 + (1 / 25) + (1 / 25);
			w = 0.7;
			h = 0.15;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : Life_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.69;//w = 0.7;
					h = 1;//h = 2.15;
				};
			};
		};
		class Schreiben : Life_RscButtonMenu {
			idc = 887892;
			text = "Schreiben";
			onButtonClick = "[4] call life_fnc_smartphone;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.11;
			y = 0.25 + (1 / 25) + 0.51;
			w = 0.2;
			h = (1 / 25);
		};
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_SMARTPHONE_TITLE";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		class PlayerListTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Kontakt Liste";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25;
			w = 0.2;
			h = (1 / 25);
		};
		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
class Life_smartphone_schreiben{
	idd = 88883;
	name = "life_my_smartphone_schreiben";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.1;
		};
	};
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		class Absenden : Life_RscButtonMenu {
			idc = 88885;
			text = "$STR_SMARTPHONE_ABSENDEN";
			onButtonClick = "[1,-1,(ctrlText 88884)] call life_fnc_newMsg;";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.6 - (6.25 / 40) + 0.088;
			y = 0.3 + (1 / 25) - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class AdminMsg : life_RscButtonMenu {
			idc = 888897;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			onButtonClick = "[5,-1,(ctrlText 88884)] call life_fnc_newMsg;";
			x = 0.6 - (6.25 / 40) - 0.121;
			y = 0.3 + (1 / 25) - 0.048;
			w = 0.2;
			h = (1 / 25);
		};
		class Close : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0.584, 0.086, 0.086,1.0};
			x = 0.11;
			y = 0.3 + (1 / 25) - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class textEdit : Life_RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.3 - 0.048;
			w = 0.58; h = 0.03;
		};
	};
};
class Life_smartphone_notruf {
	idd = 887890;
	name= "life_my_smartphone_notruf";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[6] spawn life_fnc_newMsg;";
	class controlsBackground {
		class InventoryBack:Life_RscPicture {
			idc = -1;
			text = "textures\handy\handy_sos.paa";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.500156 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};
	class controls {
		class textEdit : Life_RscEdit {
			idc = 888894;
			text = "";
			sizeEx = "0.022 * safeZoneH";
			onMouseEnter = "";
			style = 0x00 + 0x200;
			x = 0.753275 * safezoneW + safezoneX;
			y = 0.6782 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class TxtCopButton1 : life_RscButtonMenu {
			idc = 888895;
			tooltip = "$STR_CELL_TextPolice";
			onButtonClick = "[2,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.73815 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class TxtAdminButton : life_RscButtonMenu {
			idc = 888896;
			tooltip = "$STR_CELL_TextAdmins";
			onButtonClick = "[3,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.8465 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class AdminMsgAll : life_RscButtonMenu {
			idc = 888898;
			tooltip = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[7,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			size = "0.022 * safeZoneH";
			
			x = 0.938281 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class EMSReq : life_RscButtonMenu {
			idc = 888899;
			tooltip = "$STR_CELL_EMSRequest";
			onButtonClick = "[4,-1,(ctrlText 888894)] call life_fnc_newMsg;";
			size = "0.022 * safeZoneH";
			
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.7915 * safezoneH + safezoneY;
			w = 0.099 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonSyncData : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData;";
			size = "0.022 * safeZoneH";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_PM_SyncData";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;closeDialog 0;";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "$STR_Global_Close";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		
		class ButtonHome : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			
			tooltip = "HOME";
			size = "0.022 * safeZoneH";
			
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground2[] = {0,0,0,0};
			color[] = {1,1,1,1};
			colorFocused[] = {0,0,0,0};
			color2[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class checkbox1: Life_Checkbox
		{
			idc = -1;
			x = 0.845468 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "GPS";
			onCheckedChanged    = "if(!life_gps) then {life_gps = true; systemChat 'GPS Aktiviert';} else {life_gps = false;systemChat 'GPS Deaktiviert';};";
		};
	};
};