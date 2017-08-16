class SettingsMenu {
    idd = 2900;
    name = "SettingsMenu";
    movingEnable = 1;
    enableSimulation = 1;

    class controlsBackground {
        class RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class RscMainBackground: Life_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.88 - (22 / 250);
        };

        class PlayerTagsHeader: Life_RscText {
            idc = -1;
            text = "$STR_SM_PlayerTags";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.32;
            y = 0.74;
            w = 0.35;
            h = (1 / 25);
        };

        class SideChatHeader : PlayerTagsHeader {
            idc = -1;
            text = "$STR_SM_SC";
			x = 0.32;
            y = 0.79;
        };

        class RevealNearestHeader : PlayerTagsHeader {
            idc = -1;
            text = "$STR_SM_RNObj";
            y = 0.84;
			x = 0.32;
        };

        class BroacastHeader : PlayerTagsHeader {
            idc = -1;
            text = "$STR_SM_BCSW";
            y = 0.89;
			x = 0.32;
        };

        class Title: Life_RscTitle {
            idc = -1;
            colorBackground[] = {0,0,0,0};
            text = "$STR_SM_Title";
            x = 0.3;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };
    };

    class controls {
		
		class head: Life_RscText {
            idc = -1;
            text = " > View Distance";
            x = 0.32;
            y = 0.269;
            w = 0.275;
            h = 0.04;
        };
		
        class VDonFoot: Life_RscText {
            idc = -1;
            text = "$STR_SM_onFoot";
            x = 0.32;
            y = 0.333;
            w = 0.275;
            h = 0.04;
        };
		
		class objVDonFoot: Life_RscText {
            idc = -1;
            text = "$STR_SM_onFoot";
            x = 0.32;
            y = 0.555;
            w = 0.275;
            h = 0.04;
        };

        class VDinCar: Life_RscText {
            idc = -1;
            text = "$STR_SM_inCar";
            x = 0.32;
            y = 0.380;
            w = 0.275;
            h = 0.04;
        };
		
		class objhead: Life_RscText {
            idc = -1;
            text = " > Object View Distance";
            x = 0.32;
            y = 0.494;
            w = 0.275;
            h = 0.04;
        };
		
		class objVDinCar: Life_RscText {
            idc = -1;
            text = "$STR_SM_inCar";
            x = 0.32;
            y = 0.605;
            w = 0.275;
            h = 0.04;
        };
		

        class VDinAir: Life_RscText {
            idc = -1;
            text = "$STR_SM_inAir";
            x = 0.32;
            y = 0.430;
            w = 0.275;
            h = 0.04;
        };
		
		class objDinAir: Life_RscText {
            idc = -1;
            text = "$STR_SM_inAir";
            x = 0.32;
            y = 0.655;
            w = 0.275;
            h = 0.04;
        };

        class VD_onfoot_slider: life_RscXSliderH {
            idc = 2901;
            text = "";
            onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip1";
            x = 0.42;
            y = 0.375 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
		
		class objVD_onfoot_slider: life_RscXSliderH {
            idc = 2951;
            text = "";
            onSliderPosChanged = "[5,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip1";
            x = 0.42;
            y = 0.597 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };

        class VD_onfoot_value: Life_RscEdit {
            idc = 2902;
            text = "";
            onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
            x = .70;
            y = .333;
            w = .08;
            h = .04;
        };
		
		class objVD_onfoot_value: Life_RscEdit {
            idc = 2952;
            text = "";
            onChar = "[_this select 0, _this select 1,'oground',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'oground',true] call life_fnc_s_onChar;";
            x = .70;
            y = .555;
            w = .08;
            h = .04;
        };

        class VD_car_slider: life_RscXSliderH {
            idc = 2911;
            text = "";
            onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip2";
            x = 0.42;
            y = 0.425 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
		
		class objVD_car_slider: life_RscXSliderH {
            idc = 2961;
            text = "";
            onSliderPosChanged = "[6,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip2";
            x = 0.42;
            y = 0.647 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };

        class VD_car_value: Life_RscEdit {
            idc = 2912;
            text = "";
            onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
            x = .70;
            y = .385;
            w = .08;
            h = .04;
        };
		
		class objVD_car_value: Life_RscEdit {
            idc = 2962;
            text = "";
            onChar = "[_this select 0, _this select 1,'ovehicle',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'ovehicle',true] call life_fnc_s_onChar;";
            x = .70;
            y = .605;
            w = .08;
            h = .04;
        };

        class VD_air_slider: life_RscXSliderH {
            idc = 2921;
            text = "";
            onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip3";
            x = 0.42;
            y = 0.475 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
		
		class objVD_air_slider: life_RscXSliderH {
            idc = 2971;
            text = "";
            onSliderPosChanged = "[7,_this select 1] call life_fnc_s_onSliderChange;";
            tooltip = "$STR_SM_ToolTip3";
            x = 0.42;
            y = 0.697 - (1 / 25);
            w = "9 *(((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };

        class VD_air_value: Life_RscEdit {
            idc = 2922;
            text = "";
            onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
            x = 0.70;
            y = 0.435;
            w = .08;
            h = .04;
        };
		
		class objVD_air_value: Life_RscEdit {
            idc = 2972;
            text = "";
            onChar = "[_this select 0, _this select 1,'oair',false] call life_fnc_s_onChar;";
            onKeyUp = "[_this select 0, _this select 1,'oair',true] call life_fnc_s_onChar;";
            x = 0.70;
            y = 0.655;
            w = .08;
            h = .04;
        };

        class PlayerTagsONOFF: Life_Checkbox {
            tooltip = "$STR_GUI_PlayTags";
            idc = 2970;
            sizeEx = 0.04;
            onCheckedChanged = "['tags',_this select 1] call life_fnc_s_onCheckedChange;";
			x = .70;
            y = 0.74;

        };

        class SideChatONOFF: PlayerTagsONOFF {
            idc = 2971;
            tooltip = "$STR_GUI_SideSwitch";
            onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
			x = .70;
            y = 0.79;
        };

        class RevealONOFF : PlayerTagsONOFF {
            idc = 2972;
            tooltip = "$STR_GUI_PlayerReveal";
            onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
			x = .70;
            y = 0.84;
        };

        class BroadcastONOFF : PlayerTagsONOFF {
            idc = 2973;
            tooltip = "$STR_GUI_BroadcastSwitch";
            onCheckedChanged = "['broadcast',_this select 1] call life_fnc_s_onCheckedChange;";
			x = .70;
            y = 0.89;
        };

        class ButtonClose: Life_RscButtonMenu {
            idc = -1;
            //shortcuts[] = {0x00050000 + 2};
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.48;
            y = 1 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};
