	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{

			class HealthBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.32;
				y = safeZoneY+safeZoneH-0.17;
				w = 0.30;
				h = 0.04;
			};

			class ThirstBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.32;
				y = safeZoneY+safeZoneH-0.125;
				w = 0.30;
				h = 0.04;
			};

			class HungerBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.32;
				y = safeZoneY+safeZoneH-0.08;
				w = 0.30;
				h = 0.04;
			};
	
			class logo : life_RscPicture {
           
                idc = -1;
                text = "icons\watermark.paa";
                x = safeZoneX+safeZoneW-0.28; y = safeZoneY+safeZoneH-0.505;
                w = 0.243; h = 0.35235;
               
            };
		};
		
		class controls
		{
			
			class foodbar : Life_RscProgress
			{				
				idc = 23501;
				x = safeZoneX+safeZoneW-0.317;
				y = safeZoneY+safeZoneH-0.077;
				w=0.293;
				h=0.032;
				colorBar[] = {0,1,0.25,0.25};
				text="";
			};
			
			class hungerTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.318;
				y = safeZoneY+safeZoneH-0.088;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Hunger";
			};
			
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class waterbar : Life_RscProgress
			{
				idc = 23511;
				x = safeZoneX+safeZoneW-0.317;
				y = safeZoneY+safeZoneH-0.1208;
				w=0.293;
				h=0.032;
				colorBar[] = {0,0.5,1,0.25};
				text="";
			};
			
			class thirstTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.318;
				y = safeZoneY+safeZoneH-0.132;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Durst";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthbar : Life_RscProgress
			{
				idc = 23516;
				x = safeZoneX+safeZoneW-0.317;
				y = safeZoneY+safeZoneH-0.1665;
				w=0.293;
				h=0.032;
				colorBar[] = {1,0,0,0.25};
				text="";
			};
			
			class healthTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.318;
				y = safeZoneY+safeZoneH-0.177;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Leben";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.025;
				size=1;
				font="PuristaLight";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
		};   
 	};