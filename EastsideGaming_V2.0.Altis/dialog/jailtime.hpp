class ESG_jailtime {
    idd = 2655;
    name = "ESG_jailtime";
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
        	text = "<t font='PuristaBold' size='1.5'>Gefänis</t>"; //--- ToDo: Localize;
        	x = 0.402031 * safezoneW + safezoneX;
        	y = 0.181 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class info: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='center'>Bitte gebe die Zeit ein, welche die Person in Alcatraz absitzen soll. Bitte beachte dabei das diese Zeit nicht über 1,5 Stunden gehen soll! Die Person wird direkt nach Alcatraz transportiert und kann von dort nur noch schwer entkommen!</t>"; //--- ToDo: Localize;
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
          text = "Einknasten"; //--- ToDo: Localize;
          onButtonClick="[] spawn life_fnc_jailtime_cop;";
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
          idc = 1400;
          text = "15";
          sizeEx = 0.030;
          x = 0.4175 * safezoneW + safezoneX;
          y = 0.445 * safezoneH + safezoneY;
          w = 0.154687 * safezoneW;
          h = 0.022 * safezoneH;
        };
    };
};