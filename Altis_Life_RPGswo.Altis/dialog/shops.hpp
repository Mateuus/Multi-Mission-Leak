class DWEV_weapon_shop {
    idd = 38400;
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "[""main"",(side player)] spawn DWEV_fnc_tabletbutton;";
	
    class controlsBackground {
		
		class wolftablet: DWEV_RscPicture
		{
			idc = 505000;
			text = "";
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};	

		class Shopname_Title : DWEV_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 38401;
			text = "";
			sizeEx = 0.1;
			style = 0x02;
			x = 0;
			y = 0.07;
			w = 1;
			h = 0.1;		
		};
		
	/*	
        class RscTitleBackground: DWEV_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.32;
            h = (1 / 25);
        };

        class MainBackground: DWEV_RscText {
            colorBackground[] = {0,0,0,0.7};
            idc = -1;
            x = 0.35;
            y = 0.2 + (11 / 250);
            w = 0.32;
            h = 0.6 - (22 / 250);
        };

        class Title: DWEV_RscTitle {
            colorBackground[] = {0,0,0,0};
            idc = 38401;
            text = "";
            x = 0.35;
            y = 0.2;
            w = 0.32;
            h = (1 / 25);
        };
*/
        class itemInfo: DWEV_RscStructuredText {
            idc = 38404;
            text = "";
            sizeEx = 0.035;
            x = 0.3;
            y = 0.68;
            w = 0.3;
            h = 0.2;
        };

        class FilterList: DWEV_RscCombo {
            idc = 38402;
            onLBSelChanged = "_this call DWEV_fnc_weaponShopFilter";
            x = 0.3;
            y = 0.64;
            w = 0.4;
            h = 0.035;
        };
    };

    class controls {
        class itemList: DWEV_RscListBox {
            idc = 38403;
            onLBSelChanged = "_this call DWEV_fnc_weaponShopSelection";
            sizeEx = 0.035;
            x = 0.3;
            y = 0.25;
            w = 0.4;
            h = 0.38;
        };

        class ButtonBuySell: DWEV_RscButtonMenu {
            idc = 38405;
            text = "Verkaufen";
            onButtonClick = "[] spawn DWEV_fnc_weaponShopBuySell; true";
            x = 0.35;
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

		class ctrl_icon_grafik_shutdown: DWEV_RscPicture
		{
			idc = 507003;
			style = 2096;
			text = "textures\Wolflogo\Tablet\icon_shutdown.paa";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};
		
		class ctrl_icon_button_shutdown: DWEV_RscButtonInvisible
		{
			idc = 507004;
			text = "";
			tooltip = "Tablet ausschalten";
			colorBackground[] = {0, 0, 0, 0};
			onButtonClick = "closeDialog 0;";
			x = 0.05;
			y = 0.012;
			w = 0.04;
			h = 0.04;
		};

        class ButtonMags: DWEV_RscButtonMenu {
            idc = 38406;
            text = "Magazine";
            onButtonClick = "_this call DWEV_fnc_weaponShopMags; _this call DWEV_fnc_weaponShopFilter";
            x = 0.35;
            y = 0.8 + (1 / 250 / (safezoneW / safezoneH));
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ButtonAccs: DWEV_RscButtonMenu {
            idc = 38407;
            text = "Zubehör";
            onButtonClick = "_this call DWEV_fnc_weaponShopAccs; _this call DWEV_fnc_weaponShopFilter";
            x = 0.35 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 + (1 / 250 / (safezoneW / safezoneH));
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};