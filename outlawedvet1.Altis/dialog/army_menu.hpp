class life_army_menu {
    idd = 16000;
    name= "life_army_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_admincommander;";
    
    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {0,1,0,0.75};
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
            idc = 16001;
            text = "Army Commander Menu";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class PlayerList_DeaAdmin : Life_RscListBox 
        {
            idc = 16002;
            text = "";
            sizeEx = 0.035;
            //colorBackground[] = {0,0,0,0};
            onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
            
            x = 0.12; y = 0.26;
            w = 0.30; h = 0.55;
        };
        
        class DeaCloseButtonKey : Life_RscButtonMenu {
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
		
		class DeaDemotion : Life_RscButtonMenu {
            idc = 16009;
            text = "Demotion";
            onButtonClick = "[0,15] call life_fnc_adminaapromotions;";
            colorBackground[] = {1,0,0,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.47 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
		
		 class DeaIntern : Life_RscButtonMenu {
            idc = 16007;
            text = "Recruit";
            onButtonClick = "[0,6] call life_fnc_adminaapromotions;";
            colorBackground[] = {0,1,0,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.53 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
		 class DeaAgent : Life_RscButtonMenu {
            idc = 16008;
            text = "Soldier";
            onButtonClick = "[0,7] call life_fnc_adminaapromotions;";
            colorBackground[] = {0,0,1,0.75};
            x = 0.3 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.59 - (1 / 25);
            w = (15 / 40);
            h = (1 / 25);
            class Attributes 
            {
                align = "center";
            };
        };
        /*
        class DeaSpecialAgent : Life_RscButtonMenu {
            idc = 16004;
            text = "Spec. Agent";
            onButtonClick = "[] call life_fnc_admindea_3; closeDialog 0;";
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
		*/
        
        class DeaDeputyDirector : Life_RscButtonMenu {
            idc = 16005;
            text = "2nd in command";
            onButtonClick = "[0,8] call life_fnc_adminaapromotions;";
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
        
        class Deadirector : Life_RscButtonMenu {
            idc = 16006;
            text = "Commander";
            onButtonClick = "[0,9] call life_fnc_adminaapromotions;";
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