/*
//--Repentz 
CIVILIAN SPECIFIC
*/

class smartphoneCIV {
  idd = 90000;
  movingEnable = false;
  enableSimulation = false;
  class controlsBackground {
    class Life_RscPicture_1200: Life_RscPictureKeepAspect {
      idc = 1200;
      text = "images\Textures\Phone\phoneCiv.paa";
      x = -0.0625;
      y = -0.3;
      w = 1.1375;
      h = 1.5;
      colorBackground[] = {0,0,0,0};
    };
  };
  class controls {
    class Life_RscButtonInvisible_2405: Life_RscButtonInvisible {
      idc = 2405;
	    onButtonClick = "[] spawn life_fnc_openMarketView;";
      tooltip = "Open the marked to see the price of goods";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.195 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2491: Life_RscButtonInvisible {
      idc = 2491;
      onButtonClick = "[] call life_fnc_bountyMenu;";
      tooltip = "View current bounties on people";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.256 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class Life_RscButtonInvisible_2409: Life_RscButtonInvisible {
      idc = 2409;
      onButtonClick = "if (isNil ""life_action_gangInUse"") then {if (isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
      tooltip = "Here you can create a gang and manage it";
      x = 0.425194 * safezoneW + safezoneX;
			y = 0.3143 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
    };

    class perso_idcard: Life_RscButtonInvisible
		{
			onButtonClick = "[player,(player getVariable ['persoRangBez','# UNDEFINIERT #'])] call fvs_fnc_zeigePerso; closeDialog 0;";
			idc = -1;
			x = 0.425194 * safezoneW + safezoneX;
      y = 0.380 * safezoneH + safezoneY;
      w = 0.029 * safezoneW;
      h = 0.049 * safezoneH;
			tooltip = "View your own ID card";
		};

    class Life_RscButtonInvisible_24022: Life_RscButtonInvisible {
      idc = -1;
      onButtonClick = "createDialog ""holy_bug"";";
      tooltip = "Report a bug to the admins";
      x = 0.425194 * safezoneW + safezoneX;
      y = 0.439 * safezoneH + safezoneY;
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
