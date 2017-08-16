#define INFINITE 999999999999999999999999999999

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
		// LHM START
			class LHM_HPRegBuffHIcon : lhm_RscPicture
			{

				idc = 23600;
				text = "core\textures\hud\Buff_HpReg.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.70;
				w = 0.04; h = 0.05;
			};

			class LHM_AdrenBuffHIcon : lhm_RscPicture
			{

				idc = 23601;
				text = "core\textures\hud\Buff_Adren.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.64;
				w = 0.04; h = 0.05;
			};

			class LHM_SoylentGreenHIcon : lhm_RscPicture
			{

				idc = 23602;
				text = "core\textures\hud\Buff_SoylentGreen.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.76;
				w = 0.04; h = 0.05;
			};

			class LHM_fpsH : lhm_RscPicture
			{

				idc = 23603;
				text = "core\textures\hud\fps.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.85;
				w = 0.04; h = 0.05;
			};

			class LHM_ServertimeH : lhm_RscPicture
			{

				idc = 23604;
				text = "core\textures\hud\serveruptime.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.915;
				w = 0.04; h = 0.05;
			};
		// LHM END
			class foodHIcon : lhm_RscPicture
			{

				idc = -1;
				text = "core\textures\hud\food.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.50;
				w = 0.04; h = 0.05;
			};

			class waterHIcon : lhm_RscPicture
			{

				idc = -1;
				text = "core\textures\hud\water.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.43;
				w = 0.04; h = 0.06;
			};

			class healthHIcon : lhm_RscPicture
			{

				idc = -1;
				text = "core\textures\hud\health.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.35;
				w = 0.04; h = 0.06;
			};

			class staminaIcon : lhm_RscPicture
			{

				idc = -1;
				text = "core\textures\hud\stamina.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.28;
				w = 0.04; h = 0.06;
			};

			class earplugIcon : lhm_RscPicture
			{

				idc = 23609;
				text = "core\textures\hud\earPlug.paa";
				x = safeZoneX+safeZoneW-0.08; y = safeZoneY+safeZoneH-1.05;
				w = 0.04; h = 0.06;
			};
			
			
			class diseaseIcon : lhm_RscPicture
			{

				idc = 23610;
				text = "core\textures\hud\disease.paa";
				x = safeZoneX+safeZoneW-0.08; y = safeZoneY+safeZoneH-1.18;
				w = 0.04; h = 0.06;
			};

			class cashIcon : lhm_RscPicture
			{

				idc = -1;
				text = "core\textures\hud\dollar.paa";
				x = safeZoneX+safeZoneW-0.15; y = safeZoneY+safeZoneH-0.15;
				w = 0.03; h = 0.04;
			};

		};

		class controls
		{
	// LHM START
			class LHM_PurgePic : lhm_RscPicture
			{
				idc = 23605;
				text = "core\textures\hud\purge.paa";
				x = safeZoneX+safeZoneW*0.5; y = safeZoneY+0.15;
				w = 0.5; h = 0.16;
			};

			class hpregtext
			{
				type=0;
				idc=23650;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class adrentext
			{
				type=0;
				idc=23651;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class SoylentGreentext
			{
				type=0;
				idc=23652;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class clientFPSText
			{
				type=0;
				idc=23653;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class serverUptimeText
			{
				type=0;
				idc=23654;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class PurgeText
			{
				type=0;
				idc=23655;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1.1;
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 0 , 0 , 0.8 };
				shadow=true;
				text="";
			};

		// LHM END
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
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
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
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
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
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class staminatext
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
				font="TahomaB";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};

			class cashtext
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
				font="PuristaSemiBold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
		};
 	};

class lhm_clock
{
	idd=-1;
	movingEnable=0;
	fadein=0.5;
	duration = INFINITE;
	fadeout=0.5;
	name="lhm_clock";
	onLoad="uiNamespace setVariable ['lhm_clock',_this select 0]; [] call lhm_fnc_hudUpdate;";
	onUnload = "uiNamespace setVariable ['lhm_clock',displayNull];";
	objects[]={};
	movingEnabled = false;
	enableSimulation = true;

	class controlsBackground
	{
		class Clock: lhm_RscStructuredText
		{
			idc = 1110;
			text = "";

			x = 0.00487602 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.990248 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};

	class controls
	{

	};
};