class XY_dialog_GangDialog {
    idd = 2620;

    movingEnable = true;
    enableSimulation = true;
    onLoad = "";

    class controlsBackground {
        class bgHead: IGUIBack {
            idc = -1;
            x = 0.245 * safezoneW + safezoneX;
            y = 0.250 * safezoneH + safezoneY;
            w = 0.510 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class bgMain: IGUIBack {
            idc = -1;
            x = 0.245 * safezoneW + safezoneX;
            y = 0.275 * safezoneH + safezoneY;
            w = 0.510 * safezoneW;
            h = 0.425 * safezoneH;
            colorBackground[] = {0, 0, 0, 0.8};
        };
        class bgMembers: IGUIBack {
            idc = -1;
            x = 0.250 * safezoneW + safezoneX;
            y = 0.290 * safezoneH + safezoneY;
            w = 0.252 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class bgInvite: IGUIBack {
            idc = -1;
            x = 0.250 * safezoneW + safezoneX;
            y = 0.630 * safezoneH + safezoneY;
            w = 0.252 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class bgBank: IGUIBack {
            idc = -1;
            x = 0.510 * safezoneW + safezoneX;
            y = 0.290 * safezoneH + safezoneY;
            w = 0.240 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class bgSlots: IGUIBack {
            idc = -1;
            x = 0.510 * safezoneW + safezoneX;
            y = 0.400 * safezoneH + safezoneY;
            w = 0.240 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
    };
    class controls {
        class lbHeading: RscStructuredText
        {
            idc = -1;
            text = "<t size='1.15' align='center'>GANGVERWALTUNG</t>";
            x = 0.250 * safezoneW + safezoneX;
            y = 0.250 * safezoneH + safezoneY;
            w = 0.500 * safezoneW;
            h = 0.025 * safezoneH;
            moving = 1;
            colorBackground[] = {0, 0, 0, 0};
        };
        class lbMembers: RscStructuredText
        {
            idc = -1;
            text = "<t size='1.0' align='center'>MITGLIEDER</t>";
            x = 0.250 * safezoneW + safezoneX;
            y = 0.290 * safezoneH + safezoneY;
            w = 0.252 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        
        class lstMembers: RscListbox
        {
            idc = 1500;
            x = 0.250 * safezoneW + safezoneX;
            y = 0.330 * safezoneH + safezoneY;
            w = 0.200 * safezoneW;
            h = 0.295 * safezoneH;
            sizeEx = 0.035;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        
        class btnKick: RscButtonMenu
        {
            idc = 1100;
            text = "KICK";
            x = 0.452 * safezoneW + safezoneX;
            y = 0.330 * safezoneH + safezoneY;
            w = 0.050 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""kick""] spawn XY_fnc_gangMenu";
        };
        class btnMod: RscButtonMenu
        {
            idc = 1101;
            text = "MOD";
            x = 0.452 * safezoneW + safezoneX;
            y = 0.355 * safezoneH + safezoneY;
            w = 0.050 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""moderator""] spawn XY_fnc_gangMenu";
        };
        class btnLead: RscButtonMenu
        {
            idc = 1102;
            text = "LEAD";
            x = 0.452 * safezoneW + safezoneX;
            y = 0.380 * safezoneH + safezoneY;
            w = 0.050 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""leader""] spawn XY_fnc_gangMenu";
        };
        class lbInvite: RscStructuredText
        {
            idc = -1;
            text = "<t size='1.0' align='center'>EINLADEN</t>";
            x = 0.250 * safezoneW + safezoneX;
            y = 0.630 * safezoneH + safezoneY;
            w = 0.252 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        class cmbPlayers: RscCombo
        {
            idc = 2100;
            x = 0.250 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.148 * safezoneW;
            h = 0.025 * safezoneH;
        };
        class btnInvTemp: RscButtonMenu
        {
            idc = 1103;
            text = "TEMP";
            x = 0.400 * safezoneW + safezoneX;
            y = 0.667 * safezoneH + safezoneY;
            w = 0.050 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""invite"", false] spawn XY_fnc_gangMenu";
        };
        class btnInvPerm: RscButtonMenu
        {
            idc = 1104;
            text = "PERM";
            x = 0.452 * safezoneW + safezoneX;
            y = 0.667 * safezoneH + safezoneY;
            w = 0.050 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""invite"", true] spawn XY_fnc_gangMenu";
        };
        class lbBank: RscStructuredText
        {
            idc = -1;
            text = "<t size='1.0' align='center'>GANGKASSE</t>";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.290 * safezoneH + safezoneY;
            w = 0.240 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        class lbBankAmount: RscStructuredText
        {
            idc = 2200;
            text = "";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.320 * safezoneH + safezoneY;
            w = 0.240 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        class btnBankWithdraw: RscButtonMenu
        {
            idc = 1105;
            text = "ABHEBEN";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.355 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""withdraw""] spawn XY_fnc_gangMenu";
        };
        class btnBankDeposit: RscButtonMenu
        {
            idc = -1;
            text = "EINZAHLEN";
            x = 0.595 * safezoneW + safezoneX;
            y = 0.355 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""deposit""] spawn XY_fnc_gangMenu";
        };
        class btnBankLog: RscButtonMenu
        {
            idc = -1;
            text = "LOG";
            x = 0.680 * safezoneW + safezoneX;
            y = 0.355 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""log""] spawn XY_fnc_gangMenu";
        };
        
        class lbSlots: RscStructuredText {
            idc = -1;
            text = "<t size='1.0' align='center'>SLOTS</t>";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.400 * safezoneH + safezoneY;
            w = 0.240 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        
        class lbMemberSlotsHeader: RscStructuredText {
            idc = -1;
            text = "<t size='1.0' align='center'>GANGSLOTS</t>";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.430 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        
        class lbMemberSlots : RscStructuredText {
            idc = 2300;
            text = "<t size='1.3' align='center'>4</t>";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.450 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.025 * safezoneH;
            colorBackground[] = {0, 0, 0, 0};
        };
        
        class btnExpandSlots : RscButtonMenu
        {
            idc = 1106;
            text = "ERWEITERN";
            x = 0.510 * safezoneW + safezoneX;
            y = 0.475 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""expandSlots""] spawn XY_fnc_gangMenu";
        };
        
        class btnDisband : RscButtonMenu
        {
            idc = 1107;
            text = "AUFLÖSEN";
            x = 0.595 * safezoneW + safezoneX;
            y = 0.475 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""disband""] spawn XY_fnc_gangMenu";
        };      
		
        class btnLeave : RscButtonMenu
        {
            idc = -1;
            text = "VERLASSEN";
            x = 0.595 * safezoneW + safezoneX;
            y = 0.667 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "[""leave""] spawn XY_fnc_gangMenu";
        };        

        class btnExit : RscButtonMenu
        {
            idc = -1;
            text = "SCHLIESSEN";
            x = 0.680 * safezoneW + safezoneX;
            y = 0.667 * safezoneH + safezoneY;
            w = 0.070 * safezoneW;
            h = 0.020 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
    };
};