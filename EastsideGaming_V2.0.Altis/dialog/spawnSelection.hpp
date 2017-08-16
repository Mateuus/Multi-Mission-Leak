class life_spawn_selection {
    idd = 38500;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class riffel: life_RscPicture
        {
          idc = -1;
          text = "a3\ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
          x = -0.000156274 * safezoneW + safezoneX;
          y = -0.00599999 * safezoneH + safezoneY;
          w = 1.00547 * safezoneW;
          h = 1.012 * safezoneH;
        };
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
        	x = 0.17 * safezoneW + safezoneX;
        	y = 0.115 * safezoneH + safezoneY;
        	w = 0.665156 * safezoneW;
        	h = 0.693 * safezoneH;
        };

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Spawnauswahl</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };

        class spawnpointtitle: life_rscTitle
        {
          idc = 38501;
          text = "";
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.257813 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class map: Life_RscMapControl
        {
        	idc = 38502;
        	x = 0.489687 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.340312 * safezoneW;
        	h = 0.572 * safezoneH;
          maxSatelliteAlpha = 0.75;//0.75;
          alphaFadeStartScale = 1.15;//0.15;
          alphaFadeEndScale = 1.29;//0.29;
        };
		class btnspawn: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Auf in das Abenteuer"; //--- ToDo: Localize;
        	x = 0.242187 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.185625 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "[] call life_fnc_spawnConfirm";
			class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };

    class controls {
        class spawn_list: Life_RscListNBox
        {
          idc = 38510;
          text = "";
          sizeEx = 0.041;
          coloumns[] = {0,0,0.9};
          drawSideArrows = 0;
          idcLeft = -1;
          idcRight = -1;
          rowHeight = 0.050;
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.225 * safezoneH + safezoneY;
        	w = 0.309375 * safezoneW;
          onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		  onLBDblClick = "[] call life_fnc_spawnConfirm";
        	h = 0.3 * safezoneH;
        };
        class abbrechen_btn: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Zurück in die Lobby gehen"; //--- ToDo: Localize;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.753 * safezoneH + safezoneY;
        	w = 0.201094 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "endmission ""-"";";
          class Attributes {
            font = "PuristaBold";
            align = "center";
          };
        };
    };
};
