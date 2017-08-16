class KeypadDefuse
{
	idd = 5825;
	movingEnable = 1;
    enableSimulation = 1;
	controlsBackground[] = {};
  	objects[] = {};

	class controls
	{
		class B9: BOMB_RscButton
		{
			idc = -1;
			x = 0.53197 * safezoneW + safezoneX;
			y = 0.5924 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 9; ctrlSetText [1099, (ctrlText 1099) + str 9]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 9; ctrlSetText [1099, (ctrlText 1099) + str 9]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B8: BOMB_RscButton
		{
			idc = -1;
			x = 0.504125 * safezoneW + safezoneX;
			y = 0.5924 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 8; ctrlSetText [1099, (ctrlText 1099) + str 8]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 8; ctrlSetText [1099, (ctrlText 1099) + str 8]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B7: BOMB_RscButton
		{
			idc = -1;
			x = 0.476148 * safezoneW + safezoneX;
			y = 0.592356 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 7; ctrlSetText [1099, (ctrlText 1099) + str 7]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 7; ctrlSetText [1099, (ctrlText 1099) + str 7]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B6: BOMB_RscButton
		{
			idc = -1;
			x = 0.532441 * safezoneW + safezoneX;
			y = 0.64143 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 6; ctrlSetText [1099, (ctrlText 1099) + str 6]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 6; ctrlSetText [1099, (ctrlText 1099) + str 6]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B5: BOMB_RscButton
		{
			idc = -1;
			x = 0.504273 * safezoneW + safezoneX;
			y = 0.643052 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 5; ctrlSetText [1099, (ctrlText 1099) + str 5]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 5; ctrlSetText [1099, (ctrlText 1099) + str 5]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B4: BOMB_RscButton
		{
			idc = -1;
			x = 0.47525 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 4; ctrlSetText [1099, (ctrlText 1099) + str 4]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 4; ctrlSetText [1099, (ctrlText 1099) + str 4]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B3: BOMB_RscButton
		{
			idc = -1;
			x = 0.531963 * safezoneW + safezoneX;
			y = 0.691778 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 3; ctrlSetText [1099, (ctrlText 1099) + str 3]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 3; ctrlSetText [1099, (ctrlText 1099) + str 3]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B2: BOMB_RscButton
		{
			idc = -1;
			x = 0.504752 * safezoneW + safezoneX;
			y = 0.692704 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 2; ctrlSetText [1099, (ctrlText 1099) + str 2]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 2; ctrlSetText [1099, (ctrlText 1099) + str 2]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B1: BOMB_RscButton
		{
			idc = -1;
			x = 0.476095 * safezoneW + safezoneX;
			y = 0.691778 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 1; ctrlSetText [1099, (ctrlText 1099) + str 1]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 1; ctrlSetText [1099, (ctrlText 1099) + str 1]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class B0: BOMB_RscButton
		{
			idc = -1;
			x = 0.504124 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			//onMouseButtonDown = "playSound 'button_click'; CODEINPUT pushBack 0; ctrlSetText [1099, (ctrlText 1099) + str 0]";
			onMouseButtonDown = "playSound 'button_click';if(count CODEINPUT != 10) then {CODEINPUT pushBack 0; ctrlSetText [1099, (ctrlText 1099) + str 0]} else {Hint 'Maximal 10 Zahlen!'};";
		};
		class Benter: BOMB_RscButton
		{
			idc = -1;
			x = 0.532898 * safezoneW + safezoneX;
			y = 0.740504 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			onMouseButtonDown = "[CODE, CODEINPUT] call lhm_fnc_codeCompare; ";
		};
		class Bclear: BOMB_RscButton
		{
			idc = -1;
			x = 0.477313 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0165001 * safezoneW;
			h = 0.022 * safezoneH;
			colorFocused[] = {0.1,0.1,0.1,0.1};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0.5,0.5,0.5,0};
			colorBackground[] = {0.7,0.7,0.7,0};
			colorBackgroundActive[] = {0.1,0.1,0.1,0};
			colorDisabled[] = {1,0,0,1};
			colorBackgroundDisabled[] = {0.5,0.5,0.5,0};
			borderSize = 0.015;
			offsetX = 0.005;
			offsetY = 0.005;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			soundClick[] = {"",0,0};
			onMouseButtonDown = "playSound 'button_click'; CODEINPUT = []; ctrlSetText [1099, """"]";
		};
		class KeypadImage: lhm_RscPicture
		{
			idc = -1;
			moving = 1;
			type = 0;
			style = 0x30;
			x = 0.142156 * safezoneW + safezoneX;
			y = -0.1446 * safezoneH + safezoneY;
			w = 0.721875 * safezoneW;
			h = 1.254 * safezoneH;
			text = "core\textures\misc\explosivePad.paa";
		};
		class NumberDisplay: BOMB_RscStructuredText
		{
			idc = 1099;
			type = 0;
			style = 0x00;
			colorText[] = {0.2,0.4,0,1};
			colorBackground[] = { 1, 1, 1, 0 };
			font = EtelkaNarrowMediumPro;
			sizeEx = 0.072;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.3988 * safezoneH + safezoneY;
			w = 0.136116 * safezoneW;
			h = 0.0418 * safezoneH;
		};
		class Bblue: BOMB_RscButton
		{
			idc = 2003;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,1,1};
			soundClick[] = {"",0,0};
			onMouseButtonDown = "playSound 'button_cutting'; [WIRE,'BLUE'] call lhm_fnc_wireCompare; closeDialog 0";
		};
		class Bwhite: BOMB_RscButton
		{
			idc = 2002;
			x = 0.481437 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,1};
			soundClick[] = {"",0,0};
			onMouseButtonDown = "playSound 'button_cutting'; [WIRE,'WHITE'] call lhm_fnc_wireCompare; closeDialog 0";
		};
		class Byellow: BOMB_RscButton
		{
			idc = 2001;
			x = 0.521656 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,0,1};
			soundClick[] = {"",0,0};
			onMouseButtonDown = "playSound 'button_cutting'; [WIRE,'YELLOW'] call lhm_fnc_wireCompare; closeDialog 0";
		};
		class Bgreen: BOMB_RscButton
		{
			idc = 2000;
			x = 0.558781 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,1,0,1};
			soundClick[] = {"",0,0};
			onMouseButtonDown = "playSound 'button_cutting'; [WIRE,'GREEN'] call lhm_fnc_wireCompare; closeDialog 0";
		};
		class RscStructuredText_1100: BOMB_RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.707797 * safezoneW + safezoneX;
			y = 0.3317 * safezoneH + safezoneY;
			w = 0.290729 * safezoneW;
			h = 0.242222 * safezoneH;
		};
	};
};