class Life_banking_management {
    idd = 45090;
    name= "life_banking_menu";
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
    };

    class controls {

        class Title: Life_RscStructuredText {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            style = 16;
            text = "$STR_Banking_InsertCard_Title";
            x = 0.325;
            y = 0.1;
            w = 0.4;
            h = (1 / 25) * 2;
        };

        class CardSlot: Life_CardSlotButton {
            idc = 45092;
            tooltip = "$STR_Banking_InsertCard";
            onButtonClick = "[] spawn life_fnc_insertCard;";
            x = 0.605;
            y = 0.79;
            w = 0.2575;
            h = 0.07;
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
