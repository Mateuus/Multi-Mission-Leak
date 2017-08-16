class life_gps_selection {
    idd = 48500;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class life_RscTitleBackground: Life_RscText    {
            colorBackground[] = {0.294,0.286,0.286,0.8};
            idc = -1;
            x = 0.0101577 * safezoneW + safezoneX;
			y = 0.0291999 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.9438 * safezoneH;
			
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0,0,0,0};
            idc = -1;
            text = "$STR_GPS_Title";
            x = 0.0132501 * safezoneW + safezoneX;
			y = 0.0402 * safezoneH + safezoneY;
			w = 0.164999 * safezoneW;
			h = 0.0242 * safezoneH;
		};
		/*
        class GPSPointTitle: Title {
            idc = 48501;
            style = 1;
            text = "";
        };
		*/
        class MapView : Life_RscMapControl {
            idc = 48502;
            x = 0.183407 * safezoneW + safezoneX;
			y = 0.0292 * safezoneH + safezoneY;
			w = 0.8085 * safezoneW;
			h = 0.9438 * safezoneH;
            maxSatelliteAlpha = 0.75;//0.75;
            alphaFadeStartScale = 1.15;//0.15;
            alphaFadeEndScale = 1.29;//0.29;
        };
    };

    class controls {
        class GPSPointList: Life_RscListNBox {
            idc = 48510;
            text = "";
            sizeEx = 0.041;
            coloumns[] = {0,0,0.9};
            drawSideArrows = 0;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.050;
			x = 0.0153125 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.847 * safezoneH;
            onLBSelChanged = "_this call life_fnc_gpsPointSelected;";
        };
		
		class SetGPSKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Set_GPS";
            onButtonClick = "[] spawn life_fnc_setgpsPoint";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            x = 0.0153125 * safezoneW + safezoneX;
			y = 0.9246 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.033 * safezoneH;
		};
    };
};