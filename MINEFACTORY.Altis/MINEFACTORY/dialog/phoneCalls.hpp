#define PHONECALLDIALOG 9400
#define PHONECALLDIALOGSOUND 9500

class phoneDialog {

	idd = PHONECALLDIALOG;
	movingEnable = 1;
	enableSimulation = 1;
    onLoad = "life_phoneCallDialogActive = true;";
    onUnload = "life_phoneCallDialogActive = false;";
    onChildDestroyed = "life_phoneCallDialogActive = false;";
	
	class controlsBackground {
        class FrameBackgroundPlayers : life_RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.462 * safezoneH;
        };
        
        class FrameBackgroundInfo : life_RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.438641 * safezoneW + safezoneX;
            y = 0.33962 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.154 * safezoneH;
        };
        
        class TitlePlayersTitle : life_RscTitle {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
            text = "Derzeitige Spieler";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleInfoTitle : life_RscTitle {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
            text = "Telefonzentrale";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.216563 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
    
    class controls {
        class ButtonCall : life_RscButtonMenu {
            idc = 9401;
            text = "Anrufen";
            onButtonClick = "[5, [(lbData [9406, (lbCurSel 9406)])]] spawn phoneCalls_fnc_partial;";
            x = 0.438641 * safezoneW + safezoneX;
            y = 0.49714 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonHangup : life_RscButtonMenu {
            idc = 9402;
            text = "Auflegen";
            onButtonClick = "[6] spawn phoneCalls_fnc_partial;";
            x = 0.548984 * safezoneW + safezoneX;
            y = 0.49714 * safezoneH + safezoneY;
            w = 0.10625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleConnectionTime : life_RscTitle {
            idc = -1;
            text = "Dauer:";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TextConnectionTime : life_RscText {
            idc = 9403;
            text = "-";
            x = 0.525781 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitlePartner : life_RscTitle {
            idc = -1;
            text = "Partner:";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TextPartner : life_RscText {
            idc = 9404;
            text = "-";
            x = 0.525781 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TitleAdditional : life_RscTitle {
            idc = -1;
            text = "Zusätzliches:";
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class TextAdditional : life_RscText {
            idc = 9405;
            text = "-";
            x = 0.525781 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.066 * safezoneH;
        };
        
        class ButtonRingtones : life_RscButtonMenu {
            idc = -1;
            text = "Klingeltöne";
            onButtonClick = "life_phoneCallDialogActive = false; [12] spawn phoneCalls_fnc_partial;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.72462 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonMute : life_RscButtonMenu {
            idc = 9409;
            text = "";
            onButtonClick = "[21, [], false, false] spawn phoneCalls_fnc_partial;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.750629 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonClose : life_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            onButtonClick = "closeDialog 0; life_phoneCallDialogActive = false; [] spawn life_fnc_p_openMenu;";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.776638 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ListPlayers : life_RscListbox {
            idc = 9406;
            text = "";
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.418 * safezoneH;
            sizeEx = 0.03;
        };
        
        class ButtonTakeCall : life_RscButtonMenu {
            idc = 9407;
            text = "Annehmen";
            onButtonClick = "[20, [], false, false] call phoneCalls_fnc_partial;";
            x = "0.438541 * safezoneW + safezoneX";//  * safezoneH + safezoneY 
            y = "0.523149 * safezoneH + safezoneY";
            w = "0.108281 * safezoneW";
            h = "0.022 * safezoneH";
        };
        
        class ButtonDeclineCall : life_RscButtonMenu {
            idc = 9408;
            text = "Ablehnen";
            onButtonClick = "[18, [], false] call phoneCalls_fnc_partial;";
            x = "0.548984 * safezoneW + safezoneX";
            y = "0.523149 * safezoneH + safezoneY";
            w = "0.108281 * safezoneW";
            h = "0.022 * safezoneH";
        };
    };
};

class phoneDialogSounds {
    idd = PHONECALLDIALOGSOUND;
    movingEnable = 1;
    enableSimulation = 1;
    
    class controlsBackground {
        class FrameBackground : life_RscText {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.275 * safezoneH;
        };
        
        class TitleTitle : life_RscTitle {
            idc = -1;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            text = "Klingeltöne";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.32422 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
    
    class controls {
        class ListSounds : life_RscListbox {
            idc = 9501;
            text = "";
            sizeEx = 0.03;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.253 * safezoneH;
        };
        
        class ButtonSelect : life_RscButtonMenu {
            idc = 9502;
            text = "Auswählen";
            onButtonClick = "[16, [(lbData [9501, (lbCurSel 9501)])]] call phoneCalls_fnc_partial;";
            x = 0.438022 * safezoneW + safezoneX;
            y = 0.62496 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        
        class ButtonClose : life_RscButtonMenu {
            idc = -1;
            text = "Schließen";
            onButtonClick = "[7] spawn phoneCalls_fnc_partial;";
            x = 0.438022 * safezoneW + safezoneX;
            y = 0.65092 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};
