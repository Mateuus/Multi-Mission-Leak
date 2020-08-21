/* #Lybijo
$[
	1.063,
	["t",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"",[1,"",["0.381406 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.165 * safezoneW","0.11 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.75],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"",[1,"Killed By:",["0.386562 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"",[1,"Distance:",["0.386562 * safezoneW + safezoneX","0.808 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"",[1,"Respawn In:",["0.386562 * safezoneW + safezoneX","0.852 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[1,"Respawn",["0.546406 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.0721875 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[1,"Request Medic",["0.546407 * safezoneW + safezoneX","0.830348 * safezoneH + safezoneY","0.0721875 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"",[1,"Killed",["0.427812 * safezoneW + safezoneX","0.786 * safezoneH + safezoneY","0.113437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"",[1,"Distance",["0.427812 * safezoneW + safezoneX","0.808 * safezoneH + safezoneY","0.113437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1006,"",[1,"Respawn",["0.438125 * safezoneW + safezoneX","0.852 * safezoneH + safezoneY","0.103125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1007,"",[1,"Weapon:",["0.386562 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.0876563 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1008,"",[1,"Weapon",["0.427812 * safezoneW + safezoneX","0.83 * safezoneH + safezoneY","0.113437 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RscButton
{
	deletable = 0;
	fade = 0;
	
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};
class RscText
{
	deletable = 0;
	fade = 0;
	
	type = 0;
	idc = -1;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
};

class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground
	{
	};
	
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			font = "PuristaLight";
			text = "Zabojca"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			font = "PuristaLight";
			text = "Medyk:"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "Bron:"; //--- ToDo: Localize;
			font = "PuristaLight";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			font = "PuristaLight";
			text = "Odrodzenie:"; //--- ToDo: Localize;
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class RscButton_1600: RscButton
		{
			idc = 7302;
			font = "PuristaLight";
			text = "Odrodz"; //--- ToDo: Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "closeDialog 0; life_respawned = true; [] call life_fnc_spawnMenu;";
			class Attributes 
			{
				align = "center";
			};
		};

		class RscButton_1601: RscButton
		{
			idc = 7303;
			font = "PuristaLight";
			text = "Wezwij Med."; //--- ToDo: Localize;
			x = 0.546407 * safezoneW + safezoneX;
			y = 0.830348 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[] call life_fnc_requestMedic;";
			class Attributes 
			{
				align = "center";
			};
		};

		class RscText_1001: RscText
		{
			idc = 7310;
			font = "PuristaLight";
			text = ""; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		}; //Killed by

		class RscText_1005: RscText
		{
			idc = 7305;
			font = "PuristaLight";
			text = ""; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		}; //Distance
		
		class RscText_1006: RscText
		{
			idc = 7301;
			font = "PuristaLight";
			text = ""; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.852 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};//Timer

		class RscText_1008: RscText
		{
			idc = 7313;
			font = "PuristaLight";
			text = ""; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
		};//Weapon
	};
};