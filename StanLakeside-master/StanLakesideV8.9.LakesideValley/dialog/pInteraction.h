#define BGX 0.15
#define BGY 0.65
#define BGW 0.82

class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	

	class controlsBackground
	{

		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			x = BGX - 0.3;
			y = BGY + 0.7;
			w = BGW;
			h = 0.45 - (22 / 250);
		};
		class TargetName : life_RscText
		{
			idc = 37000;
			text = "";
			sizeEx = 0.035;
			style = 2;
			colorBackground[] = {0,0,0,0.9};
			x = BGX + 0.23;
			y = BGY + 0.025;
			w = 0.22;
			h = 0.04;
		};
	};
	
	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = BGX + 0;
			y = BGY + 0.025;
			w = 0.1;
			h = 0.04;
		};


		
				
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};
	


		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};

		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.00;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};

		class ButtonEight : life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonNine : life_RscButtonMenu
		{
			idc = 37458;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonTen : life_RscButtonMenu
		{
			idc = 37459;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonEleven : life_RscButtonMenu
		{
			idc = 37460;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonTwelve : life_RscButtonMenu
		{
			idc = 37461;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonThirteen : life_RscButtonMenu
		{
			idc = 37462;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};
	
		class ButtonFourteen : life_RscButtonMenu
		{
			idc = 37463;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonFifteen : life_RscButtonMenu
		{
			idc = 37464;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};

		
		class ButtonSixteen : life_RscButtonMenu
		{
			idc = 37465;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonSeventeen : life_RscButtonMenu
		{
			idc = 37466;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonEighteen : life_RscButtonMenu
		{
			idc = 37467;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		class ButtonNineteen : life_RscButtonMenu
		{
			idc = 37468;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};

		class ButtonTwenty : life_RscButtonMenu
		{
			idc = 37469;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonTwentyOne : life_RscButtonMenu
		{
			idc = 37470;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};

	};
};

class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	

	class controlsBackground
	{

		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			x = BGX - 0.3;
			y = BGY + 0.7;
			w = BGW;
			h = 0.45 - (22 / 250);
		};
	};
	
	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = BGX + 0;
			y = BGY + 0.025;
			w = 0.1;
			h = 0.04;
		};


		
				
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};
	


		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37451;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 37452;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.07;
			w = 0.22;
			h = 0.04;
		};

		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 37453;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.00;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 37454;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 37455;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.11;
			w = 0.22;
			h = 0.04;
		};
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 37456;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};

		class ButtonEight : life_RscButtonMenu
		{
			idc = 37457;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonNine : life_RscButtonMenu
		{
			idc = 37458;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.15;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonTen : life_RscButtonMenu
		{
			idc = 37459;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonEleven : life_RscButtonMenu
		{
			idc = 37460;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonTwelve : life_RscButtonMenu
		{
			idc = 37461;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.19;
			w = 0.22;
			h = 0.04;
		};

		class ButtonThirteen : life_RscButtonMenu
		{
			idc = 37462;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};
	
		class ButtonFourteen : life_RscButtonMenu
		{
			idc = 37463;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonFifteen : life_RscButtonMenu
		{
			idc = 37464;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.23;
			w = 0.22;
			h = 0.04;
		};

		
		class ButtonSixteen : life_RscButtonMenu
		{
			idc = 37465;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonSeventeen : life_RscButtonMenu
		{
			idc = 37466;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonEighteen : life_RscButtonMenu
		{
			idc = 37467;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.27;
			w = 0.22;
			h = 0.04;
		};
		class ButtonNineteen : life_RscButtonMenu
		{
			idc = 37468;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.0;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};

		class ButtonTwenty : life_RscButtonMenu
		{
			idc = 37469;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.23;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};
		
		class ButtonTwentyOne : life_RscButtonMenu
		{
			idc = 37470;
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.46;
			y = BGY + 0.31;
			w = 0.22;
			h = 0.04;
		};

	};
};