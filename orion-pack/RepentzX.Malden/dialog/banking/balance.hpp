class Life_banking_balance {
    idd = 45050;
    name= "life_banking_balance";
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

        class CashTitle: Life_RscStructuredText {
            idc = 45051;
            text = "";
            x = 0.375;
            y = 0.1;
            w = 0.3;
            h = .14;
        };

        class FirstText: Life_RscStructuredText {
            idc = 45061;
            x = 0.285;
            y = 0.0785;
            w = 0.25;
            h = 0.06775;
        };

        class SecondText: Life_RscStructuredText {
            idc = 45062;
            x = 0.285;
            y = 0.1785;
            w = 0.25;
            h = 0.06775;
        };

        class ThirdText: Life_RscStructuredText {
            idc = 45063;
            x = 0.285;
            y = 0.2785;
            w = 0.25;
            h = 0.06775;
        };

        class FourthText: Life_RscStructuredText {
            idc = 45064;
            text = "$STR_Banking_Back";
            x = 0.285;
            y = 0.3785;
            w = 0.25;
            h = 0.06775;
        };

        class FifthText: Life_RscStructuredText {
            idc = 45065;
            x = 0.55;
            y = 0.0785;
            w = 0.25;
            h = 0.06775;
        };

        class SixthText: Life_RscStructuredText {
            idc = 45066;
            x = 0.55;
            y = 0.1785;
            w = 0.25;
            h = 0.06775;
        };

        class SeventhText: Life_RscStructuredText {
            idc = 45067;
            text = "";
            x = 0.55;
            y = 0.2785;
            w = 0.25;
            h = 0.06775;
        };

        class EighthText: Life_RscStructuredText {
            idc = 45068;
            text = "";
            x = 0.55;
            y = 0.3785;
            w = 0.25;
            h = 0.06775;
        };

        class FirstButton: Life_BankButton {
            idc = 45071;
            x = 0.175;
            y = 0.075;
            w = 0.05925;
            h = 0.06775;
        };

        class SecondButton: Life_BankButton {
            idc = 45072;
            x = 0.175;
            y = 0.175;
            w = 0.05925;
            h = 0.06775;
        };

        class ThirdButton: Life_BankButton {
            idc = 45073;
            x = 0.175;
            y = 0.275;
            w = 0.05925;
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

        class FifthButton: Life_BankButton {
            idc = 45075;
            x = 0.795;
            y = 0.075;
            w = 0.05925;
            h = 0.06775;
        };

        class SixthButton: Life_BankButton {
            idc = 45076;
            x = 0.795;
            y = 0.175;
            w = 0.05925;
            h = 0.06775;
        };

        class SeventhButton: Life_BankButton {
            idc = 45077;
            x = 0.795;
            y = 0.275;
            w = 0.05925;
            h = 0.06775;
        };

        class EighthButton: Life_BankButton {
            idc = 45078;
            x = 0.795;
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
