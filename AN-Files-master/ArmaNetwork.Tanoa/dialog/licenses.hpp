/*
    ArmA.Network
    Copyright (c) ArmA.Network 2014 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

class license_overview 
{
  idd = 85240;
  name= "license_overview";
  movingEnable = 0;
  enableSimulation = 1;

  class controlsBackground 
  {
    class RscText_1000: Life_RscText
    {
        idc = -1;
        x = 0.407187 * safezoneW + safezoneX;
        y = 0.379 * safezoneH + safezoneY;
        w = 0.185625 * safezoneW;
        h = 0.264 * safezoneH;
        colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
        idc = 1001;
        text = "Licenses"; //--- ToDo: Localize;
        x = 0.407187 * safezoneW + safezoneX;
        y = 0.379 * safezoneH + safezoneY;
        w = 0.185625 * safezoneW;
        h = 0.022 * safezoneH;
        sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        colorBackground[] = {0,0,0,0.7};
    };
  };
  class controls 
  {
    class RscListbox_1500: Life_RscListbox
    {
        idc = 1500;
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.412 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.187 * safezoneH;
        sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class RscButtonMenu_2400: Life_RscButtonMenu
    {
        idc = 2400;
        text = "Confiscate"; //--- ToDo: Localize;
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.61 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.022 * safezoneH;
        sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        onButtonClick = "[] call life_fnc_licenseCopRemove";
        class Attributes
		{
		    align = "center";
		};
    };
  };    
};