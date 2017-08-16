	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 10e10;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class fondIcon : life_RscPicture 
			{
				idc = -1;
				text = "images\ANL\anl_fond_ui.paa";
				x = safeZoneX+safeZoneW-0.2;
				y = safeZoneY+safeZoneH-0.58;
				w = 0.21; h = 0.31;
			};

			class watermark : life_RscPicture
            {
                idc = -1;
                text = "images\ANL\anl_logo.paa";
                x = 0.86 * safezoneW + safezoneX;
                y = 0.83 * safezoneH + safezoneY;
                w = 0.12 * safezoneW;
                h = 0.175 * safezoneH;
 				//w = 0.25; h = 0.31;    
            };
		};
		
		class controls
		{
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
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
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
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
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
			};
			
			class batterytext              
			{
				type=0;
				idc=23520;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
			};
			
			class moneytext
			{
				type=0;
				idc=23525;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
			};
			
			class drunktext
			{
				type=0;
				idc=23530;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=1;
				text="";
			};
 	};
};	