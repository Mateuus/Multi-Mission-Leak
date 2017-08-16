/*
    Filename:
        core\locker\locker.hpp
        
    Author:
        Vincent H. || AGPHeaddikilla || Yoghurt/Yogurette
    
    Description:
        The dialog of the Locker.
        
    Parameters:
        -
        
    License:
        MIT License
        Copyright (c) 2016 Vincent Heins (http://www.allgameplay.de/)

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.
*/

class lockerMenu {
	idd = 4000; // uses namespace 4000 - 4004
	name = "lockerMenu";
	movingEnable = 0;
	enableSimulation = 1;
    
    class controlsBackground {
        class Title : Life_RscTitle {
            idc = -1;
            text = "Schließfach";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.1125;
            y = 0.1336;
            w = 0.775;
            h = 0.04;
        };
        
        class Background : Life_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.1125;
            y = 0.18;
            w = 0.775;
            h = 0.64;
        };
    };
    
    class controls {
        class ButtonClose : Life_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            x = 0.1125;
            y = 0.8264;
            w = 0.2125;
            h = 0.04;
            onButtonClick = "closeDialog 4000;";
        };
        
        class ButtonCreate : Life_RscButtonMenu {
            idc = -1;
            text = "Neues Schließfach";
            onButtonClick = "closeDialog 4000; createDialog ""lockerCreate"";";
            x = 0.600126;
            y = 0.826532;
            w = 0.2875;
            h = 0.04;
        };
        
        class TitlePlayerInventory : Life_RscTitle {
            idc = -1;
            text = "Spieler-Inventar";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.525;
            y = 0.26;
            w = 0.35;
            h = 0.04;
        };
        
        class TitleLockerInventory : Life_RscTitle {
            idc = -1;
            text = "Schließfach-Inventar";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.125;
            y = 0.26;
            w = 0.35;
            h = 0.04;
        };
        
        class ListPlayerInventory : Life_RscListbox {
            idc = 4001;
            sizeEx = 0.03;
            text = "";
            x = 0.525;
            y = 0.3;
            w = 0.35;
            h = 0.42;
        };
        
        class ListLockerInventory : Life_RscListbox {
            idc = 4002;
            sizeEx = 0.03;
            x = 0.125;
            y = 0.3;
            w = 0.35;
            h = 0.42;
        };
        
        class ButtonPlayerInventory : Life_RscButtonMenu {
            idc = 4003;
            text = "Ablegen";
            onButtonClick = "[] call locker_fnc_lockerInsertItem;";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.6125;
            y = 0.74;
            w = 0.175;
            h = 0.04;
        };
        
        class ButtonLockerInventory : Life_RscButtonMenu {
            idc = 4004;
            text = "Nehmen";
            onButtonClick = "[] call locker_fnc_lockerTakeItem;";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.2125;
            y = 0.74;
            w = 0.175;
            h = 0.04;
        };
        
        class TitleLockers : Life_RscTitle {
            idc = -1;
            text = "Schließfach:";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.125;
            y = 0.2;
            w = 0.225;
            h = 0.04;
        };
        
        class ComboLockers : Life_RscCombo {
            idc = 4008;
            text = "";
            onLBSelChanged = "[] call locker_fnc_lockerMenuUpdate;";
            x = 0.375;
            y = 0.2;
            w = 0.5;
            h = 0.04;
        };
    };
};

class lockerCreate {
    idd = 4005; // uses namespace 4005 - 4007
    movingEnable = 0;
    enableSimulation = 1;
    name = "lockerCreate";
    
    class controlsBackground {
        class Title : Life_RscTitle {
            idc = -1;
            text = "Erstellen";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            x = 0.1125;
            y = 0.1336;
            w = 0.775;
            h = 0.04;
        };
        
        class Background : Life_RscText {
            idc = -1;
            text = "";
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.1125;
            y = 0.18;
            w = 0.775;
            h = 0.64;
        };
    };
    
    class controls {
        class ButtonClose : Life_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            x = 0.1125;
            y = 0.8264;
            w = 0.2125;
            h = 0.04;
            onButtonClick = "closeDialog 4000;";
        };
        
        class TextInfo : Life_RscText {
            idc = 4006;
            text = "Um ein Schließfach zu erstellen benötigst du $10000.";
            x = 0.25;
            y = 0.32;
            w = 0.5;
            h = 0.1;
        };
        
        class ButtonCreate : Life_RscButtonMenu {
            idc = 4007;
            text = "Erstellen";
            style = 2;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            onButtonClick = "[] spawn locker_fnc_lockerCreate;";
            x = 0.3875;
            y = 0.46;
            w = 0.225;
            h = 0.04;
        };
    };
};
