/*
    ArmA.Network
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
class TSODatabase 
{
    idd = 56873;
	movingEnable = 0;
	enableSimulation = 1;

    class controlsBackground
    {
        class RscText_1000: Life_RscText
        {
            idc = -1;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.350625 * safezoneW;
            h = 0.429 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscPicture_1200: Life_RscPicture
        {
            idc = -1;
            text = "temp\sheriffofficelogo.paa";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.286 * safezoneH;
        };
        class RscText_1001: Life_RscText
        {
            idc = 1001;
            text = "TSO Database"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.350625 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
    class controls 
    {
        class Life_RscButtonMenu_2400: Life_RscButtonMenu
        {
            idc = 2400;
            text = "Wanted List"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "closeDialog 0; [] call life_fnc_wantedMenuOpen";
        };
        class Life_RscButtonMenu_2401: Life_RscButtonMenu
        {
            idc = 2401;
            text = "APB List"; //--- ToDo: Localize;
            x = 0.510313 * safezoneW + safezoneX;
            y = 0.643 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "closeDialog 0; [] call life_fnc_wantedAPBOpen";
        };
        class Life_RscButtonMenu_2402: Life_RscButtonMenu
        {
            idc = 2402;
            text = "Tanoa Camera Database"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class Life_RscButtonMenu_2403: Life_RscButtonMenu
        {
            idc = 2403;
            text = "Prisoner List"; //--- ToDo: Localize;
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class Life_RscButtonMenu_2404: Life_RscButtonMenu
        {
            idc = 2404;
            text = "Government Security Detail"; //--- ToDo: Localize;
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class Life_RscButtonMenu_2405: Life_RscButtonMenu
        {
            idc = 2405;
            text = "Checkpoints"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_1002: Life_RscText
        {
            idc = 1002;
            text = "Loading TSO Database"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
};
