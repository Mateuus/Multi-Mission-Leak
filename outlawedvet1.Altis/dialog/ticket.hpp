class Life_ticket_give {
    idd = 2650;
    name = "life_ticket_give";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.42;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.42;
            h = 0.89 - (22 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 2651;
            text = "";
            x = 0.3;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

		class InfoMsg25k1: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "1. Speeding into a town area.";
            x = 0.31;
            y = 0.25;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg25k2: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "2. Being in Cop HQ's, jail or other.";
            x = 0.31;
            y = 0.30;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg25k3: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "3. Resisting a search.";
            x = 0.31;
            y = 0.35;
            w = (20 / 40);
            h = (1 / 25);
        };
			
		class InfoMsg25k4: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "4. Not having the correct licenses.";
            x = 0.31;
            y = 0.40;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg25k5: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "5. Driving an illegal vehicle.";
            x = 0.31;
            y = 0.45;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg25k6: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "6. Wearing stolen items.";
            x = 0.31;
            y = 0.50;
            w = (20 / 40);
            h = (1 / 25);
        };
		
        class payTicket: Life_RscButtonMenu {
            idc = -1;
            text = "$ 25,000 Ticket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[25] call life_fnc_ticketGive";
            x = 0.45;
            y = 0.57;
            w = (6.25 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg50k1: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "1. Robbery, unrestraining people.";
            x = 0.31;
            y = 0.63;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg50k2: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "2. Burglary.";
            x = 0.31;
            y = 0.68;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg50k3: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "3. Grand theft auto.";
            x = 0.31;
            y = 0.73;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg50k4: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "4. Possession of drugs.";
            x = 0.31;
            y = 0.78;
            w = (20 / 40);
            h = (1 / 25);
        };
		
		class InfoMsg50k5: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "5. Selling drugs.";
            x = 0.31;
            y = 0.83;
            w = (20 / 40);
            h = (1 / 25);
        };
				
		class InfoMsg50k6: Life_RscStructuredText {
            idc = -1;
            sizeEx = 0.020;
            text = "6. Having illegal firearms.";
            x = 0.31;
            y = 0.88;
            w = (20 / 40);
            h = (1 / 25);
        };
		
        class payTicket1: Life_RscButtonMenu {
            idc = -1;
            text = "$ 50,000 Ticket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[50] call life_fnc_ticketGive";
            x = 0.45;
            y = 0.95;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};

class Life_ticket_pay {
    idd = 2600;
    name = "life_ticket_pay";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.3;
            y = 0.2;
            w = 0.47;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.3;
            y = 0.2 + (11 / 250);
            w = 0.47;
            h = 0.3 - (22 / 250);
        };
    };

    class controls {
        class InfoMsg: Life_RscStructuredText {
            idc = 2601;
            sizeEx = 0.020;
            text = "";
            x = 0.287;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.12;
        };

        class payTicket: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Ticket_PayTicket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_ticketPay;closeDialog 0;";
            x = 0.2 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class refuseTicket: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Ticket_RefuseTicket";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "closeDialog 0;";
            x = 0.4 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.42 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};