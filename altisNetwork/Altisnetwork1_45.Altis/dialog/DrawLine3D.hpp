class Life_DrawLine3D {

		idd = 555558;
		onLoad = "uiNamespace setVariable['Life_DrawLine3D',_this select 0]";
		duration = 1e14;
		movingEnabled = true;
		enableSimulation = true;

		class controlsBackground {
			class DiagonalLine: Life_RscDiagonalLine
			{
				idc = 1;
				x = 0;
				y = 0;
				w = 1;
				h = 1;
			};

			class DiagonalLine2: DiagonalLine {idc=2;};
			class DiagonalLine3: DiagonalLine {idc=3;};
			class DiagonalLine4: DiagonalLine {idc=4;};
			class DiagonalLine5: DiagonalLine {idc=5;};
			class DiagonalLine6: DiagonalLine {idc=6;};
			class DiagonalLine7: DiagonalLine {idc=7;};
			class DiagonalLine8: DiagonalLine {idc=8;};
			class DiagonalLine9: DiagonalLine {idc=9;};
			class DiagonalLine10: DiagonalLine {idc=10;};
			class DiagonalLine11: DiagonalLine {idc=11;};
			class DiagonalLine12: DiagonalLine {idc=12;};
			class DiagonalLine13: DiagonalLine {idc=13;};
			class DiagonalLine14: DiagonalLine {idc=14;};
			class DiagonalLine15: DiagonalLine {idc=15;};
			class DiagonalLine16: DiagonalLine {idc=16;};
			class DiagonalLine17: DiagonalLine {idc=17;};
			class DiagonalLine18: DiagonalLine {idc=18;};
			class DiagonalLine19: DiagonalLine {idc=19;};
			class DiagonalLine20: DiagonalLine {idc=20;};
			class DiagonalLine21: DiagonalLine {idc=21;};
			class DiagonalLine22: DiagonalLine {idc=22;};
			class DiagonalLine23: DiagonalLine {idc=23;};
			class DiagonalLine24: DiagonalLine {idc=24;};
			class DiagonalLine25: DiagonalLine {idc=25;};
			class DiagonalLine26: DiagonalLine {idc=26;};
			class DiagonalLine27: DiagonalLine {idc=27;};
			class DiagonalLine28: DiagonalLine {idc=28;};
			class DiagonalLine29: DiagonalLine {idc=29;};
			class DiagonalLine30: DiagonalLine {idc=30;};
			class DiagonalLine31: DiagonalLine {idc=31;};
			class DiagonalLine32: DiagonalLine {idc=32;};
			class DiagonalLine33: DiagonalLine {idc=33;};
			class DiagonalLine34: DiagonalLine {idc=34;};
			class DiagonalLine35: DiagonalLine {idc=35;};
			class DiagonalLine36: DiagonalLine {idc=36;};
			class DiagonalLine37: DiagonalLine {idc=37;};
			class DiagonalLine38: DiagonalLine {idc=38;};
			class DiagonalLine39: DiagonalLine {idc=39;};
			class DiagonalLine40: DiagonalLine {idc=40;};
			class DiagonalLine41: DiagonalLine {idc=41;};
			class DiagonalLine42: DiagonalLine {idc=42;};
			class DiagonalLine43: DiagonalLine {idc=43;};
			class DiagonalLine44: DiagonalLine {idc=44;};
			class DiagonalLine45: DiagonalLine {idc=45;};
			class DiagonalLine46: DiagonalLine {idc=46;};
			class DiagonalLine47: DiagonalLine {idc=47;};
			class DiagonalLine48: DiagonalLine {idc=48;};
			class DiagonalLine49: DiagonalLine {idc=49;};
			class DiagonalLine50: DiagonalLine {idc=50;};
			class DiagonalLine51: DiagonalLine {idc=51;};
			class DiagonalLine52: DiagonalLine {idc=52;};
			class DiagonalLine53: DiagonalLine {idc=53;};
			class DiagonalLine54: DiagonalLine {idc=54;};
			class DiagonalLine55: DiagonalLine {idc=55;};
			class DiagonalLine56: DiagonalLine {idc=56;};
			class DiagonalLine57: DiagonalLine {idc=57;};
			class DiagonalLine58: DiagonalLine {idc=58;};
			class DiagonalLine59: DiagonalLine {idc=59;};
			class DiagonalLine60: DiagonalLine {idc=60;};
			class DiagonalLine61: DiagonalLine {idc=61;};
			class DiagonalLine62: DiagonalLine {idc=62;};
			class DiagonalLine63: DiagonalLine {idc=63;};
			class DiagonalLine64: DiagonalLine {idc=64;};
			class DiagonalLine65: DiagonalLine {idc=65;};
			class DiagonalLine66: DiagonalLine {idc=66;};
			class DiagonalLine67: DiagonalLine {idc=67;};
			class DiagonalLine68: DiagonalLine {idc=68;};
			class DiagonalLine69: DiagonalLine {idc=69;};
			class DiagonalLine70: DiagonalLine {idc=70;};
			class DiagonalLine71: DiagonalLine {idc=71;};
			class DiagonalLine72: DiagonalLine {idc=72;};
			class DiagonalLine73: DiagonalLine {idc=73;};
			class DiagonalLine74: DiagonalLine {idc=74;};
			class DiagonalLine75: DiagonalLine {idc=75;};
			class DiagonalLine76: DiagonalLine {idc=76;};
			class DiagonalLine77: DiagonalLine {idc=77;};
			class DiagonalLine78: DiagonalLine {idc=78;};
			class DiagonalLine79: DiagonalLine {idc=79;};
			class DiagonalLine80: DiagonalLine {idc=80;};
			class DiagonalLine81: DiagonalLine {idc=81;};
			class DiagonalLine82: DiagonalLine {idc=82;};
			class DiagonalLine83: DiagonalLine {idc=83;};
			class DiagonalLine84: DiagonalLine {idc=84;};
			class DiagonalLine85: DiagonalLine {idc=85;};
			class DiagonalLine86: DiagonalLine {idc=86;};
			class DiagonalLine87: DiagonalLine {idc=87;};
			class DiagonalLine88: DiagonalLine {idc=88;};
			class DiagonalLine89: DiagonalLine {idc=89;};
			class DiagonalLine90: DiagonalLine {idc=90;};
			class DiagonalLine91: DiagonalLine {idc=91;};
			class DiagonalLine92: DiagonalLine {idc=92;};
			class DiagonalLine93: DiagonalLine {idc=93;};
			class DiagonalLine94: DiagonalLine {idc=94;};
			class DiagonalLine95: DiagonalLine {idc=95;};
			class DiagonalLine96: DiagonalLine {idc=96;};
			class DiagonalLine97: DiagonalLine {idc=97;};
			class DiagonalLine98: DiagonalLine {idc=98;};
			class DiagonalLine99: DiagonalLine {idc=99;};
			class DiagonalLine100: DiagonalLine {idc=100;};
			class DiagonalLine101: DiagonalLine {idc=101;};
			class DiagonalLine102: DiagonalLine {idc=102;};
			class DiagonalLine103: DiagonalLine {idc=103;};
			class DiagonalLine104: DiagonalLine {idc=104;};
			class DiagonalLine105: DiagonalLine {idc=105;};
			class DiagonalLine106: DiagonalLine {idc=106;};
			class DiagonalLine107: DiagonalLine {idc=107;};
			class DiagonalLine108: DiagonalLine {idc=108;};
			class DiagonalLine109: DiagonalLine {idc=109;};
			class DiagonalLine110: DiagonalLine {idc=110;};
			class DiagonalLine111: DiagonalLine {idc=111;};
			class DiagonalLine112: DiagonalLine {idc=112;};
			class DiagonalLine113: DiagonalLine {idc=113;};
			class DiagonalLine114: DiagonalLine {idc=114;};
			class DiagonalLine115: DiagonalLine {idc=115;};
			class DiagonalLine116: DiagonalLine {idc=116;};
			class DiagonalLine117: DiagonalLine {idc=117;};
			class DiagonalLine118: DiagonalLine {idc=118;};
			class DiagonalLine119: DiagonalLine {idc=119;};
			class DiagonalLine120: DiagonalLine {idc=120;};
			class DiagonalLine121: DiagonalLine {idc=121;};
			class DiagonalLine122: DiagonalLine {idc=122;};
			class DiagonalLine123: DiagonalLine {idc=123;};
			class DiagonalLine124: DiagonalLine {idc=124;};
			class DiagonalLine125: DiagonalLine {idc=125;};
			class DiagonalLine126: DiagonalLine {idc=126;};
			class DiagonalLine127: DiagonalLine {idc=127;};
			class DiagonalLine128: DiagonalLine {idc=128;};
			class DiagonalLine129: DiagonalLine {idc=129;};
			class DiagonalLine130: DiagonalLine {idc=130;};
			class DiagonalLine131: DiagonalLine {idc=131;};
			class DiagonalLine132: DiagonalLine {idc=132;};
			class DiagonalLine133: DiagonalLine {idc=133;};
			class DiagonalLine134: DiagonalLine {idc=134;};
			class DiagonalLine135: DiagonalLine {idc=135;};
			class DiagonalLine136: DiagonalLine {idc=136;};
			class DiagonalLine137: DiagonalLine {idc=137;};
			class DiagonalLine138: DiagonalLine {idc=138;};
			class DiagonalLine139: DiagonalLine {idc=139;};
			class DiagonalLine140: DiagonalLine {idc=140;};
			class DiagonalLine141: DiagonalLine {idc=141;};
			class DiagonalLine142: DiagonalLine {idc=142;};
			class DiagonalLine143: DiagonalLine {idc=143;};
			class DiagonalLine144: DiagonalLine {idc=144;};
			class DiagonalLine145: DiagonalLine {idc=145;};
			class DiagonalLine146: DiagonalLine {idc=146;};
			class DiagonalLine147: DiagonalLine {idc=147;};
			class DiagonalLine148: DiagonalLine {idc=148;};
			class DiagonalLine149: DiagonalLine {idc=149;};
			class DiagonalLine150: DiagonalLine {idc=150;};
			class DiagonalLine151: DiagonalLine {idc=151;};
			class DiagonalLine152: DiagonalLine {idc=152;};
			class DiagonalLine153: DiagonalLine {idc=153;};
			class DiagonalLine154: DiagonalLine {idc=154;};
			class DiagonalLine155: DiagonalLine {idc=155;};
			class DiagonalLine156: DiagonalLine {idc=156;};
			class DiagonalLine157: DiagonalLine {idc=157;};
			class DiagonalLine158: DiagonalLine {idc=158;};
			class DiagonalLine159: DiagonalLine {idc=159;};
			class DiagonalLine160: DiagonalLine {idc=160;};
			class DiagonalLine161: DiagonalLine {idc=161;};
			class DiagonalLine162: DiagonalLine {idc=162;};
			class DiagonalLine163: DiagonalLine {idc=163;};
			class DiagonalLine164: DiagonalLine {idc=164;};
			class DiagonalLine165: DiagonalLine {idc=165;};
			class DiagonalLine166: DiagonalLine {idc=166;};
			class DiagonalLine167: DiagonalLine {idc=167;};
			class DiagonalLine168: DiagonalLine {idc=168;};
			class DiagonalLine169: DiagonalLine {idc=169;};
			class DiagonalLine170: DiagonalLine {idc=170;};
			class DiagonalLine171: DiagonalLine {idc=171;};
			class DiagonalLine172: DiagonalLine {idc=172;};
			class DiagonalLine173: DiagonalLine {idc=173;};
			class DiagonalLine174: DiagonalLine {idc=174;};
			class DiagonalLine175: DiagonalLine {idc=175;};
			class DiagonalLine176: DiagonalLine {idc=176;};
			class DiagonalLine177: DiagonalLine {idc=177;};
			class DiagonalLine178: DiagonalLine {idc=178;};
			class DiagonalLine179: DiagonalLine {idc=179;};
			class DiagonalLine180: DiagonalLine {idc=180;};
			class DiagonalLine181: DiagonalLine {idc=181;};
			class DiagonalLine182: DiagonalLine {idc=182;};
			class DiagonalLine183: DiagonalLine {idc=183;};
			class DiagonalLine184: DiagonalLine {idc=184;};
			class DiagonalLine185: DiagonalLine {idc=185;};
			class DiagonalLine186: DiagonalLine {idc=186;};
			class DiagonalLine187: DiagonalLine {idc=187;};
			class DiagonalLine188: DiagonalLine {idc=188;};
			class DiagonalLine189: DiagonalLine {idc=189;};
			class DiagonalLine190: DiagonalLine {idc=190;};
			class DiagonalLine191: DiagonalLine {idc=191;};
			class DiagonalLine192: DiagonalLine {idc=192;};
			class DiagonalLine193: DiagonalLine {idc=193;};
			class DiagonalLine194: DiagonalLine {idc=194;};
			class DiagonalLine195: DiagonalLine {idc=195;};
			class DiagonalLine196: DiagonalLine {idc=196;};
			class DiagonalLine197: DiagonalLine {idc=197;};
			class DiagonalLine198: DiagonalLine {idc=198;};
			class DiagonalLine199: DiagonalLine {idc=199;};
			class DiagonalLine200: DiagonalLine {idc=200;};
			class DiagonalLine201: DiagonalLine {idc=201;};
			class DiagonalLine202: DiagonalLine {idc=202;};
			class DiagonalLine203: DiagonalLine {idc=203;};
			class DiagonalLine204: DiagonalLine {idc=204;};
			class DiagonalLine205: DiagonalLine {idc=205;};
			class DiagonalLine206: DiagonalLine {idc=206;};
			class DiagonalLine207: DiagonalLine {idc=207;};
			class DiagonalLine208: DiagonalLine {idc=208;};
			class DiagonalLine209: DiagonalLine {idc=209;};
			class DiagonalLine210: DiagonalLine {idc=210;};
			class DiagonalLine211: DiagonalLine {idc=211;};
			class DiagonalLine212: DiagonalLine {idc=212;};
			class DiagonalLine213: DiagonalLine {idc=213;};
			class DiagonalLine214: DiagonalLine {idc=214;};
			class DiagonalLine215: DiagonalLine {idc=215;};
			class DiagonalLine216: DiagonalLine {idc=216;};
			class DiagonalLine217: DiagonalLine {idc=217;};
			class DiagonalLine218: DiagonalLine {idc=218;};
			class DiagonalLine219: DiagonalLine {idc=219;};
			class DiagonalLine220: DiagonalLine {idc=220;};
			class DiagonalLine221: DiagonalLine {idc=221;};
			class DiagonalLine222: DiagonalLine {idc=222;};
			class DiagonalLine223: DiagonalLine {idc=223;};
			class DiagonalLine224: DiagonalLine {idc=224;};
			class DiagonalLine225: DiagonalLine {idc=225;};
			class DiagonalLine226: DiagonalLine {idc=226;};
			class DiagonalLine227: DiagonalLine {idc=227;};
			class DiagonalLine228: DiagonalLine {idc=228;};
			class DiagonalLine229: DiagonalLine {idc=229;};
			class DiagonalLine230: DiagonalLine {idc=230;};
			class DiagonalLine231: DiagonalLine {idc=231;};
			class DiagonalLine232: DiagonalLine {idc=232;};
			class DiagonalLine233: DiagonalLine {idc=233;};
			class DiagonalLine234: DiagonalLine {idc=234;};
			class DiagonalLine235: DiagonalLine {idc=235;};
			class DiagonalLine236: DiagonalLine {idc=236;};
			class DiagonalLine237: DiagonalLine {idc=237;};
			class DiagonalLine238: DiagonalLine {idc=238;};
			class DiagonalLine239: DiagonalLine {idc=239;};
			class DiagonalLine240: DiagonalLine {idc=240;};
			class DiagonalLine241: DiagonalLine {idc=241;};
			class DiagonalLine242: DiagonalLine {idc=242;};
			class DiagonalLine243: DiagonalLine {idc=243;};
			class DiagonalLine244: DiagonalLine {idc=244;};
			class DiagonalLine245: DiagonalLine {idc=245;};
			class DiagonalLine246: DiagonalLine {idc=246;};
			class DiagonalLine247: DiagonalLine {idc=247;};
			class DiagonalLine248: DiagonalLine {idc=248;};
			class DiagonalLine249: DiagonalLine {idc=249;};
			class DiagonalLine250: DiagonalLine {idc=250;};
			class DiagonalLine251: DiagonalLine {idc=251;};
			class DiagonalLine252: DiagonalLine {idc=252;};
			class DiagonalLine253: DiagonalLine {idc=253;};
			class DiagonalLine254: DiagonalLine {idc=254;};
			class DiagonalLine255: DiagonalLine {idc=255;};
			class DiagonalLine256: DiagonalLine {idc=256;};
			class DiagonalLine257: DiagonalLine {idc=257;};
			class DiagonalLine258: DiagonalLine {idc=258;};
			class DiagonalLine259: DiagonalLine {idc=259;};
			class DiagonalLine260: DiagonalLine {idc=260;};
			class DiagonalLine261: DiagonalLine {idc=261;};
			class DiagonalLine262: DiagonalLine {idc=262;};
			class DiagonalLine263: DiagonalLine {idc=263;};
			class DiagonalLine264: DiagonalLine {idc=264;};
			class DiagonalLine265: DiagonalLine {idc=265;};
			class DiagonalLine266: DiagonalLine {idc=266;};
			class DiagonalLine267: DiagonalLine {idc=267;};
			class DiagonalLine268: DiagonalLine {idc=268;};
			class DiagonalLine269: DiagonalLine {idc=269;};
			class DiagonalLine270: DiagonalLine {idc=270;};
			class DiagonalLine271: DiagonalLine {idc=271;};
			class DiagonalLine272: DiagonalLine {idc=272;};
			class DiagonalLine273: DiagonalLine {idc=273;};
			class DiagonalLine274: DiagonalLine {idc=274;};
			class DiagonalLine275: DiagonalLine {idc=275;};
			class DiagonalLine276: DiagonalLine {idc=276;};
			class DiagonalLine277: DiagonalLine {idc=277;};
			class DiagonalLine278: DiagonalLine {idc=278;};
			class DiagonalLine279: DiagonalLine {idc=279;};
			class DiagonalLine280: DiagonalLine {idc=280;};
			class DiagonalLine281: DiagonalLine {idc=281;};
			class DiagonalLine282: DiagonalLine {idc=282;};
			class DiagonalLine283: DiagonalLine {idc=283;};
			class DiagonalLine284: DiagonalLine {idc=284;};
			class DiagonalLine285: DiagonalLine {idc=285;};
			class DiagonalLine286: DiagonalLine {idc=286;};
			class DiagonalLine287: DiagonalLine {idc=287;};
			class DiagonalLine288: DiagonalLine {idc=288;};
			class DiagonalLine289: DiagonalLine {idc=289;};
			class DiagonalLine290: DiagonalLine {idc=290;};
			class DiagonalLine291: DiagonalLine {idc=291;};
			class DiagonalLine292: DiagonalLine {idc=292;};
			class DiagonalLine293: DiagonalLine {idc=293;};
			class DiagonalLine294: DiagonalLine {idc=294;};
			class DiagonalLine295: DiagonalLine {idc=295;};
			class DiagonalLine296: DiagonalLine {idc=296;};
			class DiagonalLine297: DiagonalLine {idc=297;};
			class DiagonalLine298: DiagonalLine {idc=298;};
			class DiagonalLine299: DiagonalLine {idc=299;};
			class DiagonalLine300: DiagonalLine {idc=300;};
			class DiagonalLine301: DiagonalLine {idc=301;};
			class DiagonalLine302: DiagonalLine {idc=302;};
			class DiagonalLine303: DiagonalLine {idc=303;};
			class DiagonalLine304: DiagonalLine {idc=304;};
			class DiagonalLine305: DiagonalLine {idc=305;};
			class DiagonalLine306: DiagonalLine {idc=306;};
			class DiagonalLine307: DiagonalLine {idc=307;};
			class DiagonalLine308: DiagonalLine {idc=308;};
			class DiagonalLine309: DiagonalLine {idc=309;};
			class DiagonalLine310: DiagonalLine {idc=310;};
			class DiagonalLine311: DiagonalLine {idc=311;};
			class DiagonalLine312: DiagonalLine {idc=312;};
			class DiagonalLine313: DiagonalLine {idc=313;};
			class DiagonalLine314: DiagonalLine {idc=314;};
			class DiagonalLine315: DiagonalLine {idc=315;};
			class DiagonalLine316: DiagonalLine {idc=316;};
			class DiagonalLine317: DiagonalLine {idc=317;};
			class DiagonalLine318: DiagonalLine {idc=318;};
			class DiagonalLine319: DiagonalLine {idc=319;};
			class DiagonalLine320: DiagonalLine {idc=320;};
			class DiagonalLine321: DiagonalLine {idc=321;};
			class DiagonalLine322: DiagonalLine {idc=322;};
			class DiagonalLine323: DiagonalLine {idc=323;};
			class DiagonalLine324: DiagonalLine {idc=324;};
			class DiagonalLine325: DiagonalLine {idc=325;};
			class DiagonalLine326: DiagonalLine {idc=326;};
			class DiagonalLine327: DiagonalLine {idc=327;};
			class DiagonalLine328: DiagonalLine {idc=328;};
			class DiagonalLine329: DiagonalLine {idc=329;};
			class DiagonalLine330: DiagonalLine {idc=330;};
			class DiagonalLine331: DiagonalLine {idc=331;};
			class DiagonalLine332: DiagonalLine {idc=332;};
			class DiagonalLine333: DiagonalLine {idc=333;};
			class DiagonalLine334: DiagonalLine {idc=334;};
			class DiagonalLine335: DiagonalLine {idc=335;};
			class DiagonalLine336: DiagonalLine {idc=336;};
			class DiagonalLine337: DiagonalLine {idc=337;};
			class DiagonalLine338: DiagonalLine {idc=338;};
			class DiagonalLine339: DiagonalLine {idc=339;};
			class DiagonalLine340: DiagonalLine {idc=340;};
			class DiagonalLine341: DiagonalLine {idc=341;};
			class DiagonalLine342: DiagonalLine {idc=342;};
			class DiagonalLine343: DiagonalLine {idc=343;};
			class DiagonalLine344: DiagonalLine {idc=344;};
			class DiagonalLine345: DiagonalLine {idc=345;};
			class DiagonalLine346: DiagonalLine {idc=346;};
			class DiagonalLine347: DiagonalLine {idc=347;};
			class DiagonalLine348: DiagonalLine {idc=348;};
			class DiagonalLine349: DiagonalLine {idc=349;};
			class DiagonalLine350: DiagonalLine {idc=350;};
			class DiagonalLine351: DiagonalLine {idc=351;};
			class DiagonalLine352: DiagonalLine {idc=352;};
			class DiagonalLine353: DiagonalLine {idc=353;};
			class DiagonalLine354: DiagonalLine {idc=354;};
			class DiagonalLine355: DiagonalLine {idc=355;};
			class DiagonalLine356: DiagonalLine {idc=356;};
			class DiagonalLine357: DiagonalLine {idc=357;};
			class DiagonalLine358: DiagonalLine {idc=358;};
			class DiagonalLine359: DiagonalLine {idc=359;};
			class DiagonalLine360: DiagonalLine {idc=360;};
			class DiagonalLine361: DiagonalLine {idc=361;};
			class DiagonalLine362: DiagonalLine {idc=362;};
			class DiagonalLine363: DiagonalLine {idc=363;};
			class DiagonalLine364: DiagonalLine {idc=364;};
			class DiagonalLine365: DiagonalLine {idc=365;};
			class DiagonalLine366: DiagonalLine {idc=366;};
			class DiagonalLine367: DiagonalLine {idc=367;};
			class DiagonalLine368: DiagonalLine {idc=368;};
			class DiagonalLine369: DiagonalLine {idc=369;};
			class DiagonalLine370: DiagonalLine {idc=370;};
			class DiagonalLine371: DiagonalLine {idc=371;};
			class DiagonalLine372: DiagonalLine {idc=372;};
			class DiagonalLine373: DiagonalLine {idc=373;};
			class DiagonalLine374: DiagonalLine {idc=374;};
			class DiagonalLine375: DiagonalLine {idc=375;};
			class DiagonalLine376: DiagonalLine {idc=376;};
			class DiagonalLine377: DiagonalLine {idc=377;};
			class DiagonalLine378: DiagonalLine {idc=378;};
			class DiagonalLine379: DiagonalLine {idc=379;};
			class DiagonalLine380: DiagonalLine {idc=380;};
			class DiagonalLine381: DiagonalLine {idc=381;};
			class DiagonalLine382: DiagonalLine {idc=382;};
			class DiagonalLine383: DiagonalLine {idc=383;};
			class DiagonalLine384: DiagonalLine {idc=384;};
			class DiagonalLine385: DiagonalLine {idc=385;};
			class DiagonalLine386: DiagonalLine {idc=386;};
			class DiagonalLine387: DiagonalLine {idc=387;};
			class DiagonalLine388: DiagonalLine {idc=388;};
			class DiagonalLine389: DiagonalLine {idc=389;};
			class DiagonalLine390: DiagonalLine {idc=390;};
			class DiagonalLine391: DiagonalLine {idc=391;};
			class DiagonalLine392: DiagonalLine {idc=392;};
			class DiagonalLine393: DiagonalLine {idc=393;};
			class DiagonalLine394: DiagonalLine {idc=394;};
			class DiagonalLine395: DiagonalLine {idc=395;};
			class DiagonalLine396: DiagonalLine {idc=396;};
			class DiagonalLine397: DiagonalLine {idc=397;};
			class DiagonalLine398: DiagonalLine {idc=398;};
			class DiagonalLine399: DiagonalLine {idc=399;};
			class DiagonalLine400: DiagonalLine {idc=400;};
			class DiagonalLine401: DiagonalLine {idc=401;};
			class DiagonalLine402: DiagonalLine {idc=402;};
			class DiagonalLine403: DiagonalLine {idc=403;};
			class DiagonalLine404: DiagonalLine {idc=404;};
			class DiagonalLine405: DiagonalLine {idc=405;};
			class DiagonalLine406: DiagonalLine {idc=406;};
			class DiagonalLine407: DiagonalLine {idc=407;};
			class DiagonalLine408: DiagonalLine {idc=408;};
			class DiagonalLine409: DiagonalLine {idc=409;};
			class DiagonalLine410: DiagonalLine {idc=410;};
			class DiagonalLine411: DiagonalLine {idc=411;};
			class DiagonalLine412: DiagonalLine {idc=412;};
			class DiagonalLine413: DiagonalLine {idc=413;};
			class DiagonalLine414: DiagonalLine {idc=414;};
			class DiagonalLine415: DiagonalLine {idc=415;};
			class DiagonalLine416: DiagonalLine {idc=416;};
			class DiagonalLine417: DiagonalLine {idc=417;};
			class DiagonalLine418: DiagonalLine {idc=418;};
			class DiagonalLine419: DiagonalLine {idc=419;};
			class DiagonalLine420: DiagonalLine {idc=420;};
			class DiagonalLine421: DiagonalLine {idc=421;};
			class DiagonalLine422: DiagonalLine {idc=422;};
			class DiagonalLine423: DiagonalLine {idc=423;};
			class DiagonalLine424: DiagonalLine {idc=424;};
			class DiagonalLine425: DiagonalLine {idc=425;};
			class DiagonalLine426: DiagonalLine {idc=426;};
			class DiagonalLine427: DiagonalLine {idc=427;};
			class DiagonalLine428: DiagonalLine {idc=428;};
			class DiagonalLine429: DiagonalLine {idc=429;};
			class DiagonalLine430: DiagonalLine {idc=430;};
			class DiagonalLine431: DiagonalLine {idc=431;};
			class DiagonalLine432: DiagonalLine {idc=432;};
			class DiagonalLine433: DiagonalLine {idc=433;};
			class DiagonalLine434: DiagonalLine {idc=434;};
			class DiagonalLine435: DiagonalLine {idc=435;};
			class DiagonalLine436: DiagonalLine {idc=436;};
			class DiagonalLine437: DiagonalLine {idc=437;};
			class DiagonalLine438: DiagonalLine {idc=438;};
			class DiagonalLine439: DiagonalLine {idc=439;};
			class DiagonalLine440: DiagonalLine {idc=440;};
			class DiagonalLine441: DiagonalLine {idc=441;};
			class DiagonalLine442: DiagonalLine {idc=442;};
			class DiagonalLine443: DiagonalLine {idc=443;};
			class DiagonalLine444: DiagonalLine {idc=444;};
			class DiagonalLine445: DiagonalLine {idc=445;};
			class DiagonalLine446: DiagonalLine {idc=446;};
			class DiagonalLine447: DiagonalLine {idc=447;};
			class DiagonalLine448: DiagonalLine {idc=448;};
			class DiagonalLine449: DiagonalLine {idc=449;};
			class DiagonalLine450: DiagonalLine {idc=450;};
			class DiagonalLine451: DiagonalLine {idc=451;};
			class DiagonalLine452: DiagonalLine {idc=452;};
			class DiagonalLine453: DiagonalLine {idc=453;};
			class DiagonalLine454: DiagonalLine {idc=454;};
			class DiagonalLine455: DiagonalLine {idc=455;};
			class DiagonalLine456: DiagonalLine {idc=456;};
			class DiagonalLine457: DiagonalLine {idc=457;};
			class DiagonalLine458: DiagonalLine {idc=458;};
			class DiagonalLine459: DiagonalLine {idc=459;};
			class DiagonalLine460: DiagonalLine {idc=460;};
			class DiagonalLine461: DiagonalLine {idc=461;};
			class DiagonalLine462: DiagonalLine {idc=462;};
			class DiagonalLine463: DiagonalLine {idc=463;};
			class DiagonalLine464: DiagonalLine {idc=464;};
			class DiagonalLine465: DiagonalLine {idc=465;};
			class DiagonalLine466: DiagonalLine {idc=466;};
			class DiagonalLine467: DiagonalLine {idc=467;};
			class DiagonalLine468: DiagonalLine {idc=468;};
			class DiagonalLine469: DiagonalLine {idc=469;};
			class DiagonalLine470: DiagonalLine {idc=470;};
			class DiagonalLine471: DiagonalLine {idc=471;};
			class DiagonalLine472: DiagonalLine {idc=472;};
			class DiagonalLine473: DiagonalLine {idc=473;};
			class DiagonalLine474: DiagonalLine {idc=474;};
			class DiagonalLine475: DiagonalLine {idc=475;};
			class DiagonalLine476: DiagonalLine {idc=476;};
			class DiagonalLine477: DiagonalLine {idc=477;};
			class DiagonalLine478: DiagonalLine {idc=478;};
			class DiagonalLine479: DiagonalLine {idc=479;};
			class DiagonalLine480: DiagonalLine {idc=480;};
			class DiagonalLine481: DiagonalLine {idc=481;};
			class DiagonalLine482: DiagonalLine {idc=482;};
			class DiagonalLine483: DiagonalLine {idc=483;};
			class DiagonalLine484: DiagonalLine {idc=484;};
			class DiagonalLine485: DiagonalLine {idc=485;};
			class DiagonalLine486: DiagonalLine {idc=486;};
			class DiagonalLine487: DiagonalLine {idc=487;};
			class DiagonalLine488: DiagonalLine {idc=488;};
			class DiagonalLine489: DiagonalLine {idc=489;};
			class DiagonalLine490: DiagonalLine {idc=490;};
			class DiagonalLine491: DiagonalLine {idc=491;};
			class DiagonalLine492: DiagonalLine {idc=492;};
			class DiagonalLine493: DiagonalLine {idc=493;};
			class DiagonalLine494: DiagonalLine {idc=494;};
			class DiagonalLine495: DiagonalLine {idc=495;};
			class DiagonalLine496: DiagonalLine {idc=496;};
			class DiagonalLine497: DiagonalLine {idc=497;};
			class DiagonalLine498: DiagonalLine {idc=498;};
			class DiagonalLine499: DiagonalLine {idc=499;};
			class DiagonalLine500: DiagonalLine {idc=500;};
		};
	};	