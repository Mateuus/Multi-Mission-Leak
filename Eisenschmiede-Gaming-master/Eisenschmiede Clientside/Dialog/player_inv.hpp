#include "player_sys.sqf"
class playerSettings {
	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = 1;
	onLoad = "[] spawn ES_fnc_getPlayer;";
	
	class controlsBackground {
		class BG: ES_RscPicture
		{
			idc = -1;
			text = "images\Logos\menu_es.jpg";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.61875 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class MainBackgraund: ES_RscText
		{
			idc = -1;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.61875 * safezoneW;
			h = 0.616 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		class moneyTitle: ES_RscText
		{
			idc = -1;
			text = "Finanzen";
			x = 0.64952 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class moneyStatusInfo: ES_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = 0.649355 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.077 * safezoneH;
		};

		class PlayersWeight: ES_RscTitle
		{
			idc = carry_weight;
			style = 1;
			text = "";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
	};
	
    class controls {
	
		class moneyEdit: ES_RscEdit
		{
			idc = 2018;
			text = "1";
			sizeEx = 0.030;
			x = 0.64952 * safezoneW + safezoneX;
			y = 0.6716 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class TitlePlayer: ES_RscTitle
		{
			idc = -1;
			text = "Spieler in der Nähe:";
			x = 0.64952 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class NearPlayers: ES_RscListbox
		{
			idc = 2022;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.649356 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.231 * safezoneH;
			colorText[] = {1,0.502,0,1};
		};

		class licenseHeader: ES_RscTitle
		{
			idc = -1;
			text = "Lizenzen";
			x = 0.304293 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.139055 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class Licenses_Menu: ES_RscControlsGroup
		{
			idc = -1;
			x = 0.304293 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.139055 * safezoneW;
			h = 0.297 * safezoneH;
			class Controls
			{
				class ES_Licenses: ES_RscListBox
				{
					idc = 2014;
					type=5;
					style=0;
					font="PuristaLight";
					sizeEx=0.03;
					shadow=0;
					text = "Keine Lizenz.";
					colorText[] = {1,0.502,0,1};
					x = 0;
					y = 0;
					w = 0.139055 * safezoneW;
					h = 0.297 * safezoneH;
				};
			};
		};

		class itemList: ES_RscListbox
		{
			idc = item_list;
			type=5;
			style=0;
			font="PuristaLight";
			sizeEx=0.03;
			shadow=0;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.297 * safezoneH;
			colorText[] = {1,0.502,0,1};
		};

		class itemEdit: ES_RscEdit
		{
			idc = item_edit;
			text = "1";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.180256 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RemoveButton: ES_RscButtonMenu
		{
			text = "Löschen";
			x = 0.5103 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0566519 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Löschen";
			onButtonClick = "[] call ES_fnc_removeItem;";
		};

		class UseButton: ES_RscButtonMenu
		{
			text = "Benutzen";
			x = 0.448498 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0566519 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] call ES_fnc_useItem;";
			tooltip = "Benutzen";
		};

		class DropButton: ES_RscButtonMenu
		{
			idc = 2002;
			text = "Item Geb.";
			x = 0.572102 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0566519 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			onButtonClick = "[] call ES_fnc_giveItem;";
		};

		class moneyDrop: ES_RscButtonMenu
		{
			idc = 2001;
			text = "Geld geben";
			x = 0.649355 * safezoneW + safezoneX;
			y = 0.7002 * safezoneH + safezoneY;
			w = 0.154505 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			tooltip = "Geld geben";
			onButtonClick = "[] call ES_fnc_giveMoney";
		};

		class GrpPlayer: ES_RscText
		{
			idc = 1234566;
			text = "";
			sizeEx = 0.04;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Deine Gruppe";
		};

		class NamePlayer: ES_RscText
		{
			idc = 1234567;
			text = "";
			sizeEx = 0.04;

			x = 0.309219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Dein Name";
		};

		class SteamIDPlayer: ES_RscText
		{
			idc = 1234568;
			text = "";
			sizeEx = 0.04;
  			tooltip = "Deine SteamID";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class PositionPlayer: ES_RscText
		{
			idc = 1234569;
			text = "";
			sizeEx = 0.04;
  			tooltip = "Deine Position";
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class CopMarker_Text: ES_RscButtonMenu
		{
			idc = 13457;
			onButtonClick = "[] call ES_fnc_copMarkerZones;";
			tooltip = "Polizei Sperrgebiet Marker";
			text = "Sperrzone errichten";
			x = 0.469099 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class CopSkinSwitch_Text: ES_RscButtonMenu
		{
			idc = 13459;
			onButtonClick = "closeDialog 0; createDialog ""ES_copSkinSwitch"";";
			tooltip = "Police Skin Switch Menu WOOOT";
			text = "Skin Switch";
			x = 0.469099 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};

		class ButtonSettings: ES_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call ES_fnc_settingsMenu;";
			text = "Einstellungen";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			tooltip = "Einstellungen";
		};

		class Strich: ES_RscText
		{
			idc = -1;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.616 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class ButtonCell: ES_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "createDialog ""ES_cell_phone"";";
			text = "Telefon";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Telefon";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class ButtonKeys: ES_RscButtonMenu
		{
			idc = 2000;
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			onButtonClick = "createDialog ""ES_key_management"";";
			text = "Schlüssel";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.344148 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Schlüssel";
		};

		class Regeln_Text: ES_RscButtonMenu
		{
			idc = 1245755;
			onButtonClick = "[0] spawn ES_fnc_info;";
			text = "Regeln";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.398222 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Regeln";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class info_Text: ES_RscButtonMenu
		{
			idc = 556734;
			onButtonClick = "[0] spawn ES_fnc_anfang;";
			text = "Infos";
			x = 0.191146 * safezoneW + safezoneX;
			y = 0.452296 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Infos";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class Regeln_COP_Text: ES_RscButtonMenu
		{
			idc = 1245757;
			onButtonClick = "[0] spawn ES_fnc_info;";
			text = "Regeln";
			x = 0.191146 * safezoneW + safezoneX;
			y = 0.398222 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Regeln";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class Button_Gang: ES_RscButtonMenu
		{
			idc = 1209;
			onButtonClick = "if(isNil ""ES_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {if(ES_xp_lvl >= 4) then { createDialog ""ES_Create_Gang_Diag""; } else { hint ""Du kanst erst ab Erfahrungslevel 4 eine Gang erstellen."";}; } else {[] spawn ES_fnc_gangMenu;};};";
			text = "Gang";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.5069 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Gang";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		
		class Button_Boerse: ES_RscButtonMenu
		{
			idc = 1209;
			onButtonClick = "createDialog ""ES_dynmarket_prices"";";
			text = "Börse";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.5589 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Börse";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class ButtonWanted: ES_RscButtonMenu
		{
			idc = 2008;
			onButtonClick = "[] call ES_fnc_wantedMenu";
			text = "Fahndungsliste";
			x = 0.191146 * safezoneW + safezoneX;
			y = 0.452778 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Fahndungsliste";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class ButtonWantedAdd: ES_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "createDialog ""ES_wantedadd2"";";
			text = "Anzeige";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.507296 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Anzeige";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class BUG_Text: ES_RscButtonMenu
		{
			idc = 124575511;
			onButtonClick = "createDialog ""ES_bugreport"";";
			text = "Bug Report";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Bug Report";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class XP_Text: ES_RscButtonMenu
		{
			idc = 12457551;
			onButtonClick = "[0] spawn ES_fnc_lvl_info;";
			text = "Erfahrung";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
			tooltip = "Erfahrungssystem";
			style = 0;
	        sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class exit_button: ES_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Schließen";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.104167 * safezoneW;
			h = 0.043074 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
			tooltip = "Schließen";
		};

		class ButtonSyncData: ES_RscButtonMenu
		{
			idc = 2002;
			text = "Speichern";
			onButtonClick = "[] call SOCK_fnc_syncData;";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.104167 * safezoneW;
			h = 0.043074 * safezoneH;
			colorBackground[] = {0,0,2,0.7};
			tooltip = "Speichern";
		};

		class Aktu: ES_RscButtonMenu
		{
			idc = -1;
			text = "Aktualisieren";
			x = 0.406906 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.104167 * safezoneW;
			h = 0.043074 * safezoneH;
			colorBackground[] = {0,2,0,0.7};
			onButtonClick = "[] call ES_fnc_p_updateMenu;";
			tooltip = "Aktualisieren";
		};

		class ButtonSell: ES_RscButtonMenu
		{
			idc = 2021;
			onButtonClick = "closeDialog 0; createDialog ""ES_shop_sell""; ";
			text = "Artem Menü";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,0,0,0.7};
			tooltip = "Artem Menü";
		};
	};
};