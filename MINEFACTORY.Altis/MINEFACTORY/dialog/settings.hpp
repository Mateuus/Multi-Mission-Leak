/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/


class SettingsMenu {
	idd = 2900;
	name = "SettingsMenu";
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "[0] spawn life_fnc_einstellungen;";
	
	class controlsBackground {
	
		class Settings_HG: RscText
		{
			idc = 1000;
			x = 0.265104 * safezoneW + safezoneX;
			y = 0.214111 * safezoneH + safezoneY;
			w = 0.486979 * safezoneW;
			h = 0.439828 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Settings_ObenText: RscText
		{
			idc = 1001;
			text = "Einstellungen - Objecte - FPS Verbesserungen"; //--- ToDo: ;
			x = 0.43125 * safezoneW + safezoneX;
			y = 0.214111 * safezoneH + safezoneY;
			w = 0.318812 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class zufusstexttitel: RscText
		{
			idc = 1008;
			text = "Zu Fuss"; //--- ToDo: ;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class inderlufttitel: RscText
		{
			idc = 1009;
			text = "In der luft"; //--- ToDo: ;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.379047 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class imautotitel: RscText
		{
			idc = 1010;
			text = "im Auto"; //--- ToDo: ;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.467013 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
	};
	
	class controls {

		class Settings_SchliessenBTN: RscButtonMenu
		{
			onButtonClick = "closeDialog 0;";
			idc = 2402;
			text = "Schliessen"; //--- ToDo: ;
			x = 0.276563 * safezoneW + safezoneX;
			y = 0.587966 * safezoneH + safezoneY;
			w = 0.0928563 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class zufussslider: life_RscXSliderH
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class inderluftslider: life_RscXSliderH
		{
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			idc = 2921;
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.42303 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class imautoslider: life_RscXSliderH
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			x = 0.282292 * safezoneW + safezoneX;
			y = 0.510996 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class zufussedit: RscEdit
		{
			idc = 2902;
			text = "";
			onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
			x = 0.700521 * safezoneW + safezoneX;
			y = 0.313073 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class inderluftedit: RscEdit
		{
			onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
			idc = 2922;
			text = "";
			x = 0.700521 * safezoneW + safezoneX;
			y = 0.412034 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
		class imautoedit: RscEdit
		{
			idc = 2912;
			text = "";
			onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
			onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
			x = 0.700521 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0401042 * safezoneW;
			h = 0.0439828 * safezoneH;
		};
	};
};