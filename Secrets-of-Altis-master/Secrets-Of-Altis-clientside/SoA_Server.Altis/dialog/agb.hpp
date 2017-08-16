class agb {

    idd = 32154;
    movingEnable = 0;
    EnableSimulation = 1;

    class ControlsBackground {

        class ueberschrift: Life_RscText
        {
            idc = -1;
            text = "Allgemeine Einreisebestimmung";
            shadow = 1; 
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.410938 * safezoneW;
            h = 0.077 * safezoneH;
            colorBackground[] = {0.4,0,0,0.4};
            sizeEx = 0.05;
        };

        class logo: Life_RscPicture
        {
            idc = -1;
            text = "images\loading\soa.paa";
            x = 0.592813 * safezoneW + safezoneX;
            y = 0.214 * safezoneH + safezoneY;
            w = 0.109791 * safezoneW;
            h = 0.0999259 * safezoneH;
        };

        class rahmen_uebeLife_Rschrift: Life_RscFrame
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.410937 * safezoneW;
            h = 0.077 * safezoneH;
        };

        class textfeld_hintergrund: Life_RscText
        {
            idc = -1;
            x = 0.29526 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.408489 * safezoneW;
            h = 0.484667 * safezoneH;
            colorBackground[] = {1,1,1,0.5};
        };

        class boarder_big_unten: Life_RscFrame
        {
            idc = -1;
            x = 0.296302 * safezoneW + safezoneX;
            y = 0.302815 * safezoneH + safezoneY;
            w = 0.406823 * safezoneW;
            h = 0.481222 * safezoneH;
        };

        class text_einleitung: Life_RscStructuredText
        {
            idc = -1;
            text = "Herzlich willkommen auf unserer kleinen Insel! Wir hoffen du hattest eine wundervolle Anreise und wünschen dir für deinen Lebensneuanfang alles Gute für die Zukunft! ";
            shadow = 0;
            sizeEx = 0.04;
            size = 0.04;
            x = 0.300937 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.396979 * safezoneW;
            h = 0.101296 * safezoneH;
            colorText[] = {0,0,0,1};
            colorBackground[] = {-1,-1,-1,0};
        };

        class ab16: Life_RscPicture
        {
            idc = -1;
            text = "images\loading\usk.paa";
            x = 0.301407 * safezoneW + safezoneX;
            y = 0.683889 * safezoneH + safezoneY;
            w = 0.0522916 * safezoneW;
            h = 0.0929629 * safezoneH;
            colorText[] = {1,1,1,0.8};
        };

        class checksatz_1: Life_RscText
        {
            idc = -1;
            text = "1.      Ich werde stets im Sinne des Roleplays handeln und meine Rolle nicht verlassen.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class erklaerung: Life_RscText
        {
            idc = -1;
            text = "Um deine Einreise offiziell antreten zu können, musst du zuerst die folgenden Einreisebedingungen akzeptieren:";
            shadow = 1;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.30302 * safezoneW + safezoneX;
            y = 0.33963 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.077 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class checksatz_2: Life_RscText
        {
            idc = -1;
            text = "2.     Ich habe mir die hier aufgelisteten Bestimmungen nicht durchgelesen.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class checksatz_3: Life_RscText
        {
            idc = -1;
            text = "3.     Ich werde mir in naher Zukunft das unten verlinkte Insel-Regelwerk durchlesen.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class checksatz_4: Life_RscText
        {
            idc = -1;
            text = "4.     Ich besitze ein funktionierendes Headset samt Mikrofon zur Verständigung.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class checksatz_5: Life_RscText
        {
            idc = -1;
            text = "5.     Ich bin mindestens 16 Jahre alt und bin der deutschen Sprache mächtig.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.309375 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class checksatz_6: Life_RscText
        {
            idc = -1;
            text = "6.     Ich besitze einen funktionierenden, gesunden Verstand und setze diesen auch ein.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.324687 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0,0,0,1};
        };

       class fastfertig: Life_RscText
        {
            idc = -1;
            text = "Fast fertig! Nun musst du nur noch dein Einreiseformular per Klick auf den Button unten rechts digital abschicken.";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.30302 * safezoneW + safezoneX;
            y = 0.604334 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.066 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class vielspass: Life_RscText
        {
            idc = -1;
            text = "Wir wünschen dir nun viel Spaß und alles Gute bei uns auf der Insel. Auf eine grandiose Zeit!    Cheers!";
            shadow = 0;
            sizeEx = 0.033;
            size = 0.033;
            x = 0.303125 * safezoneW + safezoneX;
            y = 0.626 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.066 * safezoneH;
            colorText[] = {0,0,0,1};
        };

        class rahmen_abschicken: Life_RscFrame
        {
            idc = -1;
            x = 0.580937 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.114948 * safezoneW;
            h = 0.0210741 * safezoneH;
        };

        class copyright: Life_RscText
        {
            idc = -1;
            text = "© Secrets of Altis    2015 - 2016";
            size = 0.027;
            x = 0.617134 * safezoneW + safezoneX;
            y = 0.76863 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0,0,0,0.4};
            sizeEx = 0.7 * GUI_GRID_H;
        };

        class homepage: Life_RscStructuredText
        {
            idc = -1;
            text = "<a color='#ff1000' href='https://www.secretsofaltis.de/index.php/altis/regelwerk'>Regelwerk:           www.secretsofaltis.de</a>";
            shadow = 0;
            sizeEx = 0.03;
            size = 0.03;
            x = 0.35099 * safezoneW + safezoneX;
            y = 0.718185 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {-1,-1,-1,0};
        };

        class ts3: Life_RscStructuredText
        {
            idc = -1;
            text = "<a href='http://tinyurl.com/pzxf42h'>TeamSpeak³:        ts.secretsofaltis.de</a>";
            shadow = 0;
            sizeEx = 0.03;
            size = 0.03;   
            x = 0.350522 * safezoneW + safezoneX;
            y = 0.690739 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {-1,-1,-1,0};
        };

        class server: Life_RscStructuredText
        {
            idc = -1;
            text = "<a color='#ff1000' href='https://www.gametracker.com/server_info/89.163.162.218:2302'>AltisLife-Server:    89.163.162.218:2302</a>";
            shadow = 0;
            sizeEx = 0.03;
            size = 0.03;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.745481 * safezoneH + safezoneY;
            w = 0.169635 * safezoneW;
            h = 0.0348519 * safezoneH;
            colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {

        class check_6: Life_RscCheckbox2
        {
            idc = 32165;
            columns = 1;
            x = 0.651093 * safezoneW + safezoneX;
            y = 0.57237 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class check_5: Life_RscCheckbox2
        {
            idc = 32164;
            columns = 1;
            x = 0.651042 * safezoneW + safezoneX;
            y = 0.539815 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class check_4: Life_RscCheckbox2
        {
            idc = 32163;
            columns = 1;
            x = 0.651042 * safezoneW + safezoneX;
            y = 0.506481 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class check_3: Life_RscCheckbox2
        {
            idc = 32162;
            columns = 1;
            x = 0.651042 * safezoneW + safezoneX;
            y = 0.474074 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class check_2: Life_RscCheckbox2
        {
            idc = 32161;
            columns = 1;
            OnCheckedChanged = "if(_this select 1 == 1) then {troll = true} else {troll = false}";
            x = 0.651042 * safezoneW + safezoneX;
            y = 0.439814 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class check_1: Life_RscCheckbox2
        {
            idc = 32160;
            columns = 1;
            x = 0.651197 * safezoneW + safezoneX;
            y = 0.407296 * safezoneH + safezoneY;
            w = 0.0180208 * safezoneW;
            h = 0.033 * safezoneH;
        };

        class button_abschicken: Life_RscButtonMenu
        {
            idc = 32166;
            text = "Formular abschicken";
            OnButtonClick = "if(cbChecked ((finddisplay 32154) displayCtrl 32160) && cbChecked ((finddisplay 32154) displayCtrl 32162) && cbChecked ((finddisplay 32154) displayCtrl 32163) && cbChecked ((finddisplay 32154) displayCtrl 32164) && cbChecked ((finddisplay 32154) displayCtrl 32165)) then {closedialog 0;} else {closedialog 0; ['agb',false,true] call BIS_fnc_endMission};";
            x = 0.579948 * safezoneW + safezoneX;
            y = 0.719075 * safezoneH + safezoneY;
            w = 0.11552 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0.4,0,0,0.4};
        };
    };
};