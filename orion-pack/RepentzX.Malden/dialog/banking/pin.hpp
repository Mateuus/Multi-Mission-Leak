class Life_banking_pin {
    idd = 45080;
    name= "life_banking_pin";
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

        class Title: Life_RscStructuredText {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            style = 16;
            text = "$STR_Banking_InsertPin_Title";
            x = 0.325;
            y = 0.1;
            w = 0.4;
            h = (1 / 25) * 2;
        };

        class moneyEdit: Life_RscEdit {
            colorBackground[] = {0, 0, 0, 0};
            idc = 45088;
            text = "";
            sizeEx = 0.030;
            x = 0.415;
            y = 0.2;
            w = 0.2;
            h = 0.05;
        };

        class moneyEditInvisible: Life_RscStructuredText {
            colorBackground[] = {0, 0, 0, 0};
            style = 0;
            idc = 45087;
            text = "";
            sizeEx = 0.030;
            x = 0.415;
            y = 0.2;
            w = 0;
            h = 0;
        };

        class ClearButton: Life_BankButton {
            idc = 45086;
            tooltip = "$STR_Banking_Correct";
            onButtonClick = "[-2] spawn life_fnc_PINMenu;";
            x = 0.39075;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class EnterButton: Life_BankButton {
            idc = 45085;
            tooltip = "$STR_Banking_Enter";
            onButtonClick = "[-3] spawn life_fnc_PINMenu;";
            x = 0.3815;
            y = 0.871;
            w = 0.05925;
            h = 0.06775;
        };

        class OneButton: Life_BankButton {
            idc = 45093;
            tooltip = "1";
            onButtonClick = "[1] spawn life_fnc_PINMenu;";
            x = 0.165;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class TwoButton: Life_BankButton {
            idc = 45094;
            tooltip = "2";
            onButtonClick = "[2] spawn life_fnc_PINMenu;";
            x = 0.2425;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class ThreeButton: Life_BankButton {
            idc = 45095;
            tooltip = "3";
            onButtonClick = "[3] spawn life_fnc_PINMenu;";
            x = 0.32;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };

        class FourButton: Life_BankButton {
            idc = 45096;
            tooltip = "4";
            onButtonClick = "[4] spawn life_fnc_PINMenu;";
            x = 0.15825;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class FiveButton: Life_BankButton {
            idc = 45097;
            tooltip = "5";
            onButtonClick = "[5] spawn life_fnc_PINMenu;";
            x = 0.23575;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class SixButton: Life_BankButton {
            idc = 45098;
            tooltip = "6";
            onButtonClick = "[6] spawn life_fnc_PINMenu;";
            x = 0.31325;
            y = 0.68975;
            w = 0.05925;
            h = 0.06775;
        };

        class SevenButton: Life_BankButton {
            idc = 45099;
            tooltip = "7";
            onButtonClick = "[7] spawn life_fnc_PINMenu;";
            x = 0.15175;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class EightButton: Life_BankButton {
            idc = 45100;
            tooltip = "8";
            onButtonClick = "[8] spawn life_fnc_PINMenu;";
            x = 0.22975;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class NineButton: Life_BankButton {
            idc = 45101;
            tooltip = "9";
            onButtonClick = "[9] spawn life_fnc_PINMenu;";
            x = 0.30725;
            y = 0.778;
            w = 0.05925;
            h = 0.06775;
        };

        class ZeroButton: Life_BankButton {
            idc = 45102;
            tooltip = 0;
            onButtonClick = "[0] spawn life_fnc_PINMenu;";
            x = 0.2265;
            y = 0.871;
            w = 0.05925;
            h = 0.06775;
        };

        class CancelButton: Life_BankButton {
            idc = -1;
            tooltip = "$STR_Global_Cancel";
            onButtonClick = "[1] spawn life_fnc_insertCard;";
            x = 0.3975;
            y = 0.595;
            w = 0.05925;
            h = 0.06775;
        };
    };
};
