/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

class GTA_RscNameTags
{
	idd = -1;
	fadein = 0;
	fadeout = 0;
	duration = 1e+011;
	scriptName = "GTA_RscNameTags";
	scriptPath = "GUI";
	onLoad = "[ _this, ""GTA_RscNameTags"" ] call GTA_fnc_initDisplay";

	class Controls
	{
		class tag1 : GTA_RscStructuredText
		{
			idc = IDC_RSCNAMETAGS_TAG;
			w = "16 * ( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
			h = "5 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
			size = "0.9 * ( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Attributes
			{
				font = "PuristaMedium";
				color = "#000000";
				align = "left";
				shadow = 1;
			};
		};
		class tag2 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 1; };
		class tag3 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 2; };
		class tag4 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 3; };
		class tag5 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 4; };
		class tag6 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 5; };
		class tag7 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 6; };
		class tag8 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 7; };
		class tag9 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 8; };
		class tag10 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 9; };
		class tag11 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 10; };
		class tag12 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 11; };
		class tag13 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 12; };
		class tag14 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 13; };
		class tag15 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 14; };
		class tag16 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 15; };
		class tag17 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 16; };
		class tag18 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 17; };
		class tag19 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 18; };
		class tag20 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 19; };
		class tag21 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 20; };
		class tag22 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 21; };
		class tag23 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 22; };
		class tag24 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 23; };
		class tag25 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 24; };
		class tag26 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 25; };
		class tag27 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 26; };
		class tag28 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 27; };
		class tag29 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 28; };
		class tag30 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 29; };
		class tag31 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 30; };
		class tag32 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 31; };
		class tag33 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 32; };
		class tag34 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 33; };
		class tag35 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 34; };
		class tag36 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 35; };
		class tag37 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 36; };
		class tag38 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 37; };
		class tag39 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 38; };
		class tag40 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 39; };
		class tag41 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 40; };
		class tag42 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 41; };
		class tag43 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 42; };
		class tag44 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 43; };
		class tag45 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 44; };
		class tag46 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 45; };
		class tag47 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 46; };
		class tag48 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 47; };
		class tag49 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 48; };
		class tag50 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 49; };
		class tag51 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 50; };
		class tag52 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 51; };
		class tag53 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 52; };
		class tag54 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 53; };
		class tag55 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 54; };
		class tag56 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 55; };
		class tag57 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 56; };
		class tag58 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 57; };
		class tag59 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 58; };
		class tag60 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 59; };
		class tag61 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 60; };
		class tag62 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 61; };
		class tag63 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 62; };
		class tag64 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 63; };
		class tag65 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 64; };
		class tag66 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 65; };
		class tag67 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 66; };
		class tag68 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 67; };
		class tag69 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 68; };
		class tag70 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 69; };
		class tag71 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 70; };
		class tag72 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 71; };
		class tag73 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 72; };
		class tag74 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 73; };
		class tag75 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 74; };
		class tag76 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 75; };
		class tag77 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 76; };
		class tag78 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 77; };
		class tag79 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 78; };
		class tag80 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 79; };
		class tag81 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 80; };
		class tag82 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 81; };
		class tag83 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 82; };
		class tag84 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 83; };
		class tag85 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 84; };
		class tag86 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 85; };
		class tag87 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 86; };
		class tag88 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 87; };
		class tag89 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 88; };
		class tag90 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 89; };
		class tag91 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 90; };
		class tag92 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 91; };
		class tag93 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 92; };
		class tag94 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 93; };
		class tag95 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 94; };
		class tag96 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 95; };
		class tag97 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 96; };
		class tag98 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 97; };
		class tag99 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 98; };
		class tag100 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 99; };
		class tag101 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 100; };
		class tag102 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 101; };
		class tag103 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 102; };
		class tag104 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 103; };
		class tag105 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 104; };
		class tag106 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 105; };
		class tag107 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 106; };
		class tag108 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 107; };
		class tag109 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 108; };
		class tag110 : tag1 { idc = IDC_RSCNAMETAGS_TAG + 109; };
	};
};
