class Life_banking_deposit {
    idd = 45030;
    name= "life_banking_deposit";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {

        class backgroundScreen: Life_RscPicture {
            idc = 45091;
            text = "images\Textures\banking\atm.paa";
            x = 0;
      			y = -0.12;
      			w = 1;
      			h = 1.28;
        };

        class cardPicture: Life_RscPicture {
            idc = 45089;
            text = "images\Textures\banking\card.paa";
            x = 0;
      			y = -0.12;
      			w = 1;
      			h = 1.28;
        };
    };

    class controls {

        class moneyEdit: Life_RscEdit {
            idc = 45041;
            text = "1";
            sizeEx = 0.030;
            x = 0.4;
            y = 0.2;
            w = 0.2;
            h = 0.04;
        };

        class DepositButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_ATM_Deposit";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_bankDeposit";
            x = 0.425;
            y = 0.275;
            w = (6 / 40);
            h = (1 / 25);
        };

        class FourthText: Life_RscStructuredText {
            idc = 45064;
            text = "Back";
            x = 0.285;
            y = 0.3785;
            w = 0.25;
            h = 0.06775;
        };

        class FourthButton: Life_BankButton {
            idc = 45074;
            onButtonClick = "closeDialog 0;";
            x = 0.175;
            y = 0.375;
            w = 0.05925;
            h = 0.06775;
        };

        class ClearButton: Life_BankButton {
            idc = 45086;
            tooltip = "$STR_Banking_Correct";
            x = 0.39075;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class EnterButton: Life_BankButton {
            idc = 45085;
            tooltip = "$STR_Banking_Enter";
            x = 0.3815;
            y = 0.871;
            w = 0.05925;
            h = 0.06775;
        };

        class OneButton: Life_BankButton {
            idc = 45093;
            tooltip = "1";
            x = 0.165;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class TwoButton: Life_BankButton {
            idc = 45094;
            tooltip = "2";
            x = 0.2425;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class ThreeButton: Life_BankButton {
            idc = 45095;
            tooltip = "3";
            x = 0.32;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class FourButton: Life_BankButton {
            idc = 45096;
            tooltip = "4";
            x = 0.15825;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class FiveButton: Life_BankButton {
            idc = 45097;
            tooltip = "5";
            x = 0.23575;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class SixButton: Life_BankButton {
            idc = 45098;
            tooltip = "6";
            x = 0.31325;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class SevenButton: Life_BankButton {
            idc = 45099;
            tooltip = "7";
            x = 0.15175;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class EightButton: Life_BankButton {
            idc = 45100;
            tooltip = "8";
            x = 0.22975;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class NineButton: Life_BankButton {
            idc = 45101;
            tooltip = "9";
            x = 0.30725;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class ZeroButton: Life_BankButton {
            idc = 45102;
            tooltip = 0;
            x = 0.2265;
            y = 0.871;
            w = 0.05925;
            h = 0.06775;
        };

        class CancelButton: Life_BankButton {
            idc = -1;
            tooltip = "$STR_Global_Cancel";
            onButtonClick = "closeDialog 0;";
            x = 0.3975;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };
    };
};
