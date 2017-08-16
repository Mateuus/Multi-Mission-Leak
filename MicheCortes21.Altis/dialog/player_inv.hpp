//Keine Verwendung ohne Erlaubnis by Darkwin Duck & Shriver Basdekis
#include "player_sys.sqf"

class playerSettings {
	idd = playersys_DIALOG;
	movingEnable = 1;
	enableSimulation = 1;

	class controlsBackground {
		class tabletv3: Life_RscPicture {
			text = "textures\tablet\tabletv3.paa";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.515625 * safezoneW;
			h = 0.847 * safezoneH;
			idc = -1;
		};

		class Title: Life_RscTitle {
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.95,0.95,0.95,1};
		};

		class moneyStatusInfo: Life_RscStructuredText {
			idc = 2015;

			x = 0.319531 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.088 * safezoneH;
		};

		class PlayersName: Title {
			idc = carry_weight;
			style = 1;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
			text = "";
		};
	};

	class controls {
		class itemHeader: Life_RscText {
			idc = -1;
			text = "Items";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};

		};

		class licenseHeader: Life_RscText {
			idc = -1;
			text = "Lizenzen";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};
			class Attributes {
                    align="right";
                    color = "#FFFFF";
            };
		};

		class moneySHeader: Life_RscText {
			idc = -1;
			text = "Finanzen";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.5};

		};

		class itemList: Life_RscListBox {
			idc = item_list;
			sizeEx = 0.030;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.176 * safezoneH;
		};

		class moneyEdit: Life_RscEdit {
			idc = 2018;
			text = "1";
			sizeEx = 0.030;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class NearPlayers: Life_RscCombo {
			idc = 2022;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class moneyDrop: Life_RscButtonMenu {
			idc = 2001;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.025;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class itemEdit: Life_RscEdit {
			idc = item_edit;
			text = "1";
			sizeEx = 0.030;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class iNearPlayers: Life_RscCombo {
			idc = 2023;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class DropButton: Life_RscButtonMenu {
			idc = 2002;
			text = "$STR_Global_Give";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class UseButton: Life_RscButtonMenu {
			text = "$STR_Global_Use";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_useItem;";
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RemoveButton: Life_RscButtonMenu {
			text = "$STR_Global_Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_removeItem;";
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonClose: Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_lvl";
			onButtonClick = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0642469 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonSettings: Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Settings";
			onButtonClick = "[] call life_fnc_settingsMenu;";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonMyGang: Life_RscButtonMenu {
			idc = 2011;
			text = "$STR_PM_MyGang";
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class Licenses_Menu : Life_RscControlsGroup {
			idc = -1;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.319 * safezoneH;

			class Controls {
				class Life_Licenses: Life_RscStructuredText {
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27;
					h = 0.85;
				};
			};
		};

		class ButtonGangList: Life_RscButtonMenu {
			idc = 2012;
			text = "$STR_PM_WantedList";
			onButtonClick = "[] call life_fnc_wantedMenu";
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonKeys: Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ButtonCell: Life_RscButtonMenu {
			idc = 2014;
			text = "$STR_PM_CellPhone";
			onButtonClick = "createDialog ""Life_my_smartphone"";";
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			
		};

		class ButtonMoves: Life_RscButtonMenu {
 idc = -1;
		  	text = "Börse";
 onButtonClick = "createDialog ""life_dynmarket_prices"";";
 x = 0.391719 * safezoneW + safezoneX;
 y = 0.742 * safezoneH + safezoneY;
 w = 0.0642469 * safezoneW;
 h = 0.022 * safezoneH;
 
		};

		class ButtonAdminMenu: Life_RscButtonMenu {
			idc = 2021;
			text = "Admin Menu";
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.022 * safezoneH;
			class Attributes {align = "center";};
		};

		class ButtonSyncData: Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_PM_SyncData";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscFrame_1800: life_RscFrame
		{
			idc = 1800;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.341 * safezoneH;
		};

		class RscFrame_1801: life_RscFrame
		{
			idc = 1801;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.341 * safezoneH;
		};

		class RscFrame_1802: life_RscFrame
		{
			idc = 1802;
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.341 * safezoneH;
		};
	};
};
