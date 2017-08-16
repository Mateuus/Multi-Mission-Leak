class Life_anlid_civ{
	name= "life_anlid_civ";	
	idd = 50000;
	movingenable = 1;
	enableSimulation = 1;
	class ControlsBackground
	{
		class Mainbackground: Life_RscPicture
		{
			idc = 50001;
			text = "images\civ\anlid_civil.paa";
			x = 0.236458 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.509167 * safezoneW;
			h = 0.703726 * safezoneH;
			moving = 1;
		};
	};
	class Controls
	{
		class numero: Life_RscText
		{
			idc = 50002;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			sizeEx = 0.02;
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.477 * safezoneW + safezoneX;
			y = 0.337 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class nom: Life_RscText
		{
			idc = 50003;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.468 * safezoneW + safezoneX;
			y = 0.362 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class groupe: Life_RscText
		{
			idc = 50004;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			shadow = 0;
			sizeEx = 0.03;
			colorText[] = {0, 0, 0, 1};
			x = 0.475 * safezoneW + safezoneX;
			y = 0.388 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class signe: Life_RscText
		{
			idc = 50005;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.03;			
			font = "EtelkaNarrowMediumPro";	
			x = 0.50 * safezoneW + safezoneX;
			y = 0.442 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};			
		class age: Life_RscText
		{
			idc = 50006;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.03;			
			font = "EtelkaNarrowMediumPro";	
			x = 0.582 * safezoneW + safezoneX;
			y = 0.4125 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class lieu: Life_RscText
		{
			idc = 50007;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.03;			
			font = "EtelkaNarrowMediumPro";	
			x = 0.51 * safezoneW + safezoneX;
			y = 0.4125 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};

		class close: Life_RscButtonMenu 
		{
			idc = 50008;
			text = "X";
			colorText[] = {0, 0, 0, 1};
			x = 0.63 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.020 * safezoneW;
			h = 0.025 * safezoneH;
			action = "closeDialog 0";
		};
	};
};

class Life_anlid_cop{
	name= "life_anlid_cop";	
	idd = 60000;
	movingenable = 1;
	enableSimulation = 1;	
	class ControlsBackground
	{
		class Mainbackground: Life_RscPicture
		{
			idc = 60001;
			text = "images\flic\anlid_cop.paa";
			x = 0.236458 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.509167 * safezoneW;
			h = 0.703726 * safezoneH;
			moving = 1;
		};
	};
	class Controls
	{
		class numero: Life_RscText
		{
			idc = 60002;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			sizeEx = 0.02;
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.447 * safezoneW + safezoneX;
			y = 0.3385 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class nom: Life_RscText
		{
			idc = 60003;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.455 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.023 * safezoneH;
		};
		class groupe: Life_RscText
		{
			idc = 60004;
			text = "INCONNU";
			shadow = 0;
			colorText[] = {1, 1, 1, 1};
			x = 0.47 * safezoneW + safezoneX;
			y = 0.413 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class signe: Life_RscText
		{
			idc = 60005;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;			
			sizeEx = 0.03;
			font = "EtelkaNarrowMediumPro";	
			x = 0.49 * safezoneW + safezoneX;
			y = 0.4925 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};			
		class age: Life_RscText
		{
			idc = 60006;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.03;			
			font = "EtelkaNarrowMediumPro";	
			x = 0.564 * safezoneW + safezoneX;
			y = 0.4685 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class lieu: Life_RscText
		{
			idc = 60007;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.03;
			font = "EtelkaNarrowMediumPro";	
			x = 0.495 * safezoneW + safezoneX;
			y = 0.4688 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};

		class close: Life_RscButtonMenu 
		{
			idc = 60008;
			text = "X";
			colorText[] = {0, 0, 0, 1};
			x = 0.63 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.020 * safezoneW;
			h = 0.025 * safezoneH;
			action = "closeDialog 0";
		};
	};
};

class Life_anlid_med{
	name= "life_anlid_med";	
	idd = 70000;
	movingenable = 1;
	enableSimulation = 1;	
	class ControlsBackground
	{
		class Mainbackground: Life_RscPicture
		{
			idc = 70001;
			text = "images\med\anlid_med.paa";
			x = 0.236458 * safezoneW + safezoneX;
			y = 0.225107 * safezoneH + safezoneY;
			w = 0.509167 * safezoneW;
			h = 0.703726 * safezoneH;
			moving = 1;
		};
	};
	class Controls
	{
		class numero: Life_RscText
		{
			idc = 70002;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			sizeEx = 0.02;
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.48 * safezoneW + safezoneX;
			y = 0.337 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class nom: Life_RscText
		{
			idc = 70003;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.468 * safezoneW + safezoneX;
			y = 0.355 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class groupe: Life_RscText
		{
			idc = 70004;
			text = "INCONNU";
			font = "EtelkaNarrowMediumPro";	
			shadow = 0;
			colorText[] = {0, 0, 0, 1};
			x = 0.465 * safezoneW + safezoneX;
			y = 0.386 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};	
		class signe: Life_RscText
		{
			idc = 70005;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.05;
			font = "EtelkaNarrowMediumPro";	
			x = 0.505 * safezoneW + safezoneX;
			y = 0.440 * safezoneH + safezoneY;
			w = 0.2872083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};			
		class age: Life_RscText
		{
			idc = 70006;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.05;
			font = "EtelkaNarrowMediumPro";	
			x = 0.592 * safezoneW + safezoneX;
			y = 0.40 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
		class lieu: Life_RscText
		{
			idc = 70007;
			text = "INCONNU";
			colorText[] = {0, 0, 0, 1};
			shadow = 0;
			sizeEx = 0.05;
			font = "EtelkaNarrowMediumPro";	
			x = 0.54 * safezoneW + safezoneX;
			y = 0.40 * safezoneH + safezoneY;
			w = 0.2992083 * safezoneW;
			h = 0.0219914 * safezoneH;
		};

		class close: Life_RscButtonMenu 
		{
			idc = 70008;
			text = "X";
			x = 0.63 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.020 * safezoneW;
			h = 0.025 * safezoneH;
			action = "closeDialog 0";
		};
	};
};