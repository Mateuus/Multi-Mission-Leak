class SettingsMenu {
    idd = 2900;
    name = "SettingsMenu";
    movingEnable = 1;
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
        class title_head: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t font='PuristaBold' size='1.5'>Einstellungen</t>"; //--- ToDo: Localize;
        	x = 0.175156 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.044 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class VDonFoot: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='left' font='PuristaBold'>Zu Fuß:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.203 * safezoneH + safezoneY;
        	w = 0.0721875 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class VDinCar: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='left' font='PuristaBold'>Im Auto:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.291 * safezoneH + safezoneY;
        	w = 0.0721875 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class VDinAir: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='left' font='PuristaBold'>In der Luft:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.39 * safezoneH + safezoneY;
        	w = 0.0721875 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class SideChatHeader: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold'>Sidechat An/Aus:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.577 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class RevealNearestHeader: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold'>Nahe Objekte anzeigen:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.632 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class RscStructuredText_1107: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold'>AAN News An/Aus:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.687 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class PlayerTagsHeader: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold'>Playertags An/Aus:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
        class RscStructuredText_1108: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold'>Gras An/Aus:</t>"; //--- ToDo: Localize;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.118594 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls {
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.7475 * safezoneW + safezoneX;
        	y = 0.764 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "closeDialog 0;";
          class Attributes {
            align = "center";
          }
        };
        class VD_onfoot_slider: life_RscXSliderH
        {
          idc = 2901;
          text = "";
          onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
        	x = 0.206094 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.469219 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class VD_onfoot_value: Life_RscEdit
        {
          idc = 2902;
          text = "";
          onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
          onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
        	x = 0.684583 * safezoneW + safezoneX;
        	y = 0.241556 * safezoneH + safezoneY;
        	w = 0.0825 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class VD_incar_slider: life_RscXSliderH
        {
          idc = 2911;
          text = "";
          onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
        	x = 0.206094 * safezoneW + safezoneX;
        	y = 0.324 * safezoneH + safezoneY;
        	w = 0.469219 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class VD_incar_value: Life_RscEdit
        {
          idc = 2912;
          text = "";
          onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
          onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
        	x = 0.685573 * safezoneW + safezoneX;
        	y = 0.329556 * safezoneH + safezoneY;
        	w = 0.0825 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class VD_inair_slider: life_RscXSliderH
        {
          idc = 2921;
          text = "";
          onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
        	x = 0.206094 * safezoneW + safezoneX;
        	y = 0.423 * safezoneH + safezoneY;
        	w = 0.469219 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class VD_inair_value: Life_RscEdit
        {
          idc = 2922;
          text = "";
          onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
          onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
        	x = 0.686979 * safezoneW + safezoneX;
        	y = 0.432408 * safezoneH + safezoneY;
        	w = 0.0825 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class strich: Life_RscText
        {
        	idc = -1;
        	x = 0.185469 * safezoneW + safezoneX;
        	y = 0.4835 * safezoneH + safezoneY;
        	w = 0.629062 * safezoneW;
        	h = 0.0055 * safezoneH;
        	colorBackground[] = {0.753,0.145,0.145,1};
        };
        class PlayerTagsONOFF: Life_Checkbox
        {
          idc = 2970;
          sizeEx = 0.04;
          onCheckedChanged = "['tags',_this select 1] call life_fnc_s_onCheckedChange;";
        	x = 0.309219 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class SideChatONOFF: Life_Checkbox
        {
        	idc = 2971;
          onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
          sizeEx = 0.04;
        	x = 0.309219 * safezoneW + safezoneX;
        	y = 0.577 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class RevealONOFF: Life_Checkbox
        {
        	idc = 2972;
          onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
          sizeEx = 0.04;
        	x = 0.309219 * safezoneW + safezoneX;
        	y = 0.632 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class BroadcastONOFF: Life_Checkbox
        {
        	idc = 2973;
          onCheckedChanged = "['broadcast',_this select 1] call life_fnc_s_onCheckedChange;";
          sizeEx = 0.04;
        	x = 0.309219 * safezoneW + safezoneX;
        	y = 0.687 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.033 * safezoneH;
        };
        class GrasONOFF: Life_Checkbox
        {
        	idc = 2804;
          onCheckedChanged = "['gras',_this select 1] call life_fnc_s_onCheckedChange;";
          sizeEx = 0.04;
        	x = 0.309219 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.020625 * safezoneW;
        	h = 0.033 * safezoneH;
        };
    };
};
