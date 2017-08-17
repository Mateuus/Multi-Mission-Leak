class Life_deposit_pay {
    idd = 6600;
    name = "life_deposit_pay";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.47;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.47;
            h = 0.3 - (22 / 250);
        };
    };

    class controls {
        class InfoMsg: Life_RscStructuredText {
            idc = 6601;
            sizeEx = 0.020;
            text = "";
            x = 0.287;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.12;
        };

        class payDeposit: Life_RscButtonMenu {
            idc = -1;
            text = "Pay Deposit";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_truckDepositPay;closeDialog 0;";
            x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class refuseDeposit: Life_RscButtonMenu {
            idc = -1;
            text = "Refuse Deposit";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "life_deposit_action = true; life_truck_deposit_paid = false;closeDialog 0;";
            x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};
