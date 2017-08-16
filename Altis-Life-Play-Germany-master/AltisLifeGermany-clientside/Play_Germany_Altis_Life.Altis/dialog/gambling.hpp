class King_gambling {
	idd = 5000;
	name= "life_gambling_menu"; //life_impound_menu
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[] execVM 'core\client\keychain\init.sqf'";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
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
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		class GamblingBlockerStatus : Life_RscStructuredText
		{
			idc = 5006;
			text = "";
			//x = 0.5;
            //y = 0.6;
			//w = 0.4;
			//h = 0.1;
			x = 0.1 + 0.05;
            y = 0.7;
			w = 0.8 - 0.1;
			h = 0.1;
            class Attributes {
                align = "center";
            };                    
		};
        
		class GamblingResultText : Life_RscStructuredText
		{
			idc = 5007;
			text = "";
			
			x = 0.5;
            y = 0.2;
			w = 0.4;
			h = 0.1;
            class Attributes {
                align = "center";
            };                    
		};
        
		class PlayerCash : Life_RscStructuredText
		{
			idc = 5001;
			text = "Dein Bargeld";
			
			x = 0.5;
            y = 0.3;
			w = 0.4;
			h = 0.1;
            class Attributes {
                align = "center";
            };                    
		};

		class MoneyBidText : Life_RscStructuredText
		{
			idc = -1;
			text = "Einsatz:";
            x = 0.55; 
            y = 0.4;
            w = 0.2; 
            h = 0.2;	
		};

		class MoneyBid : Life_RscEdit
        {
            idc = 5002;
            text = "1";
            sizeEx = 0.04;
            x = 0.65; 
            y = 0.4;
            w = 0.2; 
            h = 0.04;	
		};

        class JackpotText : Life_RscStructuredText
		{
			idc = 5008;
			text = "";
            x = 0.5; 
            y = 0.5;
            w = 0.4; 
            h = 0.1;	
            class Attributes {
                align = "center";
            };                    
		};

        class JackpotRulesText : Life_RscStructuredText
		{
			idc = 5009;
			text = "";
            x = 0.5; 
            y = 0.55;
            w = 0.4; 
            h = 0.1;	
            class Attributes {
                align = "center";
            };                    
		};

        class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 5004;
			text = "Titletext";
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
        
		class GambleButton2 : life_RscButtonMenu {
			idc = -1;
			text = "Slotmachine";
            onButtonClick = "['einarmiger Bandit'] call king_fnc_gambling";
			x = 0.1 + (6.25 / 40) + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH)) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40) + 0.05;
			h = (1 / 25);
		};

		class GambleButton1 : life_RscButtonMenu {
			idc = -1;
			text = "Würfeln";
            onButtonClick = "['Dice'] call king_fnc_gambling";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
        
        //progress bar 
        class Progress : Life_RscProgress
        {
            idc = 5005;
            //type = 8;
            //style = 0;
            colorFrame[] = {1, 1, 1, 1};
            //colorBar[] = {1, 0.50, 0, 1};
            x = 0.1 + 0.05;
            y = 0.7;
            w = 0.8 - 0.1;
            h = 0.04;
        };

		class GamblingTimer : Life_RscStructuredText
		{
			idc = 5003;
			text = "";
			x = 0.1 + 0.05;
            y = 0.7;
			w = 0.8 - 0.1;
			h = 0.1;
            class Attributes {
                align = "center";
            };                    
		};

        ////////////////////////////////////////////////////
        //DICE VIEW
        ////////////////////////////////////////////////////
        class GamblingDiceView : Life_RscControlsGroup
        {
            idc = 5100;
            show = 0;  
            x = 0.1 + 0.01;
            y = 0.2 + (11 / 250) + 0.01;
            w = 0.4 - 0.00;
            h = 0.6 - (22 / 250) - 0.01;

            class Controls
            {
                /*
                class GamblingDiceBackground:Life_RscText
                {
                    idc = -1;
                    colorBackground[] = {0.5, 0.5, 0.5, 0.7};
                    x = 0.0;
                    y = 0.0;
                    w = 0.4;
                    h = 0.4;
                };
                */
                class GamblingDiceTitle : Life_RscStructuredText
                {
                    idc = -1;
                    text = "Roll the Dice";
                    x = 0.0;
                    y = 0.0;
                    w = 0.3;
                    h = 0.1;
                    class Attributes {
                        align = "center";
                    };                    
                };
                
                class GamblingImageDice1 : Life_RscStructuredText
                {
                    idc = 5101;
                    text = "<img size='2.5' image='core\ALG\icons\metal_steel1.paa'/>";
                    
                    x = 0.05;
                    y = 0.1;
                    w = 0.1;
                    h = 0.1;
                };
                
                class GamblingImageDice2 : Life_RscStructuredText
                {
                    idc = 5102;
                    text = "<img size='2.5' image='core\ALG\icons\metal_steel1.paa'/>";
                    
                    x = 0.15;
                    y = 0.1;
                    w = 0.1;
                    h = 0.1;
                };
                
                class GamblingRulesDice1 : Life_RscStructuredText
                {
                    idc = 5103;
                    text = "rules1";
                    x = 0.0;
                    y = 0.25;
                    w = 0.3;
                    h = 0.1;                                   
                    class Attributes {
                        align = "center";
                    };                    
                };   
                
                class GamblingRulesDice2 : Life_RscStructuredText
                {
                    idc = 5104;
                    text = "rules1";
                    x = 0.0;
                    y = 0.3;
                    w = 0.3;
                    h = 0.1;                                   
                    class Attributes {
                        align = "center";
                    };                    
                };   
                
                class GambleButtonDice : life_RscButtonMenu
                {
                    idc = 5105;
                    text = "würfeln...";
                    onButtonClick = "ctrlEnable[5105, false];[] spawn king_fnc_gamble_dice;[] spawn {sleep(1);ctrlEnable[5105, true];};";
                    x = 0.07;
                    y = 0.375;
                    w = (6.25 / 40);
                    h = (1 / 25);
                    colorBackground[] = {0.3,0.3,0.3,0.8};
                    class Attributes {
                        align = "center";
                    };    
                };
                
            };       
        };

        
        ////////////////////////////////////////////////////
        //BANDIT VIEW
        ////////////////////////////////////////////////////       
        class GamblingBanditView : Life_RscControlsGroup
        {
            idc = 5200;
            show = 0;  
            x = 0.1 + 0.01;
            y = 0.2 + (11 / 250) + 0.01;
            w = 0.4 - 0.00;
            h = 0.6 - (22 / 250) - 0.01;

            class Controls
            {
                class GamblingBanditTitle : Life_RscStructuredText
                {
                    idc = -1;
                    text = "Slotmachine";
                    x = 0.0;
                    y = 0.0;
                    w = 0.3;
                    h = 0.1;
                    class Attributes {
                        align = "center";
                    };                    
                };
                
                class GamblingImage1 : Life_RscStructuredText
                {
                    idc = 5201;
                    text = "<img size='2.5' image='core\ALG\icons\metal_steel1.paa'/>";
                    x = 0.0;
                    y = 0.1;
                    w = 0.1;
                    h = 0.1;
                };
                
                class GamblingImage2 : Life_RscStructuredText
                {
                    idc = 5202;
                    text = "<img size='2.5' image='core\ALG\icons\metal_steel1.paa'/>";
                    x = 0.1;
                    y = 0.1;
                    w = 0.1;
                    h = 0.1;
                };
                
                class GamblingImage3 : Life_RscStructuredText
                {
                    idc = 5203;
                    text = "<img size='2.5' image='core\ALG\icons\metal_steel1.paa'/>";
                    x = 0.2;
                    y = 0.1;
                    w = 0.1;
                    h = 0.1;
                };
                
                class GamblingRulesDice1 : Life_RscStructuredText
                {
                    idc = 5204;
                    text = "rules1";
                    x = 0.0;
                    y = 0.25;
                    w = 0.3;
                    h = 0.1;                                   
                    class Attributes {
                        align = "center";
                    };                    
                };   
                
                class GamblingRulesDice2 : Life_RscStructuredText
                {
                    idc = 5205;
                    text = "rules2";
                    x = 0.0;
                    y = 0.3;
                    w = 0.3;
                    h = 0.1;                                   
                    class Attributes {
                        align = "center";
                    };                    
                };   

                class GambleButtonBandit : life_RscButtonMenu
                {
                    idc = 5206;
                    text = "spielen...";
                    onButtonClick = "ctrlEnable[5206, false];[] spawn king_fnc_gamble_bandit;[] spawn {sleep(1);ctrlEnable[5206, true];};";
                    x = 0.07;
                    y = 0.375;
                    w = (6.25 / 40);
                    h = (1 / 25);
                    colorBackground[] = {0.3,0.3,0.3,0.8};
                    class Attributes {
                        align = "center";
                    };                    
                }; 
                
            };       
        };
                   
	};
};