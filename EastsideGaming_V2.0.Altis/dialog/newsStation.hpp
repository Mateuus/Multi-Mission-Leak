class life_news_broadcast {
    idd = 100100;
    name= "life_news_broadcast";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };
        class btnClose: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
          onButtonClick = "closeDialog 0;";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.0876563 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>AAN Rundfunknachricht</t>"; //--- ToDo: Localize;
        	x = 0.407187 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class info: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='center'>An dieser Station kannst du eine Nachricht an alle Bürger der Insel senden. Gehe behutsam damit um, denn Polizisten können diese Meldung auch zurückverfolgen. Wir bitten dich keine Beleidigungen oder rassistische Ausdrücke in dieser Nachricht zu verwenden. Wirst du dies jedoch tun, musst du mit einem permanenten Ausschluss aus der Community rechnen."; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.644531 * safezoneW;
        	h = 0.099 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class title_head: Life_RscTitle
        {
        	idc = -1;
        	text = "Titel"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.346 * safezoneH + safezoneY;
        	w = 0.0567187 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title_msg: Life_RscTitle
        {
        	idc = 1001;
        	text = "Nachricht"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.434 * safezoneH + safezoneY;
        	w = 0.0567187 * safezoneW;
        	h = 0.022 * safezoneH;
        };
    };

    class controls {
        class MsgHeaderEdit: Life_RscEdit
        {
          idc = 100101;
          text = "";
          sizeEx = 0.035;
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.379 * safezoneH + safezoneY;
        	w = 0.134062 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class MsgContentEdit: Life_RscEdit
        {
          idc = 100102;
          text = "";
          sizeEx = 0.035;
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.467 * safezoneH + safezoneY;
        	w = 0.634219 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class MessageInfo: Life_RscStructuredText
        {
          idc = 100103;
          text = "";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.533 * safezoneH + safezoneY;
        	w = 0.319688 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class btnSend: Life_RscButtonMenu
        {
        	idc = 100104;
        	text = "Nachricht abschicken"; //--- ToDo: Localize;
        	x = 0.618594 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
