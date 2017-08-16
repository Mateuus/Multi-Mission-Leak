class Life_ticket_give {
    idd = 2650;
    name = "life_ticket_give";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = 0.340156 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.309375 * safezoneW;
        	h = 0.583 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Strafzettel</t>"; //--- ToDo: Localize;
        	x = 0.402031 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class info: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='center'>Bitte gebe hier die zu bezahlende Summe ein. Das Maximum dabei sind 500.000$.  Sollte die Person diesen Strafzettel drei Mal nicht bezahlen, dann darf die Person in das Gefängnis Übergeben werden.</t>"; //--- ToDo: Localize;
        	x = 0.37625 * safezoneW + safezoneX;
        	y = 0.2646 * safezoneH + safezoneY;
        	w = 0.232031 * safezoneW;
        	h = 0.143 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class BtnSell: Life_RscButtonMenu
        {
          idc = -1;
          text = "Ausstellen"; //--- ToDo: Localize;
          onButtonClick = "[] call life_fnc_ticketGive";
          x = 0.427812 * safezoneW + safezoneX;
          y = 0.698 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class btnClose: ESG_RscCloseButton
        {
          idc = -1;
          onButtonClick = "closeDialog 0;";
          x = 0.592812 * safezoneW + safezoneX;
          y = 0.181 * safezoneH + safezoneY;
          w = 0.020625 * safezoneW;
          h = 0.033 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
        class moneyEdit: Life_RscEdit
        {
          idc = 2652;
          text = "100";
          sizeEx = 0.030;
          x = 0.4175 * safezoneW + safezoneX;
          y = 0.445 * safezoneH + safezoneY;
          w = 0.154687 * safezoneW;
          h = 0.022 * safezoneH;
        };
    };
};

class Life_ticket_pay {
    idd = 2600;
    name = "life_ticket_pay";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = 0.340156 * safezoneW + safezoneX;
        	y = 0.17 * safezoneH + safezoneY;
        	w = 0.309375 * safezoneW;
        	h = 0.594 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Strafzettel</t>"; //--- ToDo: Localize;
        	x = 0.402031 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class btnClose: ESG_RscCloseButton
        {
          idc = -1;
          onButtonClick = "hint 'Ne ne, das geht nicht :)';";
          x = 0.592812 * safezoneW + safezoneX;
          y = 0.181 * safezoneH + safezoneY;
          w = 0.020625 * safezoneW;
          h = 0.033 * safezoneH;
          colorBackground[] = {-1,-1,-1,0};
        };
        class BtnPay: Life_RscButtonMenu
        {
          idc = 2400;
          text = "Bezahlen"; //--- ToDo: Localize;
          x = 0.430894 * safezoneW + safezoneX;
          y = 0.445 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
          onButtonClick = "[] call life_fnc_ticketPay;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
        class InfoMsg: Life_RscStructuredText
        {
          idc = 2601;
          sizeEx = 0.020;
          text = "";
          x = 0.37625 * safezoneW + safezoneX;
          y = 0.2646 * safezoneH + safezoneY;
          w = 0.232031 * safezoneW;
          h = 0.143 * safezoneH;
          colorBackground[] = {-1,-1,-1,-1};
        };
        class BtnRefuse: Life_RscButtonMenu
        {
          idc = -1;
          text = "Ablehnen"; //--- ToDo: Localize;
          x = 0.431925 * safezoneW + safezoneX;
          y = 0.533 * safezoneH + safezoneY;
          w = 0.118594 * safezoneW;
          h = 0.044 * safezoneH;
          colorBackground[] = {0.753,0.145,0.145,1};
          onButtonClick = "closeDialog 0;";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
