/*
//--Repentz 
*/

class smartphone {
  idd = 90000;
  movingEnable = false;
  enableSimulation = false;
  class controlsBackground {
    class Life_RscPicture_1200: Life_RscPictureKeepAspect {
      idc = 1200;
      text = "images\Textures\Phone\phoneBack.paa";
      x = -0.0625;
      y = -0.3;
      w = 1.1375;
      h = 1.5;
      colorBackground[] = {0,0,0,0};
    };
 };

  class controls {
    class Life_RscButtonInvisible_2401: Life_RscButtonInvisible {
      idc = 2401;
      onButtonClick = "createDialog ""life_inventory_menu"";";
      tooltip = "View and manage your virtual items in your inventory";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.195 * safezoneH + safezoneY;
			w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2400: Life_RscButtonInvisible {
      idc = 2400;
      onButtonClick = "createDialog ""life_license_menu"";";
      tooltip = "Check your licenses";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.256 * safezoneH + safezoneY;
			w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };
    
    class Life_RscButtonInvisible_2402: Life_RscButtonInvisible {
      idc = 2402;
      onButtonClick = "createDialog ""Life_key_management"";";
      tooltip = "View and share your car keys";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.3143 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2408: Life_RscButtonInvisible {
      idc = 2408;
      onButtonClick = "createDialog ""life_money_menu"";";
      tooltip = "Check and exchange your money";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.380 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };
    class Life_RscButtonInvisible_2403: Life_RscButtonInvisible {
      idc = 2403;
      onButtonClick = "[] call life_fnc_settingsMenu;";
      tooltip = "Modify your view settings";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.439 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2404: Life_RscButtonInvisible {
      idc = 2404;
      onButtonClick = "createDialog ""Life_my_smartphone"";";
      tooltip = "Send messages to other players or emergency services";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.5 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2407: Life_RscButtonInvisible {
      idc = 2407;
      onButtonClick = "createDialog ""RscDisplayServerInfoMenu"";";
      tooltip = "Open our information menu";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.567 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2406: Life_RscButtonInvisible {
      idc = 2406;
      onButtonClick = "createDialog ""TTM_GUI_RscDisplayTalentOverview"";";
      tooltip = "View your current skills and upgrades";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.632 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_5555: Life_RscButtonInvisible {
      idc = -1;
      //onButtonClick = "closeDialog 0; createDialog ""smartphone2"";";
      onButtonClick = "[] call life_fnc_smartphone2;";
      tooltip = "View more apps";
      x = 0.40294 * safezoneW + safezoneX;
      y = 0.733 * safezoneH + safezoneY;
      w = 0.059 * safezoneW;
      h = 0.049 * safezoneH;
    };
  };
};
