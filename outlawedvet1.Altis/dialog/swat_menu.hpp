class life_swat_menu {
    idd = 15000;
    name= "life_swat_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_swatcommander;";
    
    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {0,0,1,0.75};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.8;
            h = (1 / 25);
        };
        
        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.8;
            h = 0.6 - (2 / 250);
        };
    };
    
    class controls {

        
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 1, 0};
            idc = 15001;
            text = "Swat Commander Menu";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class PlayerList_SwatAdmin : Life_RscListBox 
        {
            idc = 15002;
            text = "";
            sizeEx = 0.035;
            //colorBackground[] = {0,0,0,0};
            onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
            
            x = 0.12; y = 0.26;
            w = 0.30; h = 0.55;
        };
        
     /* 
        class SwatTitle : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Swat Commanding Menu ";
            x = 0.45; y = 0.27;
            w = 0.2; h = 0.03;
        };
		
        class reason : Life_RscEdit {
        
        idc = 15003;
        
        text = "";
        sizeEx = 0.030;
        x = 0.45; y = 0.39;
        w = 0.4; h = 0.04;
        };
        

        class PunishmentPredefined : Life_RscCombo 
        {
            idc = 9930;
            onLBListSelChanged  = "[(lbCurSel 9930)] call life_fnc_admin;";
            
            x = 0.45; y = 0.32;
            w = 0.4; h = 0.04;
        };
    */
        
        class SwatCloseButtonKey : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {1,0,0,0.75};
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.88 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
		
		
		 class SwatDemotion : Life_RscButtonMenu {
            idc = 15007;
            text = "Demote";
            onButtonClick = "[0,14] call life_fnc_adminaspromotions;";
            colorBackground[] = {1,0,0,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.53 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
		
		 class SwatRecruit : Life_RscButtonMenu {
            idc = 15008;
            text = "Recruit";
            onButtonClick = "[0,10] call life_fnc_adminaspromotions;";
            colorBackground[] = {0,1,0,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.59 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
        
        class SwatMember : Life_RscButtonMenu {
            idc = 15004;
            text = "Member";
            onButtonClick = "[0,11] call life_fnc_adminaspromotions;";
            colorBackground[] = {0,0,1,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.65 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
        
        class SwatSquadLeader : Life_RscButtonMenu {
            idc = 15005;
            text = "Squad Leader";
            onButtonClick = "[0,12] call life_fnc_adminaspromotions;";
            colorBackground[] = {0,0,1,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.73 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
        
        class SwatComander : Life_RscButtonMenu {
            idc = 15006;
            text = "Commander";
            onButtonClick = "[0,13] call life_fnc_adminaspromotions;";
			 colorBackground[] = {0,0,1,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.79 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
    };
};