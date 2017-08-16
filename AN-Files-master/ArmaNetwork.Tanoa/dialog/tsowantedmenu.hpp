/*
    ArmA.Network
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
class TSOWanted
{
    idd = 56874;
	movingEnable = 0;
	enableSimulation = 1;

    class controlsBackground
    {
        class RscText_1000: Life_RscText
        {
            idc = 1000;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.528 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1004: Life_RscText
        {
            idc = 1004;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.22 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_1002: Life_RscText
        {
            idc = 1002;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.297 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        //Add to list
        class RscText_3000: Life_RscText
        {
            idc = 3000;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.473 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        //add existing
        class RscText_4000: Life_RscText
        {
            idc = 4000;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.407 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class RscText_5000: Life_RscText
        {
            idc = 5000;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.22 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
    };
    class controls
    {
        class RscText_1001: Life_RscText
        {
            idc = 1001;
            text = "Fetching Wanted List"; //--- ToDo: Localize;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_1003: Life_RscText
        {
            idc = 1003;
            text = "Additional Information"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_1005: Life_RscText
        {
            idc = 1005;
            text = "Last Known Location"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscListbox_1500: Life_RscListbox
        {
            idc = 1500;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.484 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onLBSelChanged = "_this call life_fnc_wantedSelect";
        };
        class RscListbox_1501: Life_RscListbox
        {
            idc = 1501;
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.066 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class additionalinfo: RscStructuredText
        {
            idc = 1100;
            x = 0.443282 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.099 * safezoneH;
            size = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class lastknownlocation: Life_RscMapControl
        {
            idc = 1101;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.198 * safezoneH;
            maxSatelliteAlpha = 0.75;
            alphaFadeStartScale = 1.15;
            alphaFadeEndScale = 1.29;
        };
        class RscButtonMenu_2400: Life_RscButtonMenu
        {
            idc = 2400;
            text = "Pardon"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "['pardon',(lbData [1500,lbCurSel 1500])] call life_fnc_wantedSelectFeatures";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_2401: Life_RscButtonMenu
        {
            idc = 2401;
            text = "Update Last Known Location"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "['coords',(lbData [1500,lbCurSel 1500])] call life_fnc_wantedSelectFeatures";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_2403: Life_RscButtonMenu
        {
            idc = 2403;
            text = "Close"; //--- ToDo: Localize;
            x = 0.62375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "closeDialog 0";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_2404: Life_RscButtonMenu
        {
            idc = 2404;
            text = "Set Bounty"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[(lbData [1500,lbCurSel 1500])] call life_fnc_wantedMenuBounty";
        };
        class RscButtonMenu_2402: Life_RscButtonMenu
        {
            idc = 2402;
            text = "Set Additional Charges"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.262969 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_wantedAC";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_2405: Life_RscButtonMenu
        {
            idc = 2405;
            text = "Add Civilian to Wanted List"; //--- ToDo: Localize;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_wantedNewFelon";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        //ADDWANTED
        class RscText_3001: Life_RscText
        {
            idc = 3001;
            text = "Add to TSO Active Wanted List"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_3002: Life_RscText
        {
            idc = 3002;
            text = "Suspect Name:"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscCombo_3100: Life_RscCombo
        {
            idc = 3100;
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_3003: Life_RscText
        {
            idc = 3003;
            text = "Additional Information:"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscEdit_3400: Life_RscEdit
        {
            idc = 3400;
            text = "";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscListbox_3500: Life_RscListbox
        {
            idc = 3500;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.286 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscListbox_3501: Life_RscListbox
        {
            idc = 3501;
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.286 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_1004: Life_RscText
        {
            idc = 3004;
            text = "Available Charges:"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_3400: Life_RscButtonMenu
        {
            idc = 3404;
            text = "Add"; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[3500,3501] call life_fnc_wantedAddToList";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_3401: Life_RscButtonMenu
        {
            idc = 3401;
            text = "Remove"; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[3501] call life_fnc_wantedRemoveFromList";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_3005: Life_RscText
        {
            idc = 3005;
            text = "Suspect to be charged with:"; //--- ToDo: Localize;
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_3402: Life_RscButtonMenu
        {
            idc = 3402;
            text = "Confirm and Add"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedNewFelonSubmit";
        };
        class RscButtonMenu_3403: Life_RscButtonMenu
        {
            idc = 3403;
            text = "Back"; //--- ToDo: Localize;
            x = 0.623749 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedMenuOpen";
        };
        //Add to specific
        class RscText_4001: Life_RscText
        {
            idc = 4001;
            text = "Set Additional Charges"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.37125 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscListbox_4500: Life_RscListbox
        {
            idc = 4500;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.286 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_4002: Life_RscText
        {
            idc = 4002;
            text = "Available Charges:"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscListbox_4501: Life_RscListbox
        {
            idc = 4501;
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.286 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_4003: Life_RscText
        {
            idc = 4003;
            text = "Charged with:"; //--- ToDo: Localize;
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "0.85 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_4004: Life_RscText
        {
            idc = 4004;
            text = "Suspect's Name:"; //--- ToDo: Localize;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.350625 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_4400: Life_RscButtonMenu
        {
            idc = 4400;
            text = "Add"; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[4500,4501] call life_fnc_wantedAddToList";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_4401: Life_RscButtonMenu
        {
            idc = 4401;
            text = "Remove"; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[4501] call life_fnc_wantedRemoveFromList";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_4402: Life_RscButtonMenu
        {
            idc = 4402;
            text = "Confirm and Add"; //--- ToDo: Localize;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedACSubmit";
        };
        class RscButtonMenu_4403: Life_RscButtonMenu
        {
            idc = 4403;
            text = "Back"; //--- ToDo: Localize;
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onButtonClick = "[] call life_fnc_wantedMenuOpen";
        };
        //
        class RscText_5001: Life_RscText
        {
            idc = 5001;
            text = "Set Felon Bounty"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscStructuredText_5100: Life_RscStructuredText
        {
            idc = 5100;
            text = "<t align='center'>Listing a bounty on a felon will notify all bounty hunters<br/><br/>If a felon has a bounty, bounty hunters will be able to arrest felons and collect the bounty. Be aware, this is logged. Anyone found abusing this system will be permanently banned.</t>"; //--- ToDo: Localize;
            x = 0.376247 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.132 * safezoneH;
            size = "0.9 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscText_5002: Life_RscText
        {
            idc = 5002;
            text = "Bounty:"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscEdit_5400: Life_RscEdit
        {
            idc = 5400;
            text = "0";
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class RscButtonMenu_5400: Life_RscButtonMenu
        {
            idc = 5500;
            text = "List Bounty"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_wantedBountySet";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class RscButtonMenu_5401: Life_RscButtonMenu
        {
            idc = 5501;
            text = "Back"; //--- ToDo: Localize;
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            onButtonClick = "[] call life_fnc_wantedMenuOpen";
            sizeEx = "1 * (((( safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
};
