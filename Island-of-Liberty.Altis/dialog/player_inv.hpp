#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
		class pictureBackgrod: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\ztablet.paa";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.165 * safezoneH + safezoneY;
			w = 0.629062 * safezoneW;
			//w = 0,7 * safezoneW;
			//h = 0.759 * safezoneH;
			h = 0.659 * safezoneH;
		};
		
		class life_RscTitleBackgorund: Life_RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class Title: Life_RscTitle
		{
			idc = 1001;
			text = "";
			x = 0.5879 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class moneyStatusInfo: Life_RscStructuredText
		{
			idc = 2015;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.056 * safezoneH;
			sizeEx = 0.020 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class PlayersName : Title 
		{
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader: Life_RscText
		{
			idc = -1;
			text = $STR_PM_cItems;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class licenseHeader: Life_RscText
		{
			idc = -1;
			text = $STR_PM_Licenses;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class moneySHeader: Life_RscText
		{
			idc = -1;
			text = $STR_PM_MoneyStats;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	
		class itemList: Life_RscListbox
		{
			idc = item_list;
			sizeEx = 0.030;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};

		class moneyEdit: Life_RscEdit
		{
			idc = 2018;
			text = "1"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
		};
		
		class NearPlayers: Life_RscCombo
		{
			idc = 2022;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class moneyDrop: Life_RscButtonMenu
		{
			idc = 2001;
			onButtonClick = "[] call life_fnc_giveMoney;";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Geben";
		};	
	
		class itemEdit: Life_RscEdit
		{
			idc = item_edit;
			text = "1"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
		};

		class iNearPlayers: Life_RscCombo
		{
			idc = 2023;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
		};

		
		//////////////// ICONS START /////////////////////////
		class ButtonSyncData_icon: Life_RscPicture
		{
			idc = 1201;
			text = "icons\phone\save.paa";
			x = 0.3708 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class ButtonKeys_icon: Life_RscPicture
		{
			idc = 1202;
			text = "icons\phone\key.paa";
			x = 0.4808 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class ButtonSettings_icon: Life_RscPicture
		{
			idc = 1204;
			text = "icons\phone\settings.paa";
			x = 0.4258 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};

		class ButtonCell_icon: Life_RscPicture
		{
			idc = 1206;
			text = "icons\phone\smartphone.paa";
			x = 0.5908 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class ButtonWantedList_icon: Life_RscPicture
		{
			idc = 20121;
			text = "icons\phone\flist.paa";
			x = 0.5358 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		/*
		class ButtonMarkt_icon: Life_RscPicture
		{
			idc = 20213;
			text = "icons\phone\markt.paa";
			x = 0.5775 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};*/
		class ButtonMyGang_icon: Life_RscPicture
		{
			idc = 20111;
			text = "icons\phone\gang.paa";
			x = 0.5358 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		/*class ButtonCraftList_icon: Life_RscPicture
		{
			idc = 20251;
			text = "icons\phone\craft.paa";
			x = 0.5275 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};*/
		
		/*
		class ButtonWantedAdd_icon: Life_RscPicture
		{
			idc = 98001;
			text = "icons\phone\wadd.paa";
			x = 0.6458 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		*/
		class ButtonAdminMenu_icon: Life_RscPicture
		{
			idc = 20211;
			text = "icons\phone\admin.paa";
			x = 0.3158 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		
		class UseButton_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\use.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class DropButton_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\give.paa";
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class RemoveButton_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\deleteGang.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class moneyDrop_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\give.paa";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Geben";
		};
		
		class RefreshI_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\refresh.paa";
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class RefreshM_icon: Life_RscPicture
		{
			idc = -1;
			text = "icons\phone\refresh.paa";
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		///////////// ICONS  ENDE ///////////////////////////
		class DropButton: Life_RscButtonMenu
		{
			idc = 2002;
			onButtonClick = "[] call life_fnc_giveItem;";
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Geben";
		};

		class UseButton: Life_RscButtonMenu
		{
			onButtonClick = "closeDialog 0; [] call life_fnc_useItem;";
			idc = 2402;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Benutzen";
		};

		class RemoveButton: Life_RscButtonMenu
		{
			onButtonClick = "[] call life_fnc_removeItem;";
			idc = 2403;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Wegwerfen";
		};
		
		
		
		
		class RefreshIButton: Life_RscButtonMenu
		{
			onButtonClick = "[1] call life_fnc_refreshNear;";
			idc = 2403;
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Nahe Spieler neu laden";
		};
		
		class RefreshMButton: Life_RscButtonMenu
		{
			onButtonClick = "[1] call life_fnc_refreshNear;";
			idc = 2403;
			x = 0.4845313 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Nahe Spieler neu laden";
		};

		class ButtonClose: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = " "; //--- ToDo: Localize;
			/*
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
			*/
			x = (38.53/52) * safezoneW + safezoneX;
			y = (6.5/30) * safezoneH + safezoneY;
			w = 0.048 * safezoneW;
			h = (17/30) * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Schließen";
		};

		class ButtonSettings: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_settingsMenu;";
			// colorBackgroundFocused[] = {0,0,0,0};
			x = 0.4258 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Einstellungen";
		};

		class ButtonCell: Life_RscButtonMenu
		{
			idc = 20144;
			onButtonClick = "createDialog ""Life_cell_phone"";";
			x = 0.5908 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Smartphone";
		};

		class Licenses_menu: Life_RscControlsGroup
		{
			idc = -1;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			class controls
			{
				class Life_Licenses: Life_RscStructuredText
				{
					idc = 2014;
					x = -2.45869e-008 * safezoneW;
					y = 8.19564e-009 * safezoneH;
					w = 0.12 * safezoneW;
					h = 0.33 * safezoneH;
					colorBackground[] = {0,0,0,0.3};					
				};
			};
		};
		
		class ButtonMyGang: Life_RscButtonMenu
		{
			idc = 2011;
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.5358 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Gangmenü";
		};
		/*
		class ButtonCraftList: Life_RscButtonMenu
		{
			idc = 2025;
			onButtonClick = "createDialog ""life_craft"";";
			x = 0.5275 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Bau Menü";
		};
		*/
		class ButtonKeys: Life_RscButtonMenu
		{
			idc = 2013;
			onButtonClick = "createDialog ""Life_key_management"";";
			x = 0.4808 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Schlüsselbund";
		};
		class ButtonWantedList: Life_RscButtonMenu
		{
			idc = 2012;
			onButtonClick = "[] spawn life_fnc_wantedMenu";
			x = 0.5358 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Wantedliste";
		};
		
		class ButtonAdminMenu: Life_RscButtonMenu
		{
			idc = 2021;
			onButtonClick = "createDialog ""life_admin_menu"";";
			x = 0.3158 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Adminmenü";
		};
		
		class ButtonSyncData: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call SOCK_fnc_syncData; [] call life_fnc_clothing;";
			x = 0.3708 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Speichern";
		};
		/*
		class ButtonMarkt: Life_RscButtonMenu
		{
			idc = 201213;
			onButtonClick = "createDialog ""life_dynmarket_prices"";";
			x = 0.5775 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Wirtschaft Preislisten";
		};*/
		
		/*
		class ButtonFinances2 : Life_RscButtonMenu {
			idc = 5024;
			text = "Notice";
			onButtonClick = "[] spawn life_fnc_openNotice;";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};*/
		
		/*
		class ButtonWantedAdd: Life_RscButtonMenu
		{
			idc = 9800;
			onButtonClick = "createDialog ""life_wantedadd2"";";
			x = 0.6458 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {-1,-1,-1,-1};
			colorBackgroundFocused[] = {-1,-1,-1,-1};
			colorBackground2[] = {-1,-1,-1,-1};
			color[] = {-1,-1,-1,-1};
			colorFocused[] = {-1,-1,-1,-1};
			color2[] = {-1,-1,-1,-1};
			colorText[] = {-1,-1,-1,-1};
			colorDisabled[] = {-1,-1,-1,-1};
			tooltip = "Wanted Add";
		};
		*/
////////////////////////////////////////////	
	};
};