/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/

class MineFactoryMap
{
	idd = 52559;
	name="MineFactoryMap_a";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_map;";
	saveParams = 1;

	class controlsBackground 
	{
		class Map_View: life_RscMapControl
		{
			idc = 52563;
			x = -0.000306371 * safezoneW + safezoneX;
			y = 0.000408758 * safezoneH + safezoneY;
			w = 0.999583 * safezoneW;
			h = 0.999183 * safezoneH;
		};
	};
	class controls
	{
		class ObenHG: RscText
		{
			idc = -1;
			x = -0.0022187 * safezoneW + safezoneX;
			y = 0.000600117 * safezoneH + safezoneY;
			w = 1.0065 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class ObenHG1: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\Map\maphg1.paa";
			x = -0.00324995 * safezoneW + safezoneX;
			y = 0.000600117 * safezoneH + safezoneY;
			w = 1.00753 * safezoneW;
			h = 0.0374001 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class CivilianPIC: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\civilist.paa";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class PolizeiPIC: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\polizei.paa";
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ArztPIC: RscPicture
		{
			idc = -1;
			text = "MINEFACTORY\textures\arzt.paa";
			x = 0.838249 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CivilistAnzahl: RscText
		{
			idc = 52565;
			text = "0"; //--- ToDo: ;
			x = 0.775343 * safezoneW + safezoneX;
			y = -0.006 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class ArztAnzahl: RscText
		{
			idc = 52566;
			text = "0"; //--- ToDo: ;
			x = 0.855781 * safezoneW + safezoneX;
			y = -0.006 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class PolizeiAnzahl: RscText
		{
			idc = 52567;
			text = "0"; //--- ToDo: ;
			x = 0.814531 * safezoneW + safezoneX;
			y = -0.006 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class ObenText: RscText
		{
			idc = 52564;
			text = ""; //--- ToDo: ;
			x = 0.0100094 * safezoneW + safezoneX;
			y = 0.01081086 * safezoneH + safezoneY;
			w = 0.969666 * safezoneW;
			h = 0.0220084 * safezoneH;
			colorText[] = {1,1,1,0.9};
		};
		class StaedteListe: RscCombo
		{
			idc = 52560;
			x = -0.207409 * safezoneW + safezoneX;
			y = 0.0447039 * safezoneH + safezoneY;
			w = 0.207301 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Wahle hier die Stadt aus."; //--- ToDo: ;
			onLBSelChanged = "[1] spawn life_fnc_map;";
		};
		class ShopListe: RscListbox
		{
			idc = 52561;
			x = -0.20844 * safezoneW + safezoneX;
			y = 0.0667689 * safezoneH + safezoneY;
			w = 0.207275 * safezoneW;
			h = 0.932606 * safezoneH;
			sizeEx = 0.030;
			tooltip = "Wahle hier denn Shop aus."; //--- ToDo: ;
			onLBSelChanged = "[2] spawn life_fnc_map;";
		};
		class Slider: ClickPicture
		{
			idc = 52562;
			text = "MINEFACTORY\textures\Map\arrowR.paa"; //--- ToDo: ;
			x = 0.000894669 * safezoneW + safezoneX;
			y = 0.436199 * safezoneH + safezoneY;
			w = 0.0123746 * safezoneW;
			h = 0.230993 * safezoneH;
			tooltip = "Shops Menu Fader (Aus / An)"; //--- ToDo: ;
			onMouseButtonClick = "[3] spawn life_fnc_map;";
		};
		class PlayerPos: ClickPicture
		{
			idc = -1;
			text = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
			x = 0.888778 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Spieler Position"; //--- ToDo: ;
			onMouseButtonClick = "[4] spawn life_fnc_map;";
		};
		class SchliessenButton: RscButtonMenu
		{
			idc = -1;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.929688 * safezoneW + safezoneX;
			y = 0.00519296 * safezoneH + safezoneY;
			w = 0.06875 * safezoneW;
			h = 0.0329871 * safezoneH;
			colorBackground[] = {0,0,0,0}; colorActive[] = {0,0,0,0}; animTextureDefault = ""; animTextureNormal = ""; animTextureDisabled = ""; animTextureOver = ""; animTextureFocused = "";
			onButtonClick = "closedialog 0;";
		};
	};
};
