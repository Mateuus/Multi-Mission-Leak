/*
//--Repentz 
POLICE SPECIFIC
*/

class smartphoneCOP {
  idd = 90000;
  movingEnable = false;
  enableSimulation = false;
  class controlsBackground {
    class Life_RscPicture_1200: Life_RscPictureKeepAspect {
      idc = 1200;
      text = "images\Textures\Phone\phoneCop.paa";
      x = -0.0625;
      y = -0.3;
      w = 1.1375;
      h = 1.5;
      colorBackground[] = {0,0,0,0};
    };
  };
  class controls {
    class Life_RscButtonInvisible_2411: Life_RscButtonInvisible
		{
			idc = 2411;
			onButtonClick = "[] spawn life_fnc_placeablesMenu;";
			tooltip = "Place and create roadblocks";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.195 * safezoneH + safezoneY;
			w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
		};

    class perso_idcard: Life_RscButtonInvisible
		{
			onButtonClick = "[player,(player getVariable ['persoRangBez','# UNDEFINIERT #'])] call fvs_fnc_zeigePerso; closeDialog 0;";
			idc = -1;
			x = 0.425194 * safezoneW + safezoneX;
			y = 0.256 * safezoneH + safezoneY;
			w = 0.029 * safezoneW;
			h = 0.049 * safezoneH;
			tooltip = "View your own ID card";
		};

    class Life_RscButtonInvisible_2520: Life_RscButtonInvisible {
      idc = -1;
      onButtonClick = "[] call life_fnc_wantedMenu";
      tooltip = "View the list of wanted people";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.3143 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_5555: Life_RscButtonInvisible {
      idc = -1;
      onButtonClick = "closeDialog 0; createDialog ""smartphone"";";
      tooltip = "Previous Menu";
      x = 0.40294 * safezoneW + safezoneX;
      y = 0.733 * safezoneH + safezoneY;
      w = 0.059 * safezoneW;
      h = 0.049 * safezoneH;
    };
  };
};
