/*
    ArmA.Network
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
class APBSystem 
{
    idd = 56872;
	movingEnable = 0;
	enableSimulation = 1;

    class controlsBackground
    {
        class RscText_1000: Life_RscText
        {
            idc = 1000;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.528 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class additionalinfoback: Life_RscText
        {
            idc = 1001;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.264 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1002: Life_RscText
        {
            idc = 1002;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.253 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_10980: Life_RscText
        {
            idc = 3000;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.286 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls 
    {       
        class RscText_1003: Life_RscText
        {
            idc = 1003;
            text = "Fetching APB List"; //--- ToDo: Localize;
            x = 0.293749 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_1004: Life_RscText
        {
            idc = 1004;
            text = "Additional APB Information"; //--- ToDo: Localize;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_2400: Life_RscButtonMenu
        {
            idc = 2400;
            text = "New APB"; //--- ToDo: Localize;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedAPBCreate;";
        };
        class RscButtonMenu_2401: Life_RscButtonMenu
        {
            idc = 2401;
            text = "Close"; //--- ToDo: Localize;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "closeDialog 0;";
        };
        class RscButtonMenu_2402: Life_RscButtonMenu
        {
            idc = 2402;
            text = "Respond"; //--- ToDo: Localize;
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "['assign'] call life_fnc_apbSpecific";
        };
        class RscButtonMenu_2403: Life_RscButtonMenu
        {
            idc = 2403;
            text = "Delete"; //--- ToDo: Localize;
            x = 0.608281 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "['remove'] call life_fnc_apbSpecific";
        };
        class RscText_1005: Life_RscText
        {
            idc = 1005;
            text = "GPS Information"; //--- ToDo: Localize;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class apblist: Life_RscListbox
        {
            idc = 1500;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.484 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onLBSelChanged = "_this call life_fnc_selectAPB";
        };
        class RscStructuredText_1100: Life_RscStructuredText
        {
            idc = 1100;
            text = "<t align = 'center'>Select an APB from the list on the left to continue. Information of that specific APB will displayed here. The GPS information will show the vicinity of the location that the APB was listed. If no unit is responding to an APB, you may set yourself as the responding unit. If you filed the APB, you may delete it from the Active APB list. All APBs will be deleted on Server Start.</t>";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.232031 * safezoneW;
            h = 0.187 * safezoneH;
            size = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class gpsmapinfo: Life_RscMapControl
        {
            idc = 1101;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.231 * safezoneH;
            maxSatelliteAlpha = 0.75;
            alphaFadeStartScale = 1.15;
            alphaFadeEndScale = 1.29;
        };
        class RscButtonMenu_2404: Life_RscButtonMenu
        {
            idc = 2404;
            text = "Refresh List"; //--- ToDo: Localize;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedAPBOpen;";
        };
        //
        class RscText_4003: Life_RscText
        {
            idc = 3003;
            text = "New APB"; //--- ToDo: Localize;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_4404: Life_RscButtonMenu
        {
            idc = 3404;
            text = "Submit APB"; //--- ToDo: Localize;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedAPBSubmit";
        };
        class RscButtonMenu_4400: Life_RscButtonMenu
        {
            idc = 3400;
            text = "Back"; //--- ToDo: Localize;
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedAPBOpen;";
        };
        class RscText_4001: Life_RscText
        {
            idc = 3001;
            text = "Title"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscEdit_4400: Life_RscEdit
        {
            idc = 3500;
            text = "";
            x = 0.417499 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = "0.9 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_43002: Life_RscText
        {
            idc = 3002;
            text = "Description"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscEdit_43401: Life_RscEdit
        {
            idc = 3401;
            text = "";
            x = 0.417499 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = "0.9 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_23004: Life_RscText
        {
            idc = 3004;
            text = "Additional Info"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscEdit_42402: Life_RscEdit
        {
            idc = 3402;
            text = "";
            x = 0.417499 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = "0.9 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_43005: Life_RscText
        {
            idc = 3005;
            text = "Responding Unit"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_10306: Life_RscText
        {
            idc = 3006;
            text = "All Units Respond"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscCheckbox_28320: Life_Checkbox
        {
            idc = 3800;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class RscCheckbox_28321: Life_Checkbox
        {
            idc = 3801;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.044 * safezoneH;
        };
        class RscText_1347: Life_RscText
        {
            idc = 3007;
            text = "(Check if you want your unit to be assigned)"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_43008: Life_RscText
        {
            idc = 3008;
            text = "(Check if you want all units to respond e.g. bank robberies)"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.8 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
};