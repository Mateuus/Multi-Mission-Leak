class fms_system {
    idd = 39400;
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
      class title: Life_RscStructuredText
      {
      	idc = -1;
      	text = "<t font='PuristaBold' align='right' size='1.5'>FMS | Streifensystem</t>"; //--- ToDo: Localize;
      	x = 0.371094 * safezoneW + safezoneX;
      	y = 0.126 * safezoneH + safezoneY;
      	w = 0.237187 * safezoneW;
      	h = 0.033 * safezoneH;
      	colorBackground[] = {-1,-1,-1,0};
      };
      class btn_close: Life_RscButtonMenu
      {
      	idc = -1;
      	text = "Schliessen"; //--- ToDo: Localize;
      	x = 0.190625 * safezoneW + safezoneX;
      	y = 0.742 * safezoneH + safezoneY;
      	w = 0.0876563 * safezoneW;
      	h = 0.033 * safezoneH;
      	colorBackground[] = {0.149,0.149,0.149,1};
        onButtonClick = "closeDialog 0;";
      };
      class strich: Life_RscText
      {
      	idc = -1;
      	x = 0.551562 * safezoneW + safezoneX;
      	y = 0.222 * safezoneH + safezoneY;
      	w = 0.004125 * safezoneW;
      	h = 0.528 * safezoneH;
      	colorBackground[] = {0.753,0.145,0.145,0.8};
      };
      class title_shortcall: Life_RscTitle
      {
      	idc = -1;
      	text = "Streifenkürzel:"; //--- ToDo: Localize;
      	x = 0.572187 * safezoneW + safezoneX;
      	y = 0.319 * safezoneH + safezoneY;
      	w = 0.134062 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class title_tree: Life_RscTitle
      {
      	idc = -1;
      	text = "Streifenübersicht/Streifenauswahl"; //--- ToDo: Localize;
      	x = 0.180312 * safezoneW + safezoneX;
      	y = 0.203 * safezoneH + safezoneY;
      	w = 0.257813 * safezoneW;
      	h = 0.022 * safezoneH;
      };
      class title_selected: Life_RscTitle
      {
      	idc = -1;
      	text = "Ausgewählte Streife:"; //--- ToDo: Localize;
      	x = 0.572187 * safezoneW + safezoneX;
      	y = 0.242 * safezoneH + safezoneY;
      	w = 0.134062 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class title_gebiet: Life_RscTitle
      {
      	idc = -1;
      	text = "Einsatzgebiet:"; //--- ToDo: Localize;
      	x = 0.572187 * safezoneW + safezoneX;
      	y = 0.396 * safezoneH + safezoneY;
      	w = 0.134062 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class title_rang: Life_RscTitle
      {
      	idc = -1;
      	text = "Vorgeschlagener Rang:"; //--- ToDo: Localize;
      	x = 0.572187 * safezoneW + safezoneX;
      	y = 0.561 * safezoneH + safezoneY;
      	w = 0.134062 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class title_count: Life_RscTitle
      {
      	idc = -1;
      	text = "Anzahl der aktuellen Einheiten:"; //--- ToDo: Localize;
      	x = 0.572187 * safezoneW + safezoneX;
      	y = 0.638 * safezoneH + safezoneY;
      	w = 0.164062 * safezoneW;
      	h = 0.033 * safezoneH;
      };
    };

    class controls {
      class tree_streifen: ESG_RscTree
      {
      	idc = 1500;
        text = "";
        onTreeSelChanged = "[_this select 1]call ESG_fnc_fmsData;";
        onTreeDblClick = "[_this select 1]call ESG_fnc_fmsLogin;";
      	x = 0.185469 * safezoneW + safezoneX;
      	y = 0.236 * safezoneH + safezoneY;
      	w = 0.355781 * safezoneW;
      	h = 0.495 * safezoneH;
      	colorBackground[] = {-1,-1,-1,0.7};
      };
      class selected_streife: Life_RscTitle
      {
      	idc = 1002;
        text = "";
      	x = 0.608281 * safezoneW + safezoneX;
      	y = 0.275 * safezoneH + safezoneY;
      	w = 0.20625 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class shortcall: Life_RscTitle
      {
      	idc = 1005;
        text = "";
      	x = 0.608281 * safezoneW + safezoneX;
      	y = 0.352 * safezoneH + safezoneY;
      	w = 0.20625 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class streifengebiet: Life_RscStructuredText
      {
      	idc = 1101;
        text = "";
      	x = 0.608281 * safezoneW + safezoneX;
      	y = 0.429 * safezoneH + safezoneY;
      	w = 0.20625 * safezoneW;
      	h = 0.11 * safezoneH;
      	colorBackground[] = {-1,-1,-1,0};
      };
      class rangvoLife_Rschlag: Life_RscTitle
      {
      	idc = 1008;
        text = "";
      	x = 0.608281 * safezoneW + safezoneX;
      	y = 0.594 * safezoneH + safezoneY;
      	w = 0.20625 * safezoneW;
      	h = 0.033 * safezoneH;
      };
      class countcops: Life_RscListbox
      {
      	idc = 1010;
        text = "";
      	x = 0.610281 * safezoneW + safezoneX;
      	y = 0.669 * safezoneH + safezoneY;
      	w = 0.20625 * safezoneW;
      	h = 0.133 * safezoneH;
		sizeEx = 0.032;
      };
    };
};
