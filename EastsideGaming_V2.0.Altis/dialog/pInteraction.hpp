#define BGX 0.35
#define BGY 0.2
#define BGW 0.46

class pInteraction_Menu {
    idd = 37400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_klein_menu.paa";
        	x = 0.319531 * safezoneW + safezoneX;
        	y = 0.148 * safezoneH + safezoneY;
        	w = 0.340312 * safezoneW;
        	h = 0.638 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Interaktionsmenü</t>"; //--- ToDo: Localize;
        	x = 0.386562 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class btnOne: Life_RscButtonMenu
        {
          idc = 37450;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnTwo: Life_RscButtonMenu
        {
          idc = 37451;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.291 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnThree: Life_RscButtonMenu
        {
          idc = 37452;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.346 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnFour: Life_RscButtonMenu
        {
          idc = 37453;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.401 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnFive: Life_RscButtonMenu
        {
          idc = 37454;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.456 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnSix: Life_RscButtonMenu
        {
          idc = 37455;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.511 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnSeven: Life_RscButtonMenu
        {
          idc = 37456;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.566 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnEight: Life_RscButtonMenu
        {
          idc = 37457;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.621 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnNine: Life_RscButtonMenu
        {
          idc = 37458;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.676 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnTen: Life_RscButtonMenu
        {
          idc = 28547;
          text = "";
          sizeEx = 0.05;
        	x = 0.350469 * safezoneW + safezoneX;
        	y = 0.731 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,0.5};
          class Attributes
    			{
    				align = "center";
    				font = "PuristaBold";
    			};
        };
        class btnClose: ESG_RscCloseButton
        {
        	idc = -1;
        	x = 0.6 * safezoneW + safezoneX;
        	y = 0.159259 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
          onButtonClick = "closeDialog 0;";
        };
    };
};

class vInteraction_Menu {
    idd = 37400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
      class bg_pic: Life_RscPicture
      {
        idc = -1;
        text = "texture\misc\bg_klein_menu.paa";
        x = 0.319531 * safezoneW + safezoneX;
        y = 0.148 * safezoneH + safezoneY;
        w = 0.340312 * safezoneW;
        h = 0.638 * safezoneH;
      };
      class title: Life_RscStructuredText
      {
        idc = -1;
        text = "<t font='PuristaBold' size='1.5'>Interaktionsmenü</t>"; //--- ToDo: Localize;
        x = 0.386562 * safezoneW + safezoneX;
        y = 0.159 * safezoneH + safezoneY;
        w = 0.201094 * safezoneW;
        h = 0.033 * safezoneH;
        colorBackground[] = {-1,-1,-1,0};
      };
      };

      class controls {
      class btnOne: Life_RscButtonMenu
      {
        idc = 37450;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.236 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnTwo: Life_RscButtonMenu
      {
        idc = 37451;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.291 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnThree: Life_RscButtonMenu
      {
        idc = 37452;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.346 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnFour: Life_RscButtonMenu
      {
        idc = 37453;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.401 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnFive: Life_RscButtonMenu
      {
        idc = 37454;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.456 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnSix: Life_RscButtonMenu
      {
        idc = 37455;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.511 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnSeven: Life_RscButtonMenu
      {
        idc = 37456;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.566 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnEight: Life_RscButtonMenu
      {
        idc = 37457;
        text = "";
        sizeEx = 0.05;
        x = 0.350469 * safezoneW + safezoneX;
        y = 0.621 * safezoneH + safezoneY;
        w = 0.273281 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {0.753,0.145,0.145,0.5};
        class Attributes
        {
          align = "center";
          font = "PuristaBold";
        };
      };
      class btnClose: ESG_RscCloseButton
      {
        idc = -1;
        x = 0.6 * safezoneW + safezoneX;
        y = 0.159259 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.044 * safezoneH;
        colorBackground[] = {-1,-1,-1,0};
        onButtonClick = "closeDialog 0;";
      };
      };
      };
