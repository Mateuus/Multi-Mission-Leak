class lottoMain
{
	idd = 52500;
	name = "lottoMain";
	movingEnabled = true;
	enableSimulation = true;

	class controlsBackground
	{
		class backgroundMain: DWEV_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0.933,0.925,0.906,1)";
			x = 0.075;
			y = 0.08;
			w = 0.849053;
			h = 0.823586;
		};
		class LogoHorizont: DWEV_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,0.91,0.012,1)";
			x = 0.129735;
			y = 0.0898994;
			w = 0.784469;
			h = 0.090101;
		};
		class LogoVertikal: DWEV_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,0.91,0.012,1)";
			x = 0.0827652;
			y = 0.0898989;
			w = 0.0412879;
			h = 0.800202;
		};
		class bNummernrot: DWEV_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,0.349,0.349,1)";
			x = 0.130303;
			y = 0.191717;
			w = 0.526098;
			h = 0.698939;
		};
		class bLaufzeitrot: bNummernrot
		{
			idc = -1;
			x = 0.674053;
			y = 0.193687;
			w = 0.240909;
			h = 0.206313;
		};
		class bPreisrot: bNummernrot
		{
			idc = -1;
			x = 0.675189;
			y = 0.827021;
			w = 0.238447;
			h = 0.0625253;
		};
		class bZiehungrot: bNummernrot
		{
			idc = -1;
			x = 0.675;
			y = 0.42;
			w = 0.239962;
			h = 0.175354;
		};
		class bScheinnummerrot: bNummernrot
		{
			idc = 1208;
			x = 0.675;
			y = 0.68;
			w = 0.238447;
			h = 0.0625253;
		};

		class bLaufzeitpink: DWEV_RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,0.827,0.827,1)";
			x = 0.680303;
			y = 0.201061;
			w = 0.228409;
			h = 0.191768;
		};
		class bZiehungpink: bLaufzeitpink
		{
			idc = -1;
			x = 0.680871;
			y = 0.42803;
			w = 0.228409;
			h = 0.160202;
		};
	};

	class controls
	{
		class Scheinnummer: DWEV_RscText
		{
			idc = 52531;
			text = "************";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {0,0,0,0};
			colorShadow[] = {0,0,0,1};
			shadow = 2;
			style = 0x02;
			x = 0.675;
			y = 0.62;
			w = 0.2375;
			h = 0.06;
		};

		class LottoscheinTitel: DWEV_RscText
		{
			idc = -1;
			text = "Lotterie Woelfchen & Grillgut";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {0,0,0,0};
			colorShadow[] = {0,0,0,1};
			shadow = 2;
			style = 0x02;
			x = 0.15;
			y = 0.09;
			w = 0.8;
			h = 0.06;
		}
		class LottoscheinJackpot: DWEV_RscText
		{
			idc = 52534;
			text = "Jackpot: 000.000.000 €";
			colorText[] = {0,0,0,0.5};
			colorBackground[] = {0,0,0,0};
			colorShadow[] = {0,0,0,1};
			shadow = 2;
			style = 0x02;
			x = 0.15;
			y = 0.125;
			w = 0.8;
			h = 0.06;
		}

		
		class Preis: Scheinnummer
		{
			idc = 52532;
			y = 0.767021;
			w = 0.2375;
			h = 0.06;
		};
		class bn1: DWEV_RscButtonSilent
		{
			idc = 525010;
			action = "";
			sizeEX = 0.15;
			shadow = 0;
			x = 0.1375;
			y = 0.2;
			w = 0.1;
			h = 0.1333;
		};
		class bn2: bn1
		{
			idc = 525020;
			x = 0.24;
			y = 0.2;
		};
		class bn3: bn1
		{
			idc = 525030;
			x = 0.3425;
			y = 0.2;
		};
		class bn4: bn1
		{
			idc = 525040;
			x = 0.445;
			y = 0.2;
		};
		class bn5: bn1
		{
			idc = 525050;
			x = 0.5475;
			y = 0.2;
		};
		class bn6: bn1
		{
			idc = 525060;
			x = 0.1375;
			y = 0.3366;
		};
		class bn7: bn1
		{
			idc = 525070;
			x = 0.24;
			y = 0.3366;
		};
		class bn8: bn1
		{
			idc = 525080;
			x = 0.3425;
			y = 0.3366;
		};
		class bn9: bn1
		{
			idc = 525090;
			x = 0.445;
			y = 0.3366;
		};
		class bn10: bn1
		{
			idc = 525100;
			x = 0.5475;
			y = 0.3366;
		};
		class bn11: bn1
		{
			idc = 525110;
			x = 0.1375;
			y = 0.4732;
		};
		class bn12: bn1
		{
			idc = 525120;
			x = 0.24;
			y = 0.4732;
		};
		class bn13: bn1
		{
			idc = 525130;
			x = 0.3425;
			y = 0.4732;
		};
		class bn14: bn1
		{
			idc = 525140;
			x = 0.445;
			y = 0.4732;
		};
		class bn15: bn1
		{
			idc = 525150;
			x = 0.5475;
			y = 0.4732;
		};
		class bn16: bn1
		{
			idc = 525160;
			x = 0.1375;
			y = 0.6098;
		};
		class bn17: bn1
		{
			idc = 525170;
			x = 0.24;
			y = 0.6098;
		};
		class bn18: bn1
		{
			idc = 525180;
			x = 0.3425;
			y = 0.6098;
		};
		class bn19: bn1
		{
			idc = 525190;
			x = 0.445;
			y = 0.6098;
		};
		class bn20: bn1
		{
			idc = 525200;
			x = 0.5475;
			y = 0.6098;
		};
		class bn21: bn1
		{
			idc = 525210;
			x = 0.1375;
			y = 0.7464;
		};
		class bn22: bn1
		{
			idc = 525220;
			x = 0.24;
			y = 0.7464;
		};
		class bn23: bn1
		{
			idc = 525230;
			x = 0.3425;
			y = 0.7464;
		};
		class bn24: bn1
		{
			idc = 525240;
			x = 0.445;
			y = 0.7464;
		};
		class bn25: bn1
		{
			idc = 525250;
			x = 0.5475;
			y = 0.7464;
		};
		class n1: DWEV_RscText
		{
			idc = 52501;
			text = "1";
			colorText[] = {1,0.349,0.349,1};
			colorBackground[] = {1,0.827,0.827,1};
			style = 0x02;
			sizeEX = 0.15;
			shadow = 0;
			x = 0.1375;
			y = 0.2;
			w = 0.1;
			h = 0.1333;
		};
		class n2: n1
		{
			idc = 52502;
			text = "2";
			x = 0.24;
			y = 0.2;
		};
		class n3: n1
		{
			idc = 52503;
			text = "3";
			x = 0.3425;
			y = 0.2;
		};
		class n4: n1
		{
			idc = 52504;
			text = "4";
			x = 0.445;
			y = 0.2;
		};
		class n5: n1
		{
			idc = 52505;
			text = "5";
			x = 0.5475;
			y = 0.2;
		};
		class n6: n1
		{
			idc = 52506;
			text = "6";
			x = 0.1375;
			y = 0.3366;
		};
		class n7: n1
		{
			idc = 52507;
			text = "7";
			x = 0.24;
			y = 0.3366;
		};
		class n8: n1
		{
			idc = 52508;
			text = "8";
			x = 0.3425;
			y = 0.3366;
		};
		class n9: n1
		{
			idc = 52509;
			text = "9";
			x = 0.445;
			y = 0.3366;
		};
		class n10: n1
		{
			idc = 52510;
			text = "10";
			x = 0.5475;
			y = 0.3366;
		};
		class n11: n1
		{
			idc = 52511;
			text = "11";
			x = 0.1375;
			y = 0.4732;
		};
		class n12: n1
		{
			idc = 52512;
			text = "12";
			x = 0.24;
			y = 0.4732;
		};
		class n13: n1
		{
			idc = 52513;
			text = "13";
			x = 0.3425;
			y = 0.4732;
		};
		class n14: n1
		{
			idc = 52514;
			text = "14";
			x = 0.445;
			y = 0.4732;
		};
		class n15: n1
		{
			idc = 52515;
			text = "15";
			x = 0.5475;
			y = 0.4732;
		};
		class n16: n1
		{
			idc = 52516;
			text = "16";
			x = 0.1375;
			y = 0.6098;
		};
		class n17: n1
		{
			idc = 52517;
			text = "17";
			x = 0.24;
			y = 0.6098;
		};
		class n18: n1
		{
			idc = 52518;
			text = "18";
			x = 0.3425;
			y = 0.6098;
		};
		class n19: n1
		{
			idc = 52519;
			text = "19";
			x = 0.445;
			y = 0.6098;
		};
		class n20: n1
		{
			idc = 52520;
			text = "20";
			x = 0.5475;
			y = 0.6098;
		};
		class n21: n1
		{
			idc = 52521;
			text = "21";
			x = 0.1375;
			y = 0.7464;
		};
		class n22: n1
		{
			idc = 52522;
			text = "22";
			x = 0.24;
			y = 0.7464;
		};
		class n23: n1
		{
			idc = 52523;
			text = "23";
			x = 0.3425;
			y = 0.7464;
		};
		class n24: n1
		{
			idc = 52524;
			text = "24";
			x = 0.445;
			y = 0.7464;
		};
		class n25: n1
		{
			idc = 52525;
			text = "25";
			x = 0.5475;
			y = 0.7464;
		};
		class Scheinnummerpink: DWEV_RscText
		{
			idc = -1;
			text = "Scheinnummer";
			colorText[] = {1,0.349,0.349,1};
			colorBackground[] = {1,0.827,0.827,1};
			style = 0x02;
			sizeEX = 0.048;
			shadow = 0;
			x = 0.679735;
			y = 0.686717;
			w = 0.229356;
			h = 0.049091;
		};
		class Preispink: Scheinnummerpink
		{
			idc = -1;
			text = "Preis";
			x = 0.679546;
			y = 0.834899;
			w = 0.229356;
			h = 0.049091;
		};

		class Laufzeitpink: Scheinnummerpink
		{
			idc = -1;
			text = "Laufzeit";
			x = 0.680303;
			y = 0.201061;
			w = 0.228409;
			h = 0.06;
		};
		class Ziehungpink: Scheinnummerpink
		{
			idc = -1;
			text = "Ziehung";
			x = 0.680871;
			y = 0.42803;
			w = 0.228409;
			h = 0.06;
		};
		class CheckText1: Scheinnummerpink
		{
			idc = -1;
			text = "1 Tag";
			sizeEX = 0.04;
			x = 0.680871;
			y = 0.2595;
			w = 0.228409;
			h = 0.04;
		};
		class CheckText2: CheckText1
		{
			idc = -1;
			text = "2 Tage";
			y = 0.2995;
		};
		class CheckText3: DWEV_RscText
		{
			idc = 52534;
			text = "Tag";
			colorText[] = {1,0.349,0.349,1};
			colorBackground[] = {1,0.827,0.827,1};
			style = 0x02;
			sizeEX = 0.04;
			shadow = 0;
			x = 0.720871;
			y = 0.3395;
			w = 0.188409;
			h = 0.04;
		};
		class CheckText4: CheckText1
		{
			idc = -1;
			text = "Mo. bis Fr.";
			y = 0.4995;
		};

		class laufzeitEdit : DWEV_RscEdit
		{
			idc = 52533;
			text = "1";
			colorBackground[] = {1,0.827,0.827,1};
			colorText[] = {1,0.349,0.349,1};
			colorDisabled[] = {1,0.349,0.349,1};
			style = 0x02;
			shadow = 0;
			x = 0.7375;
			y = 0.3395;
			w = 0.05;
			h = 0.04;
			onKeyDown = "_this call DWEV_fnc_lottoEdit";
		};

		class CheckText5: CheckText1
		{
			idc = -1;
			text = "Samstags";
			y = 0.5395;
		};
		class Schliessen: DWEV_RscButtonMenu
		{
			idc = -1;
			text = "Schließen";
			action = "closeDialog 0;";
			class Attributes
			{
				align = "center";
			};
			size = 0.058;
			x = 0.075;
			y = 0.92;
			w = 0.25;
			h = 0.06;
		};
		class Bezahlen : Schliessen
		{
			idc = -1;
			text = "Kaufen";
			action = "[] call DWEV_fnc_lottoPay";
			x = 0.675;
		};
	};
};
