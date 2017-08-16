/**
 * Author Entity
 */

#include "player_sys.sqf"
class playerSettings {
    idd = playersys_DIALOG;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = "[] call life_fnc_openEffect;";

    class controlsBackground {
        class RscText_1000: Life_RscText
        {
            idc = 1000;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.5522 * safezoneH;
            colorBackground[] = {0.082,0.082,0.082,0.8};
        };
        class RscText_1001: Life_RscText
        {
            idc = 1001;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.2624 * safezoneH + safezoneY;
            w = 0.0989999 * safezoneW;
            h = 0.5104 * safezoneH;
            colorBackground[] = {0.082,0.082,0.082,0.95};
        };
    };
    class controls {
        class RscText_1003: Life_RscText {
            idc = 1003;
            text = "Functions";
            x = 0.605187 * safezoneW + safezoneX;
            y = 0.2646 * safezoneH + safezoneY;
            w = 0.0948751 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0.067,1,0.6};
      };

      class Phone: Life_RscButtonMenu {
            idc = -1;
            text = "Phone";
			onButtonClick = "if(getNumber(missionConfigFile >> ""CellPhone_Settings"" >> ""use_old_gui"") == 1) then { createDialog ""Life_cell_phone""; } else { createDialog ""Life_cell_phone_new""; };";
            x = 0.60725 * safezoneW + safezoneX;
            y = 0.2932 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {-1,-1,-1,-1};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
      };

      class RscButtonMenu_2401: Life_RscButtonMenu {
            idc = 2013;
            text = "Key Chain";
            onButtonClick = "createDialog ""Life_key_management"";";
            x = 0.60725 * safezoneW + safezoneX;
            y = 0.3306 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {-1,-1,-1,-1};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
      };

      class RscButtonMenu_2499: Life_RscButtonMenu {
            idc = 2030;
            text = "PLACEABLES";
            onButtonClick = "[] spawn life_fnc_placeablesMenu;[true] call life_fnc_placeableCancel; closeDialog 0;";	
            x = 0.60725 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };
	   
	   class RscButtonMenu_2402: Life_RscButtonMenu {
            idc = 2011;
            text = "Gangs";
            onButtonClick = "if (isNil ""life_action_gangInUse"") then {if (isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
            x = 0.60725 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscButtonMenu_2403: Life_RscButtonMenu {
            idc = -1;
            text = "Settings";
            onButtonClick = "[] call life_fnc_settingsMenu;";
            x = 0.60725 * safezoneW + safezoneX;
            y = 0.4054 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {-1,-1,-1,-1};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
       };

       class RscButtonMenu_2404: Life_RscButtonMenu {
           idc = -1;
           text = "Sync";
           onButtonClick = "[] call SOCK_fnc_syncData;";
           x = 0.60725 * safezoneW + safezoneX;
           y = 0.4428 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
        };

       class RscButtonMenu_2405: Life_RscButtonMenu {
           idc = 2012;
           text = "Wanted Menu";
           onButtonClick = "[] call life_fnc_wantedMenu";
           x = 0.607249 * safezoneW + safezoneX;
           y = 0.5176 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscButtonMenu_2406: Life_RscButtonMenu {
           idc = 2021;
           text = "Admin Menu";
           onButtonClick = "createDialog ""life_admin_menu"";";
           x = 0.60725 * safezoneW + safezoneX;
           y = 0.555 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscText_1004: Life_RscText {
           idc = 1004;
           text = "Inventory";
           x = 0.605188 * safezoneW + safezoneX;
           y = 0.5968 * safezoneH + safezoneY;
           w = 0.0948751 * safezoneW;
           h = 0.022 * safezoneH;
           colorBackground[] = {0,0.067,1,0.6};
       };

       class RscButtonMenu_2407: Life_RscButtonMenu {
           idc = 2407;
           text = "Use";
           onButtonClick = "[] call life_fnc_useItem;";
           x = 0.606219 * safezoneW + safezoneX;
           y = 0.6298 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscButtonMenu_2408: Life_RscButtonMenu {
           idc = 2408;
           text = "Remove";
           onButtonClick = "[] call life_fnc_removeItem;";
           x = 0.606219 * safezoneW + safezoneX;
           y = 0.7046 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscButtonMenu_2409: Life_RscButtonMenu {
           idc = 2002;
           text = "Give";
           onButtonClick = "[] call life_fnc_giveItem;";
           x = 0.606219 * safezoneW + safezoneX;
           y = 0.6672 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
       };

       class RscText_1005: Life_RscText {
            idc = 1005;
            x = 0.297875 * safezoneW + safezoneX;
            y = 0.2624 * safezoneH + safezoneY;
            w = 0.0989999 * safezoneW;
            h = 0.5082 * safezoneH;
            colorBackground[] = {0.082,0.082,0.082,0.95};
       };

       class RscText_1006: Life_RscText {
           idc = 1006;
           text = "Money";
           x = 0.299937 * safezoneW + safezoneX;
           y = 0.2668 * safezoneH + safezoneY;
           w = 0.0948751 * safezoneW;
           h = 0.022 * safezoneH;
           colorBackground[] = {0,0.067,1,0.6};
       };

       class moneyStatusInfo: Life_RscStructuredText
       {
           idc = 2015;
           x = 0.300968 * safezoneW + safezoneX;
           y = 0.2954 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.088 * safezoneH;
       };

       class NearPlayers: Life_RscCombo
       {
          idc = 2022;
          x = 0.300969 * safezoneW + safezoneX;
          y = 0.39 * safezoneH + safezoneY;
          w = 0.0928125 * safezoneW;
          h = 0.022 * safezoneH;
       };

       class MoneyEdit: Life_RscEdit
       {
          idc = 2018;
          text = "1";
          sizeEx = 0.030;
          x = 0.300968 * safezoneW + safezoneX;
          y = 0.4164 * safezoneH + safezoneY;
          w = 0.0928125 * safezoneW;
          h = 0.022 * safezoneH;
       };

       class RscButtonMenu_2400: Life_RscButtonMenu
       {
          idc = 2001;
          text = "Send";
          onButtonClick = "[] call life_fnc_giveMoney";
          sizeEx = 0.025;
          x = 0.299937 * safezoneW + safezoneX;
          y = 0.4428 * safezoneH + safezoneY;
          w = 0.0948749 * safezoneW;
          h = 0.0286 * safezoneH;
       };

       class RscText_1007: Life_RscText
       {
          idc = 1007;
          text = "Licenses"; //--- ToDo: Localize;
          x = 0.299937 * safezoneW + safezoneX;
          y = 0.4736 * safezoneH + safezoneY;
          w = 0.0948751 * safezoneW;
          h = 0.022 * safezoneH;
          colorBackground[] = {0,0.067,1,0.6};
       };

       class Life_Licenses: Life_RscStructuredText
       {
          idc = 2014;
          x = 0.298907 * safezoneW + safezoneX;
          y = 0.4978 * safezoneH + safezoneY;
          w = 0.0969374 * safezoneW;
          h = 0.2706 * safezoneH;
       };

       class RscFrame_1800: Life_RscFrame {
           idc = 1800;
           x = 0.296844 * safezoneW + safezoneX;
           y = 0.2624 * safezoneH + safezoneY;
           w = 0.102094 * safezoneW;
           h = 0.5104 * safezoneH;
       };

       class RscFrame_1802: Life_RscFrame {
          idc = 1802;
          x = 0.402031 * safezoneW + safezoneX;
          y = 0.2624 * safezoneH + safezoneY;
          w = 0.197999 * safezoneW;
          h = 0.5104 * safezoneH;
       };

       class RscFrame_1803: Life_RscFrame {
           idc = 1803;
           x = 0.603125 * safezoneW + safezoneX;
           y = 0.2624 * safezoneH + safezoneY;
           w = 0.100032 * safezoneW;
           h = 0.5104 * safezoneH;
       };

       class RscText_1002: Life_RscText {
           idc = 1002;
           text = "Player Menu";
           x = 0.295813 * safezoneW + safezoneX;
           y = 0.2316 * safezoneH + safezoneY;
           w = 0.407341 * safezoneW;
           h = 0.0242 * safezoneH;
           colorBackground[] = {0,0.067,1,0.6};
       };

       class RscText_1008: Life_RscText {
           idc = 1008;
           text = "Inventory";
           x = 0.404093 * safezoneW + safezoneX;
           y = 0.2668 * safezoneH + safezoneY;
           w = 0.192821 * safezoneW;
           h = 0.022 * safezoneH;
           colorBackground[] = {0,0.067,1,0.6};
       };

       class itemlist: Life_RscListBox {
           idc = item_list;
           sizeEx = 0.030;
           x = 0.405125 * safezoneW + safezoneX;
           y = 0.2954 * safezoneH + safezoneY;
           w = 0.190781 * safezoneW;
           h = 0.2948 * safezoneH;
       };

       class ItemEdit: Life_RscEdit {
           idc = item_edit;
           text = "1";
           x = 0.405125 * safezoneW + safezoneX;
           y = 0.5946 * safezoneH + safezoneY;
           w = 0.190762 * safezoneW;
           h = 0.0286 * safezoneH;
       };

       class iNearPlayers: Life_RscCombo {
           idc = 2023;
           x = 0.404094 * safezoneW + safezoneX;
           y = 0.6276 * safezoneH + safezoneY;
           w = 0.191811 * safezoneW;
           h = 0.022 * safezoneH;
       };

       class RscText_1009: Life_RscText {
           idc = 1009;
           text = "Weight";
           x = 0.404094 * safezoneW + safezoneX;
           y = 0.654 * safezoneH + safezoneY;
           w = 0.192821 * safezoneW;
           h = 0.022 * safezoneH;
           colorBackground[] = {0,0.067,1,0.6};
       };

       class RscText_1010: Life_RscText {
           idc = 1010;
           text = "Player:";
           x = 0.407187 * safezoneW + safezoneX;
           y = 0.687 * safezoneH + safezoneY;
           w = 0.0773437 * safezoneW;
           h = 0.022 * safezoneH;
       };

       class PlayersName: Life_RscText {
           text = "";
           idc = carry_weight;
           x = 0.448438 * safezoneW + safezoneX;
           y = 0.687 * safezoneH + safezoneY;
           w = 0.0773437 * safezoneW;
           h = 0.022 * safezoneH;
       };

       class RscButtonMenu_2410: Life_RscButtonMenu {
           idc = 2410;
           text = "Info";
           onButtonClick = "[] call life_fnc_welcomeNotification;";
           x = 0.60725 * safezoneW + safezoneX;
           y = 0.4802 * safezoneH + safezoneY;
           w = 0.0928125 * safezoneW;
           h = 0.033 * safezoneH;
           colorBackground[] = {-1,-1,-1,-1};
           colorBackgroundFocused[] = {1,1,1,0.12};
           colorBackground2[] = {0.75,0.75,0.75,0.2};
           color[] = {1,1,1,1};
           colorFocused[] = {0,0,0,1};
           color2[] = {0,0,0,1};
           colorText[] = {1,1,1,1};
           colorDisabled[] = {0,0,0,0.4};
      };
	  
	  class RscButtonMenu_2498: Life_RscButtonMenu {
            idc = 2028;
            text = "SWAT MENU";
            onButtonClick = "closeDialog 0; createDialog ""life_swat_menu"";";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.806 * safezoneH + safezoneY;
            w = 0.41 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,1,0.75};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
			class Attributes 
            {
                align = "center";
            };
      };
	  
	  class RscButtonMenu_2497: Life_RscButtonMenu {
            idc = 2029;
            text = "Support our server and community - DONATE !";
           onButtonClick = "[] call life_fnc_DonationNotification;";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.19 * safezoneH + safezoneY;
            w = 0.41 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {1,1,0,0.75};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
			class Attributes 
            {
                align = "center";
            };
      };
	  
	  class RscButtonMenu_2455: Life_RscButtonMenu {
           idc = 2045;
           text = "Price list";
		   onButtonClick = "closeDialog 0; [] call life_fnc_PriceListMenu";
           x = 0.458438 * safezoneW + safezoneX;
           y = 0.727 * safezoneH + safezoneY;
           w = 0.0773437 * safezoneW;
           h = 0.022 * safezoneH;
            colorBackground[] = {0.6,0.8,1,0.75};
            colorBackgroundFocused[] = {1,1,1,0.12};
            colorBackground2[] = {0.75,0.75,0.75,0.2};
            color[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            color2[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            colorDisabled[] = {0,0,0,0.4};
			class Attributes 
            {
                align = "center";
            };
      };
	  
	  class watermark : life_RscPicture 
		{
				idc = -1;
				text = "images\outlawed.paa";
				x = 0.45375 * safezoneW + safezoneX;
				y = 0.065 * safezoneH + safezoneY;
				w = 0.10 * safezoneW;
				h = 0.148 * safezoneH;
		};
   };
};