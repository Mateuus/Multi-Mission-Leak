class Life_pricelist_menu {
    idd = 3300;
    name="life_pricelist";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "ctrlShow [3330,false];";

    class controlsBackground {
        class Life_RscTitleBackground : Life_RscText {
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.1;
            w = 1.1;
            h = (1 / 25);
        };

        class MainBackground : Life_RscText {
            colorBackground[] = {0,0,0,0.7};
                idc = -1;
                x = 0.1;
                y = 0.1 + (11 / 250);
                w = 1.1;
                h = 0.9 - (22 / 250);
        };

        class Title : Life_RscTitle {
            idc = 3301;
            text = "Price List";
            x = 0.1;
            y = 0.09;
            w = 0.8;
            h = (1 / 25);
        };

        class ItemTitleBox : Life_RscText {
            idc = -1;
            text = "All Items";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.11; y = 0.16;
            w = 0.3;
            h = (1 / 25);
        };

        class InformationInfoHeader : Life_RscText {
            idc = 3330;
            text = "Information";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.42; y = 0.16;
            w = 0.46;
            h = (1 / 25);
        };
		
		
		class LicenseInfoHeader : Life_RscText {
            idc = 3331;
            text = "All Licenses";
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.3843])", "(profileNamespace getVariable ['GUI_BCG_RGB_G',0.7019])", "(profileNamespace getVariable ['GUI_BCG_RGB_B',0.8862])", "(profileNamespace getVariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.89; y = 0.16;
            w = 0.3;
            h = (1 / 25);
        };
		

        class CloseBtn : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
			colorBackground[] = {1,0,0,0.75};
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 1 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
		
    };

    class controls {
        class ItemList : Life_RscListBox {
            idc = 3302;
            text = "";
            sizeEx = 0.035;
            colorBackground[] = {0.1,0.1,0.1,0.9};
            onLBSelChanged = "_this call life_fnc_priceListLBChange";
            x = 0.11; y = 0.22;
            w = 0.303; h = 0.70;
        };


        class InfomationList : Life_RscStructuredText {
            idc = 3303;
            text = "";
            sizeEx = 0.035;
            x = 0.41; y = 0.22;
            w = 0.5; h = 0.70;
        };
		
		
		class LicenseInfomationList : Life_RscListBox {
            idc = 3304;
            text = "";
            sizeEx = 0.035;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_priceListLBChange2";
            x = 0.89; y = 0.22;
            w = 0.303; h = 0.70;
        };
		
    };
};
