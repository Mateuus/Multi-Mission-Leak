class Life_cell_phone {
    idd = 3000;
    name= "life_cell_phone";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn life_fnc_cellphone";

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
        class title_header: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Telefonsystem // Nachrichtensystem</t>"; //--- ToDo: Localize;
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class old_text: Life_RscTitle
        {
        	idc = 1002;
        	text = "Nachrichtenverlauf"; //--- ToDo: Localize;
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.346 * safezoneH + safezoneY;
        	w = 0.175313 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class title_msgvor: Life_RscTitle
        {
        	idc = -1;
        	text = "Nachricht:"; //--- ToDo: Localize;
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.555 * safezoneH + safezoneY;
        	w = 0.175313 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class strich: Life_RscText
        {
        	idc = -1;
        	x = 0.360781 * safezoneW + safezoneX;
        	y = 0.3295 * safezoneH + safezoneY;
        	w = 0.448594 * safezoneW;
        	h = 0.0055 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,1};
        };
        class title_pos: Life_RscText
        {
        	idc = -1;
        	text = "Position mitsenden:"; //--- ToDo: Localize;
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.269 * safezoneH + safezoneY;
        	w = 0.0973437 * safezoneW;
        	h = 0.022 * safezoneH;
        };
    };

    class controls {
        class edit_search: Life_RscEdit
        {
        	idc = 1401;
        	text = ""; //--- ToDo: Localize;
			onKeyUp = "if(ctrlText 1401 != """") then {[] call ESG_fnc_suchetelefon;} else { [] call life_fnc_cellphone;}";
			tooltip = "Spieler suchen";
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class players: Life_RscListbox
        {
        	idc = 3004;
        	x = 0.180312 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.170156 * safezoneW;
        	h = 0.539 * safezoneH;
          sizeEx = 0.035;
        };
        class edit_msg: Life_RscEdit
        {
        	idc = 3003;
			text = "";
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.448594 * safezoneW;
        	h = 0.033 * safezoneH;
			tooltip = "Nachricht eingeben";
        };
        class pos_check: Life_Checkbox
        {
        	idc = 2800;
        	x = 0.460156 * safezoneW + safezoneX;
        	y = 0.269926 * safezoneH + safezoneY;
        	w = 0.0154688 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class btn_send: Life_RscButtonMenu
        {
        	idc = 2400;
        	text = "Nachricht senden"; //--- ToDo: Localize;
        	x = 0.659844 * safezoneW + safezoneX;
        	y = 0.258 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "[] call ESG_fnc_telefonswitch";
          class Attributes {
              align = "center";
          };
        };
        class lb_msgold: Life_RscListbox
        {
        	idc = 1501;
        	x = 0.371094 * safezoneW + safezoneX;
        	y = 0.379 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.143 * safezoneH;
          sizeEx = 0.035;
    			onLBSelChanged = "[0] call ESG_fnc_oldmsg";
        };
        class btn_delete: Life_RscButtonMenu
        {
        	idc = 2401;
        	text = "Löschen"; //--- ToDo: Localize;
        	x = 0.654688 * safezoneW + safezoneX;
        	y = 0.379 * safezoneH + safezoneY;
        	w = 0.0928125 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,1};
          onButtonClick = "[1] call ESG_fnc_oldmsg";
          class Attributes {
              align = "center";
          };
        };
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.7475 * safezoneW + safezoneX;
        	y = 0.764 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          onButtonClick = "closedialog 0;";
          class Attributes {
              align = "center";
          };
        };
        class structuredtext: Life_RscControlsGroup
        {
        	idc = 2300;
        	x = 0.371094 * safezoneW + safezoneX;
        	y = 0.588 * safezoneH + safezoneY;
        	w = 0.273281 * safezoneW;
        	h = 0.198 * safezoneH;
        	class Controls
        	{
					class struc_oldmsg: Life_RscStructuredText
    				{
    					idc = 1100;
    					x = 0 * safezoneW + safezoneX;
    					y = 0 * safezoneH + safezoneY;
    					w = 0.25781 * safezoneW;
    					h = 0.154 * safezoneH;
    					colorBackground[] = {-1,-1,-1,-1};
    				};
        	};
        };
    };
};
