/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/


#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
	
		class Frame_Background: RscText
		{
			idc = 1002;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title_Licenses: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			idc = 1004;
			text = "Lizenzen"; //--- ToDo: ;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class Title_Title: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			idc = 1005;
			text = "Z-Inventar"; //--- ToDo: ;
			x = 0.314895 * safezoneW + safezoneX;
			y = 0.244037 * safezoneH + safezoneY;
			w = 0.383437 * safezoneW;
			h = 0.0225926 * safezoneH;
		};
		class Title_Money: RscText
		{
			idc = 1006;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			text = "Finanzen"; //--- ToDo: ;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*class itemgewichtanzeige: RscText
		{
			idc = carry_weight;
			x = 0.668012 * safezoneW + safezoneX;
			y = 0.276009 * safezoneH + safezoneY;
			w = 0.0765019 * safezoneW;
			h = 0.0439828 * safezoneH;
		};*/
		class Title_Item: RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			idc = 1007;
			text = "Items"; //--- ToDo: ;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.382 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Picture_Bank: RscPicture
		{
			idc = 1200;
			text = "MINEFACTORY\icons\ico_bank.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Picture_Cash: RscPicture
		{
			idc = 1202;
			text = "MINEFACTORY\icons\ico_money.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};
	
	class controls {
		
		class Combo_MoneyPlayers: RscCombo
		{
			idc = 2022;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.383407 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*class geldstatustext: RscText
		{
			idc = 1001;
			x = 0.412271 * safezoneW + safezoneX;
			y = 0.335064 * safezoneH + safezoneY;
			w = 0.157313 * safezoneW;
			h = 0.362858 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};*/
		class List_Items: life_RscListBox
		{
			idc = item_list;
			sizeEx = 0.03;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.428556 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class Edit_MoneyAmount : RscEdit
		{
			text = "1";			
			idc = 2018;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.359778 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button_MoneyGive : RscButtonMenu
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			onButtonClick = "[] call life_fnc_giveMoney";
			idc = 2001;
			text = "Geben"; //--- ToDo: ;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button_ItemGive: RscButtonMenu
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			onButtonClick = "[] call life_fnc_giveItem;";
			idc = 2002;
			text = "Geben"; //--- ToDo: ;
			x = 0.464063 * safezoneW + safezoneX;
			y = 0.670371 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Button_ItemUse : RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_useItem;";
			idc = 2403;
			text = "Benutzen"; //--- ToDo: ;
			x = 0.464063 * safezoneW + safezoneX;
			y = 0.69537 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Button_ItemRemove : RscButtonMenu
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			onButtonClick = "[] call life_fnc_removeItem;";
			idc = 2404;
			text = "Entfernen"; //--- ToDo: ;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Combo_ItemPlayers : RscCombo
		{
			idc = 2023;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Edit_ItemAmount : RscEdit
		{
			idc = item_edit;
			text = "1";
			x = 0.464062 * safezoneW + safezoneX;
			y = 0.617593 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_BankText : RscText
		{
			idc = 1008;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_CashText : RscText
		{
			idc = 1009;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class List_Licenses : life_RscListBox
		{
			idc = 2014;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.275 * safezoneH;
			sizeEx = 0.03;
		};
		class closebutton : RscButtonMenu
		{
			colorBackground[] = {(209/255), 0, 0, 0.8};
			onButtonClick = "closeDialog 0;";
			idc = 2400;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.718519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class settingbutton: RscButtonMenu
		{
			onButtonClick = "[] call CHVD_fnc_openDialog;";
			idc = -1;
			text = "Einstellung"; //--- ToDo: ;
			x = 0.605677 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class gangbutton: RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_gangzmenu;";
			idc = 2012;
			text = "Gang Menu"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.294444 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class schlusselbund: RscButtonMenu
		{
			onButtonClick = "createDialog ""Life_key_management"";";
			idc = 2013;
			text = "Schlusselbund"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.319445 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class telefonbutton: RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_openMessages;";
			idc = 2014;
			text = "SMS"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.344444 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class speichernbutton: RscButtonMenu
		{
			onButtonClick = "[] call SOCK_fnc_updateRequest;";
			idc = -1;
			text = "Speichern"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.369444 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class adminmenu: RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_adminmenuzmenu;";
			idc = 2410;
			text = "Admin menu"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.394445 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*class bugliste: RscButtonMenu
		{
			onButtonClick = "createDialog ""bugHunter""";
			idc = 2411;
			text = "Bug Melden"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.419444 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};*/
		class marktsystem: RscButtonMenu
		{
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			idc = 2412;
			text = "Markt Preise"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.443519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class fahndungsliste: RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_fahndungslistezmenu;";
			idc = 2413;
			text = "Wanted"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.468519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class fahndungslistenew: RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_copcomputerzmenu;";
			idc = 9445;
			text = "Cop PC"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.493518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class waffencrafting: RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_craftweapon;";
			idc = 2415;
			text = "Waffe Bauen"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.518518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class craftingvehiclebutton: RscButtonMenu
		{
			onButtonClick = "[] spawn life_fnc_craft;";
			idc = 2416;
			text = "Auto Bauen"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.543518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class abspeerungbuttoncop: RscButtonMenu
		{
			idc = 2417;
			text = "Absperrungen"; //--- ToDo: ;
			onButtonClick = "[] spawn life_fnc_placeablesMenu; closeDialog 0;";
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.568518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class abspeerungbuttonmedic: RscButtonMenu
		{
			idc = 2420;
			text = "Absperrungen"; //--- ToDo: ;
			onButtonClick = "[] call life_fnc_absperrungen; closeDialog 0;";
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.568518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class rulesbtn: RscButtonMenu
		{
			onButtonClick = "createDialog ""Regeln"";";
			idc = 2418;
			text = "Regeln"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.593519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class itemsbuild: RscButtonMenu
		{
			onButtonClick = "createDialog ""Life_craft_Item"";";
			idc = 2419;
			text = "Items Bauen"; //--- ToDo: ;
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.618519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Button_phoneCalls : RscButtonMenu
		{
			idc = -1;
			text = "Telefon";
			onButtonClick = "[7] call phoneCalls_fnc_partial;";
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.643518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class medicpc: RscButtonMenu
		{
			onButtonClick = "closedialog 0; createDialog ""kommandozentrale"";";
			idc = 1217;
			text = "Medic PC";
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.668518 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		/*
		class button_19: RscPicture
		{
			idc = 1218;
			text = "#(argb,8,8,3)color(0,0,0,1)";
			x = 0.605729 * safezoneW + safezoneX;
			y = 0.693519 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
	};
};