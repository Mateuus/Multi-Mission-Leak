class Life_My_Gang_Diag {
    idd = 2620;
    name= "life_my_gang_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";

    class controlsBackground {
        class imagebackground: Life_RscPictureKeepAspect
        {
            idc = -1;
            //moving = 1;
            text = "images\Textures\Phone\phoneBlank.paa";
            x = -0.0625;
            y = -0.3;
            w = 1.1375;
            h = 1.5;
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 2629;
            text = "";
            x = 0.34;
            y = 0;
            w = 0.28;
            h = (1 / 25);
        };

        class GangMemberList: Life_RscListBox
        {
            idc = 2621;
            text = "";
            sizeEx = 0.035;
            x = 0.325;
            y = 0.05;
            w = 0.350;
            h = 0.530;
            colorBackground[] = {0,0,0,0};
        };

        class CloseLoadMenu: Life_RscButtonMenu {
            idc = -1;
            onButtonClick = "closeDialog 0;";
			tooltip = "Previous Menu";
            x = 0.40294 * safezoneW + safezoneX;
            y = 0.733 * safezoneH + safezoneY;
            w = 0.059 * safezoneW;
            h = 0.049 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };

        class GangLeave: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Gang_Leave";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] call life_fnc_gangLeave";
            x = 0.39;
            y = 0.65;
            w = (9 / 40);
            h = 0.04;
        };

        class GangUPG: Life_RscButtonMenu {
            idc = 2622;
            text = "$STR_Gang_UpgradeSlots";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] spawn life_fnc_gangUpgrade";
            x = 0.39;
            y = 0.7;
            w = (9 / 40);
            h = 0.04;
        };

        class GangKick: Life_RscButtonMenu {
            idc = 2624;
            text = "$STR_Gang_Kick";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] call life_fnc_gangKick";
            x = 0.39;
            y = 0.75;
            w = (9 / 40);
            h = 0.04;
        };

        class GangLeader: Life_RscButtonMenu {
            idc = 2625;
            text = "$STR_Gang_SetLeader";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] spawn life_fnc_gangNewLeader";
            x = 0.39;
            y = 0.8;
            w = (9 / 40);
            h = 0.04;
        };

        class InviteMember: GangLeader {
            idc = 2630;
            text = "$STR_Gang_Invite_Player";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
            y = .9;
        };

        class DisbandGang: InviteMember {
            idc = 2631;
            text = "$STR_Gang_Disband_Gang";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] spawn life_fnc_gangDisband";
            y = .85;
        };

        class ColorList: Life_RscCombo {
            idc = 2632;
            x = 0.39;
            y = 0.6;
            w = (9 / 40);
            h = 0.04;
        };

        class GangBank: Title {
            idc = 601;
            style = 1;
            text = "";
        };
    };
};

class Life_Create_Gang_Diag {
    idd = 2520;
    name= "life_my_gang_menu_create";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format [localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {0,0,0,0};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.3 - (22 / 250);
        };
    };

    class controls {
        class InfoMsg: Life_RscStructuredText {
            idc = 2523;
            sizeEx = 0.020;
            text = "";
            x = 0.1;
            y = 0.25;
            w = 0.5;
            h = .11;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_Gang_Title";
            x = 0.1;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class Life_RscButtonInvisible_5555: Life_RscButtonMenu {
            idc = -1;
            onButtonClick = "closeDialog 0;";
            tooltip = "Previous Menu";
            x = 0.40294 * safezoneW + safezoneX;
            y = 0.733 * safezoneH + safezoneY;
            w = 0.059 * safezoneW;
            h = 0.049 * safezoneH;
        };

        class GangCreateField: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Gang_Create";
            colorBackground[] = {0,0,0,0};
            onButtonClick = "[] call life_fnc_createGang";
            x = 0.27;
            y = 0.40;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class CreateGangText: Life_RscEdit {
            idc = 2522;
            text = "$STR_Gang_YGN";
            x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.35;
            w = (13 / 40);
            h = (1 / 25);
        };
    };
};