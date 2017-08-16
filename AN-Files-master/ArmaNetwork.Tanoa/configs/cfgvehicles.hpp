class CfgVehicles
{
	sellPrice = 0.6;
	//Quadbike
	class B_Quadbike_01_F
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 50;
			west = 50;
			guer = 50;
		};
		class rentOnly
		{
			civ = 0;
			west = 0;
			guer = 0;
		};
		class textures
		{
			class west
			{
				class Brown
				{
					name = "Brown";
					textures[] = {"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"};
				};
			};
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_Black_co.paa"};
				};
				class blue
				{
					name = "Blue";
					textures[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"};
				};
				class red
				{
					name = "Red";
					textures[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"};
				};
				class white
				{
					name = "White";
					textures[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"};
				};
				class digigreen
				{
					name = "Digi Green";
					textures[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"};
				};
				class huntercamo
				{
					name = "Hunter Camo";
					textures[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
				};
			};
			class reb
			{
				class rebelcamo
				{
					name = "Rebel Camo";
					textures[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
				};
			};
		};
	};
	//Normal Hatchback
	class C_Hatchback_01_F
	{
		class trunk
		{
			civ = 50;
			west = 70;
			guer = 70;
		};
		class retrievePrice
		{
			civ = 200;
			west = 50;
			guer = 50;
		};
		class textures
		{
			class civ
			{
				class silver
				{
					name = "Silver";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_co.paa"};
				};
				class beige
				{
					name = "Beige";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"};
				};
				class green
				{
					name = "Green";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"};
				};
				class blue
				{
					name = "Blue";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"};
				};
				class darkblue
				{
					name = "Dark Blue";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"};
				};
				class lightyellow
				{
					name = "Light Yellow";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"};
				};
				class white
				{
					name = "White";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"};
				};
				class grey
				{
					name = "Grey";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"};
				};
				class Black
				{
					name = "Black";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"};
				};
			};
		};
	};
	class C_Offroad_01_F
	{
		class trunk
		{
			civ = 60;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
		class textures
		{
			class civ
			{
				class red
				{
					name = "Red";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"};
				};
				class white
				{
					name = "White";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"};
				};
				class blue
				{
					name = "Blue";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"};
				};
				class darkred
				{
					name = "Dark Red";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"};
				};
				class bluewhite
				{
					name = "Blue / White";
					textures[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"};
				};
			};
			class west
			{
				class tsf
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
			};
		};
	};


	class C_SUV_01_F
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
		class textures
		{
			class civ
			{
				class red
				{
					name = "Red";
					textures[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"};
				};
				class silver
				{
					name = "Silver";
					textures[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"};
				};
				class orange
				{
					name = "Orange";
					textures[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"};
				};
			};
			class west
			{
				class tsf
				{
					name = "TSF Black";
					textures[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"};
				};
			};
		};
	};

	class I_C_Offroad_02_unarmed_F
	{
		class trunk
		{
			civ = 160;
			west = 160;
			guer = 160;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
		class textures
		{
			class west
			{
				class blue
				{
					name = "Blue";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"};
				};
				class Black
				{
					name = "Black";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"};
				};
				class Green
				{
					name = "Green";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"};
				};
				class Orange
				{
					name = "Orange";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"};
				};
				class Red
				{
					name = "Red";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"};
				};
				class White
				{
					name = "White";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"};
				};
				class Brown
				{
					name = "Brown";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"};
				};
				class Olive
				{
					name = "Olive";
					textures[] = {"A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
				};
			};
		};
	};

	class C_Van_01_transport_F
	{
		class trunk
		{
			civ = 170;
			west = 170;
			guer = 170;
		};
		class retrievePrice
		{
			civ = 250;
			west = 250;
			guer = 250;
		};
		class textures
		{
			class civ
			{
				class white
				{
					name = "White";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
				};
				class red
				{
					name = "Red";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
				};
				class Black
				{
					name = "Black";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_Black_co.paa"};
				};
			};
		};
	};

	class Mrshounka_Vandura_civ
	{
		class trunk
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
		class retrievePrice
		{
			civ = 250;
			west = 250;
			guer = 250;
		};
	};
	class Mrshounka_Vandura_civ_noir: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_bleufonce: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_jaune: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_rose: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_grise: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_violet: Mrshounka_Vandura_civ {};
  class Mrshounka_Vandura_civ_orange: Mrshounka_Vandura_civ {};

	class shounka_a3_spr_civ
		{
			class trunk
			{
				civ = 165;
				west = 165;
				guer = 165;
			};
			class retrievePrice
			{
				civ = 550;
				west = 250;
				guer = 250;
			};
	};
	class shounka_a3_spr_civ_noir: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_bleufonce: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_jaune: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_rose: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_grise: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_violet: shounka_a3_spr_civ {};
	class shounka_a3_spr_civ_orange: shounka_a3_spr_civ {};


	class shounka_avalanche
			{
				class trunk
				{
					civ = 105;
					west = 105;
					guer = 105;
				};
				class retrievePrice
				{
					civ = 550;
					west = 250;
					guer = 250;
				};
		};
	class shounka_avalanche_noir: shounka_avalanche {};
	class shounka_avalanche_bleufonce: shounka_avalanche {};
	class shounka_avalanche_jaune: shounka_avalanche {};
	class shounka_avalanche_rose: shounka_avalanche {};
	class shounka_avalanche_grise: shounka_avalanche {};
	class shounka_avalanche_violet: shounka_avalanche {};
	class shounka_avalanche_orange: shounka_avalanche {};
	class Mrshounka_raptor_civ: shounka_avalanche {};
	class Mrshounka_raptor_noir: shounka_avalanche {};
	class Mrshounka_raptor_bleufonce: shounka_avalanche {};
	class Mrshounka_raptor_rouge: shounka_avalanche {};
	class Mrshounka_raptor_jaune: shounka_avalanche {};
	class Mrshounka_raptor_rose: shounka_avalanche {};
	class Mrshounka_raptor_grise: shounka_avalanche {};
	class Mrshounka_raptor_violet: shounka_avalanche {};
	class Mrshounka_raptor_orange: shounka_avalanche {};

	class Mrshounka_raptor2_civ
			{
				class trunk
				{
					civ = 135;
					west = 125;
					guer = 125;
				};
				class retrievePrice
				{
					civ = 550;
					west = 250;
					guer = 250;
				};
		};
	class Mrshounka_raptor2_noir: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_bleufonce: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_rouge: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_jaune: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_rose: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_grise: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_violet: Mrshounka_raptor2_civ {};
	class Mrshounka_raptor2_orange: Mrshounka_raptor2_civ {};

	class Quiet_ford_raptor_blanche_f: Mrshounka_raptor2_civ {};
	class Quiet_ford_raptor_chrome_f: Mrshounka_raptor2_civ {};
	class Quiet_ford_raptor_bleu_f: Mrshounka_raptor2_civ {};
	class Quiet_ford_raptor_noir_f: Mrshounka_raptor2_civ {};
	class Quiet_ford_raptor_rouge_f: Mrshounka_raptor2_civ {};

	class shounka_a3_rs5_civ
	{
		class trunk
		{
			civ = 95;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class shounka_a3_rs5_civ_noir: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_bleufonce: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_jaune: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_rose: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_grise: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_violet: shounka_a3_rs5_civ {};
	class shounka_a3_rs5_civ_orange: shounka_a3_rs5_civ {};
  class Mrshounka_a3_308_rcz: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_noir: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_bleufonce: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_jaune: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_rose: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_grise: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_violet: shounka_a3_rs5_civ {};
	class Mrshounka_a3_308_rcz_orange: shounka_a3_rs5_civ {};

	class Mrshounka_lincoln_civ
	{
		class trunk
		{
			civ = 75;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class Mrshounka_lincoln_noir: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_bleufonce: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_jaune: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_rose: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_grise: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_violet: Mrshounka_lincoln_civ {};
	class Mrshounka_lincoln_orange: Mrshounka_lincoln_civ {};

	class Mrshounka_Bowler_c
	{
		class trunk
		{
			civ = 65;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class Mrshounka_Bowler_c_noir: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_bleufonce: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_jaune: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_rose: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_grise: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_violet: Mrshounka_Bowler_c {};
	class Mrshounka_Bowler_c_orange: Mrshounka_Bowler_c {};

	class Mrshounka_bmwm6_civ
	{
		class trunk
		{
			civ = 45;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class Mrshounka_bmwm6_noir: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_bleufonce: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_jaune: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_rose: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_grise: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_violet: Mrshounka_bmwm6_civ {};
	class Mrshounka_bmwm6_orange: Mrshounka_bmwm6_civ {};

  class Mrshounka_a3_dodge15_civ
	{
		class trunk
		{
			civ = 65;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class Mrshounka_a3_dodge15_civ_noir: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_bleufonce: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_jaune: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_rose: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_grise: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_violet: Mrshounka_a3_dodge15_civ {};
	class Mrshounka_a3_dodge15_civ_orange: Mrshounka_a3_dodge15_civ {};

  class Mrshounka_c63_2015_civ
	{
		class trunk
		{
			civ = 45;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class Mrshounka_c63_2015_mat: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_noir: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_mat_n: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_bleufonce: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_mat_b: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_jaune: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_rose: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_grise: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_violet: Mrshounka_c63_2015_civ {};
  class Mrshounka_c63_2015_orange: Mrshounka_c63_2015_civ {};

  class shounka_h2
	{
		class trunk
		{
			civ = 65;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class shounka_h2_noir: shounka_h2 {};
	class shounka_h2_bleufonce: shounka_h2 {};
	class shounka_h2_jaune: shounka_h2 {};
	class shounka_h2_rose: shounka_h2 {};
	class shounka_h2_grise: shounka_h2 {};
	class shounka_h2_violet: shounka_h2 {};
	class shounka_h2_orange: shounka_h2 {};

	class quiet_sub2015_blanche_f
		{
			class trunk
			{
				civ = 55;
				west = 125;
				guer = 125;
			};
			class retrievePrice
			{
				civ = 550;
				west = 250;
				guer = 250;
			};
		};
	class quiet_sub2015_chrome_f: quiet_sub2015_blanche_f {};
  class quiet_sub2015_bleu_f: quiet_sub2015_blanche_f {};
  class quiet_sub2015_rouge_f: quiet_sub2015_blanche_f {};

	class Quiet_Cadillac_blanche_f
			{
				class trunk
				{
					civ = 55;
					west = 125;
					guer = 125;
				};
				class retrievePrice
				{
					civ = 550;
					west = 250;
					guer = 250;
				};
			};
	class Quiet_Cadillac_chrome_f: Quiet_Cadillac_blanche_f {};
	class Quiet_Cadillac_bleu_f: Quiet_Cadillac_blanche_f {};
	class Quiet_Cadillac_rouge_f: Quiet_Cadillac_blanche_f {};

	class Mrshounka_cayenne_p_civ
			{
				class trunk
				{
					civ = 45;
					west = 125;
					guer = 125;
				};
				class retrievePrice
				{
					civ = 550;
					west = 250;
					guer = 250;
				};
			};
	class Mrshounka_cayenne_p_bleufonce: Mrshounka_cayenne_p_civ {};
	class Mrshounka_cayenne_p_jaune: Mrshounka_cayenne_p_civ {};
	class Mrshounka_cayenne_p_rose: Mrshounka_cayenne_p_civ {};
	class Mrshounka_cayenne_p_grise: Mrshounka_cayenne_p_civ {};
	class Mrshounka_cayenne_p_violet: Mrshounka_cayenne_p_civ {};
	class Mrshounka_cayenne_p_orange: Mrshounka_cayenne_p_civ {};

	class Quiet_c65amg_blanche_f
	{
		class trunk
		{
			civ = 65;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class Quiet_c65amg_chrome_f: Quiet_c65amg_blanche_f {};
	class Quiet_c65amg_bleu_f: Quiet_c65amg_blanche_f {};
	class Quiet_c65amg_noir_f: Quiet_c65amg_blanche_f {};
	class Quiet_c65amg_rouge_f: Quiet_c65amg_blanche_f {};

	class shounka_limo_civ
	{
		class trunk
		{
			civ = 25;
			west = 125;
			guer = 125;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class shounka_limo_civ_bleufonce: shounka_limo_civ {};
	class shounka_limo_civ_jaune: shounka_limo_civ {};
	class shounka_limo_civ_rose: shounka_limo_civ {};
	class shounka_limo_civ_grise: shounka_limo_civ {};
	class shounka_limo_civ_violet: shounka_limo_civ {};
	class shounka_limo_civ_orange: shounka_limo_civ {};

	class Mrshounka_ducati_p
	{
		class trunk
		{
			civ = 15;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class Mrshounka_ducati_p_noir: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_bf: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_j: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_rose: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_g: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_v: Mrshounka_ducati_p {};
  class Mrshounka_ducati_p_o: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_noir: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_bf: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_j: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_rose: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_g: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_v: Mrshounka_ducati_p {};
	class Mrshounka_yamaha_p_o: Mrshounka_ducati_p {};

	class Mrshounka_bmwm1_civ
	{
		class trunk
		{
			civ = 45;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class Mrshounka_bmwm1_civ_noir: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_bleufonce: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_jaune: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_rose: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_grise: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_violet: Mrshounka_bmwm1_civ {};
	class Mrshounka_bmwm1_civ_orange: Mrshounka_bmwm1_civ {};

	class shounka_porsche911
	{
		class trunk
		{
			civ = 35;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class shounka_porsche911_noir: shounka_porsche911 {};
	class shounka_porsche911_bleufonce: shounka_porsche911 {};
	class shounka_porsche911_jaune: shounka_porsche911 {};
	class shounka_porsche911_rose: shounka_porsche911 {};
	class shounka_porsche911_grise: shounka_porsche911 {};
	class shounka_porsche911_violet: shounka_porsche911 {};
	class shounka_porsche911_orange: shounka_porsche911 {};

	class mrshounka_92_civ_noir
		{
			class trunk
			{
				civ = 35;
				west = 15;
				guer = 15;
			};
			class retrievePrice
			{
				civ = 550;
				west = 250;
				guer = 250;
			};
		};
	class mrshounka_92_civ_bleufonce: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_rouge: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_jaune: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_rose: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_grise: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_violet: mrshounka_92_civ_noir {};
	class mrshounka_92_civ_orange: mrshounka_92_civ_noir {};

	class shounka_gt
		{
			class trunk
			{
				civ = 45;
				west = 15;
				guer = 15;
			};
			class retrievePrice
			{
				civ = 550;
				west = 250;
				guer = 250;
			};
		};

	class shounka_gt_noir: shounka_gt {};
	class shounka_gt_bleufonce: shounka_gt {};
	class shounka_gt_rouge: shounka_gt {};
	class shounka_gt_jaune: shounka_gt {};
	class shounka_gt_rose: shounka_gt {};
	class shounka_gt_grise: shounka_gt {};
	class shounka_gt_violet: shounka_gt {};
	class shounka_gt_orange: shounka_gt {};

	class shounka_transam
	{
		class trunk
		{
			civ = 35;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};
	class shounka_transam_noir: shounka_transam {};
  class shounka_transam_bleufonce: shounka_transam {};
  class shounka_transam_jaune: shounka_transam {};
  class shounka_transam_rose: shounka_transam {};
  class shounka_transam_grise: shounka_transam {};
  class shounka_transam_violet: shounka_transam {};
  class shounka_transam_orange: shounka_transam {};
	class Mrshounka_a3_gtr_civ: shounka_transam {};
	class Mrshounka_a3_gtr_civ_noir: shounka_transam {};
	class Mrshounka_a3_gtr_civ_bleu: shounka_transam {};
	class shounka_mp4: shounka_transam {};
	class shounka_mp4_noir: shounka_transam {};
	class shounka_mp4_bleufonce: shounka_transam {};
	class shounka_mp4_jaune: shounka_transam {};
	class shounka_mp4_rose: shounka_transam {};
	class shounka_mp4_grise: shounka_transam {};
	class shounka_mp4_violet: shounka_transam {};
	class shounka_mp4_orange: shounka_transam {};

	class Quiet_v2_r8plus_blanche_f: shounka_transam {};
	class Quiet_v2_r8plus_chrome_f: shounka_transam {};
	class Quiet_v2_r8plus_bleu_f: shounka_transam {};
	class Quiet_v2_r8plus_noir_f: shounka_transam {};
	class Quiet_v2_r8plus_rouge_f: shounka_transam {};

	class mrshounka_huracan_c: shounka_transam {};
	class mrshounka_huracan_c_noir: shounka_transam {};
	class mrshounka_huracan_c_bleufonce: shounka_transam {};
	class mrshounka_huracan_c_jaune: shounka_transam {};
	class mrshounka_huracan_c_rose: shounka_transam {};
	class mrshounka_huracan_c_grise: shounka_transam {};
	class mrshounka_huracan_c_violet: shounka_transam {};
	class mrshounka_huracan_c_orange: shounka_transam {};

	class Mrshounka_lykan_c: shounka_transam {};
	class Mrshounka_lykan_c_noir: shounka_transam {};
	class Mrshounka_lykan_c_bleufonce: shounka_transam {};
	class Mrshounka_lykan_c_jaune: shounka_transam {};
	class Mrshounka_lykan_c_rose: shounka_transam {};
	class Mrshounka_lykan_c_grise: shounka_transam {};
	class Mrshounka_lykan_c_violet: shounka_transam {};
	class Mrshounka_lykan_c_orange: shounka_transam {};

  class Mrshounka_veneno_c: shounka_transam {};
	class Mrshounka_veneno_c_noir: shounka_transam {};
	class Mrshounka_veneno_c_bleu: shounka_transam {};
	class Mrshounka_veneno_c_jaune: shounka_transam {};
  class Mrshounka_agera_p: shounka_transam {};
	class Mrshounka_agera_p_noir: shounka_transam {};
	class Mrshounka_agera_p_bleu: shounka_transam {};
	class Mrshounka_agera_p_jaune: shounka_transam {};
	class Mrshounka_pagani_c: shounka_transam {};
	class Mrshounka_pagani_c_noir: shounka_transam {};
	class Mrshounka_pagani_c_bleufonce: shounka_transam {};
	class Mrshounka_pagani_c_jaune: shounka_transam {};
	class Mrshounka_pagani_c_rose: shounka_transam {};
	class Mrshounka_pagani_c_grise: shounka_transam {};
	class Mrshounka_pagani_c_violet: shounka_transam {};
	class Mrshounka_pagani_c_orange: shounka_transam {};
	class quiet_Bugatti_blanche_f: shounka_transam {};

	class shounka_a3_suburbangign_transport: shounka_transam {};
	class quiet_sub2015_noir_f: shounka_transam {};
	class Quiet_Cadillac_noir_f: shounka_transam {};
	class shounka_limo_civ_noir: shounka_transam {};
	class Mrshounka_jeep_blinde_noir: shounka_transam {};


	class	C_Scooter_Transport_01_F
		{
			class trunk
			{
				civ = 20;
				west = 15;
				guer = 15;
			};
			class retrievePrice
			{
				civ = 550;
				west = 250;
				guer = 250;
			};
		};

	class C_Rubberboat
	{
		class trunk
		{
			civ = 100;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class AN_CIV_BOAT
	{
		class trunk
		{
			civ = 300;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class AN_SPE_BOAT
	{
		class trunk
		{
			civ = 400;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};

	class C_Boat_Civil_01_F
	{
		class trunk
		{
			civ = 250;
			west = 15;
			guer = 15;
		};
		class retrievePrice
		{
			civ = 550;
			west = 250;
			guer = 250;
		};
	};


	class LandRover_CZ_EP1
	{
		class trunk
		{
			civ = 85;
			west = 85;
			guer = 85;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class BAF_Offroad_W
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class ivory_c
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_m3
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class AN_EMS_RHIB
	{
		class trunk
		{
			civ = 0;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class guer
			{
				class EMS
				{
					name = "Search&Rescue";
					textures[] = {"AN_T_EMS\Data\EMS_SR_RHIB_hull_CO.paa","AN_T_EMS\Data\EMS_SR_RHIB_superstructure_CO.paa"};
				};
			};
		};
	};

	class IVORY_REV
	{
		class trunk
		{
			civ = 35;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_elise
	{
		class trunk
		{
			civ = 35;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_evox
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_supra_tuned
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_lfa
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_isf
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class IVORY_R8
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class IVORY_R8SPYDER
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class ivory_lp560
	{
		class trunk
		{
			civ = 55;
			west = 55;
			guer = 55;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class Jonzie_30CSL
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};
	class Jonzie_Corolla
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Datsun_510
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Datsun_Z432
	{
		class trunk
		{
			civ = 20;
			west = 20;
			guer = 20;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Escalade
	{
		class trunk
		{
			civ = 80;
			west = 80;
			guer = 80;
		};
		class retrievePrice
		{
			civ = 200;
			west = 200;
			guer = 200;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Mini_Cooper
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 120;
			west = 120;
			guer = 120;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Galant
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 120;
			west = 120;
			guer = 120;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_STI
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 250;
			west = 250;
			guer = 250;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Raptor
	{
		class trunk
		{
			civ = 80;
			west = 80;
			guer = 80;
		};
		class retrievePrice
		{
			civ = 170;
			west = 170;
			guer = 170;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class C_Hatchback_01_sport_F
	{
		class trunk
		{
			civ = 70;
			west = 70;
			guer = 70;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class textures
		{
			class civ
			{
				class silver
				{
					name = "Silver";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_co.paa"};
				};

				class beige
				{
					name = "Beige";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"};
				};

				class green
				{
					name = "Green";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"};
				};

				class blue
				{
					name = "Blue";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"};
				};

				class darkblue
				{
					name = "Dark Blue";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"};
				};

				class lightyellow
				{
					name = "Light Yellow";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base05_co.paa"};
				};

				class yellow
				{
					name = "Yellow";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"};
				};

				class white
				{
					name = "White";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"};
				};

				class grey
				{
					name = "Grey";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"};
				};

				class Black
				{
					name = "Black";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"};
				};

				class sportred
				{
					name = "Hot Red";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"};
				};

				class sportblue
				{
					name = "Cool Blue";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"};
				};

				class sportyellow
				{
					name = "Skinny Yellow";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"};
				};

				class sportwhite
				{
					name = "Flash White";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"};
				};

				class sportbeige
				{
					name = "Old Fashion Beige";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"};
				};

				class sportgreen
				{
					name = "Lime Green";
					textures[] = {"\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"};
				};
			};
		};
	};
	class Jonzie_Viper
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 300;
			west = 300;
			guer = 300;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class Jonzie_Quattroporte
	{
		class trunk
		{
			civ = 25;
			west = 25;
			guer = 25;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class C_Kart_01_Blu_F
	{
		class trunk
		{
			civ = 5;
			west = 5;
			guer = 5;
		};
		class retrievePrice
		{
			civ = 50;
			west = 50;
			guer = 50;
		};
	};
	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {};
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {};
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {};
	/*----------------------------------MEDIC VEHICLES---------------------------*/
	class Jonzie_Ambulance
	{
		class trunk
		{
			civ = 80;
			west = 80;
			guer = 80;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 100;
		};
	};
	class I_Truck_02_medical_F
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class O_Truck_03_medical_F
	{
		class trunk
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class B_Truck_01_medical_F
	{
		class trunk
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class EWK_HMMWV_Medevac
	{
		class trunk
		{
			civ = 120;
			west = 120;
			guer = 120;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class C_Boat_civil_01_rescue_F: C_Boat_Civil_01_F{};
	class ivory_b206_rescue: C_Boat_Civil_01_F{};
	class	IVORY_BELL512_RESCUE: C_Boat_Civil_01_F{};

	class EWK_M997A2_Ambulance
	{
		class trunk
		{
			civ = 110;
			west = 110;
			guer = 110;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class EWK_M997A2_Ambulance_Tan
	{
		class trunk
		{
			civ = 110;
			west = 110;
			guer = 110;
		};
		class retrievePrice
		{
			civ = 150;
			west = 150;
			guer = 150;
		};
	};
	class ivory_wrx_fastresponse_ems
	{
		class trunk
		{
			civ = 50;
			west = 50;
			guer = 50;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class AN_MED_M3_M
	{
		class trunk
		{
			civ = 50;
			west = 50;
			guer = 50;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class ivory_wrx_command_ems
	{
		class trunk
		{
			civ = 90;
			west = 90;
			guer = 90;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};
	/*-----------------------------TRUCKING------------------------*/
	class Jonzie_Transit
	{
		class trunk
		{
			civ = 200;
			west = 200;
			guer = 200;
		};
		class retrievePrice
		{
			civ = 200;
			west = 200;
			guer = 200;
		};
		class textures
		{
			class civ
			{
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
				class navyblue
				{
					name = "Navy Blue";
					textures[] = {"#(argb,8,8,3)color(0,0,1,1)"};
				};
			};
		};
	};
	class C_Van_01_box_F
	{
		class trunk
		{
			civ = 200;
			west = 250;
			east = 250;
			guer = 250;
		};
		class retrievePrice
		{
			civ = 250;
			west = 250;
			east = 250;
			guer = 250;
		};
		class textures
		{
			class civ
			{
				class white
				{
					name = "White";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
				};

				class red
				{
					name = "Red";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
				};

				class Black
				{
					name = "Black";
					textures[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_Black_co.paa"};
				};
			};
		};
	};
	//Zamak Transport
	class I_Truck_02_transport_F
	{
		class trunk
		{
			civ = 400;
			west = 400;
			guer = 400;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		class textures
		{
			class civ
			{
				class orange
				{
					name = "Orange";
					textures[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
				};
			};
		};
	};
	//Zamak Transport Covered
	class I_Truck_02_covered_F
	{
		class trunk
		{
			civ = 300;
			west = 300;
			guer = 300;
		};
		class retrievePrice
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class textures
		{
			class civ
			{
				class orange
				{
					name = "Orange";
					textures[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
				};
			};
		};
	};
	class O_Truck_02_covered_F
	{
		class trunk
		{
			civ = 300;
			west = 300;
			guer = 300;
		};
		class retrievePrice
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class textures
		{
			class civ
			{
				class orange
				{
					name = "Orange";
					textures[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
				};
			};
		};
	};


	//HEMTT Transport
	class B_Truck_01_transport_F
	{
		class trunk
		{
			civ = 550;
			west = 550;
			guer = 550;
		};
		class retrievePrice
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"};
				};
			};
		};
	};
	//Tempest Transport
	class O_Truck_03_transport_F
	{
		class trunk
		{
			civ = 700;
			west = 700;
			guer = 700;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_cover_co.paa"};
				};
			};
		};
	};
	//Tempest Transport Covered
	class O_Truck_03_covered_F
	{
		class trunk
		{
			civ = 700;
			west = 700;
			guer = 700;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_cargo_co.paa"};
				};
			};
		};
	};
	//HEMTT Box Transport
	class B_Truck_01_box_F
	{
		class trunk
		{
			civ = 700;
			west = 700;
			east = 700;
			guer = 700;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			east = 1000;
			guer = 1000;
		};
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa"};
				};
			};
		};
	};
	//Tempest Device
	class O_Truck_03_device_F
	{
		class trunk
		{
			civ = 700;
			west = 700;
			guer = 700;
		};

		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\A3\Soft_F_EPC\Truck_03\data\truck_03_ext01_co.paa","\A3\Soft_F_EPC\Truck_03\data\truck_03_ext02_co.paa"};
				};
			};
		};
	};
	//Zamak Fuel
	class O_Truck_02_fuel_F
	{
		class trunk
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	//Tempest Fuel
	class O_Truck_03_fuel_F
	{
		class trunk
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	//HEMTT Fuel
	class B_Truck_01_fuel_F
	{
		class trunk
		{
			civ = 600;
			west = 600;
			guer = 600;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	/*---------------REBEL VEHICLES------------------------*/
	class B_G_Offroad_01_F
	{
		class trunk
		{
			civ = 20;
			west = 20;
			guer = 20;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class C_Offroad_02_unarmed_blue_F
	{
		class trunk
		{
			civ = 60;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class C_Offroad_02_unarmed_black_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_green_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_orange_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_red_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_white_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_brown_F: C_Offroad_02_unarmed_blue_F{};
	class C_Offroad_02_unarmed_olive_F: C_Offroad_02_unarmed_blue_F{};

	class LandRover_ACR
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};
	class Kangaro0_Q7_Yellow
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};
	class Kangaro0_Q7_Violet: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_Navy: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_Red: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_LightGreen: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_Cream: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_LightBlue: Kangaro0_Q7_Yellow {};
	class Kangaro0_Q7_Green: Kangaro0_Q7_Yellow {};
	class LandRover_MG_TK_EP1
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};

	class Mrshounka_a3_smart_civ
	{
		class trunk
		{
			civ = 10;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
	};

	class Mrshounka_a3_smart_civ_noir: Mrshounka_a3_smart_civ {};
	class Mrshounka_a3_smart_civ_bleu: Mrshounka_a3_smart_civ {};


	class Mrshounka_c4_p_civ
	{
		class trunk
		{
			civ = 15;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
};
	class Mrshounka_c4_p_bleufonce: Mrshounka_c4_p_civ {};
	class Mrshounka_c4_p_jaune: Mrshounka_c4_p_civ {};
	class Mrshounka_c4_p_rose: Mrshounka_c4_p_civ {};
	class Mrshounka_c4_p_grise: Mrshounka_c4_p_civ {};
	class Mrshounka_c4_p_violet: Mrshounka_c4_p_civ {};
	class Mrshounka_c4_p_orange: Mrshounka_c4_p_civ {};


		class Mrshounka_r5_civ
		{
			class trunk
			{
				civ = 20;
				west = 40;
				guer = 40;
			};
			class retrievePrice
			{
				civ = 500;
				west = 500;
				guer = 500;
			};
		};
	class Mrshounka_r5_noir: Mrshounka_r5_civ {};
	class Mrshounka_r5_bleufonce: Mrshounka_r5_civ {};
	class Mrshounka_r5_jaune: Mrshounka_r5_civ {};
	class Mrshounka_r5_rose: Mrshounka_r5_civ {};
	class Mrshounka_r5_grise: Mrshounka_r5_civ {};
	class Mrshounka_r5_violet: Mrshounka_r5_civ {};
	class Mrshounka_r5_orange: Mrshounka_r5_civ {};

	class Mrshounka_twingo_p
		{
		class trunk
		{
			civ = 20;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		};
		class Mrshounka_twingo_p_noir: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_bf: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_r: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_j: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_rose: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_g: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_v: Mrshounka_twingo_p {};
		class Mrshounka_twingo_p_o: Mrshounka_twingo_p {};

		class Mrshounka_207_civ
			{
			class trunk
			{
				civ = 30;
				west = 40;
				guer = 40;
			};
			class retrievePrice
			{
				civ = 500;
				west = 500;
				guer = 500;
				};
			};
		class Mrshounka_207_noir: Mrshounka_207_civ {};
    class Mrshounka_207_bleufonce: Mrshounka_207_civ {};
    class Mrshounka_207_jaune: Mrshounka_207_civ {};
    class Mrshounka_207_rose: Mrshounka_207_civ {};
    class Mrshounka_207_grise: Mrshounka_207_civ {};
    class Mrshounka_207_violet: Mrshounka_207_civ {};
    class Mrshounka_207_orange: Mrshounka_207_civ {};

  	class Mrshounka_a3_ds3_civ
					{
					class trunk
					{
						civ = 30;
						west = 40;
						guer = 40;
					};
					class retrievePrice
						{
						civ = 500;
						west = 500;
						guer = 500;
						};
					};

		class Mrshounka_a3_ds3_civ_noir: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_bleufonce: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_civ_jaune: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_civ_rose: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_civ_grise: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_civ_violet: Mrshounka_a3_ds3_civ {};
		class Mrshounka_a3_ds3_civ_civ_orange: Mrshounka_a3_ds3_civ {};
	  class shounka_a3_cliors_civ: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_noir: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_bleufonce: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_jaune: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_rose: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_grise: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_violet: Mrshounka_a3_ds3_civ {};
		class shounka_a3_cliors_civ_orange: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_civ: Mrshounka_a3_ds3_civ {};

		class Mrshounka_megane_rs_2015_noir: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_bleufonce: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_rouge: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_jaune: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_rose: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_grise: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_violet: Mrshounka_a3_ds3_civ {};
		class Mrshounka_megane_rs_2015_orange: Mrshounka_a3_ds3_civ {};


	  class Mrshounka_Alfa_Romeo_civ: Mrshounka_a3_ds3_civ {};
		class Mrshounka_Alfa_Romeo_noir: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_bleufonce: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_jaune: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_rose: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_grise: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_violet: Mrshounka_a3_ds3_civ {};
    class Mrshounka_Alfa_Romeo_orange: Mrshounka_a3_ds3_civ {};

			class Mrshounka_a3_308_civ_noir
					{
						class trunk
						{
							civ = 45;
							west = 40;
							guer = 40;
						};
						class retrievePrice
						{
							civ = 500;
							west = 500;
							guer = 500;
						};
					};
			class Mrshounka_a3_308_civ_bleufonce: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_rouge: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_jaune: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_rose: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_grise: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_violet: Mrshounka_a3_308_civ_noir {};
      class Mrshounka_a3_308_civ_orange: Mrshounka_a3_308_civ_noir {};

			class shounka_a3_ds4_civ
						{
							class trunk
							{
								civ = 45;
								west = 40;
								guer = 40;
							};
							class retrievePrice
							{
								civ = 500;
								west = 500;
								guer = 500;
							};
						};
		class shounka_a3_ds4_noir: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_bleufonce: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_jaune: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_rose: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_grise: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_violet: shounka_a3_ds4_civ {};
		class shounka_a3_ds4_orange: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_civ: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_noir: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_bleufonce: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_rouge: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_jaune: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_rose: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_grise: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_violet: shounka_a3_ds4_civ {};
		class Mrshounka_mercedes_190_p_orange: shounka_a3_ds4_civ {};

		class shounka_a3_peugeot508_civ
				{
					class trunk
					{
						civ = 35;
						west = 40;
						guer = 40;
					};
					class retrievePrice
					{
						civ = 500;
						west = 500;
						guer = 500;
					};
				};
		class shounka_a3_peugeot508_civ_noir: shounka_a3_peugeot508_civ {};
    class shounka_a3_peugeot508_civ_bleufonce: shounka_a3_peugeot508_civ {};
    class shounka_a3_peugeot508_civ_rouge: shounka_a3_peugeot508_civ {};
	  class shounka_a3_peugeot508_civ_jaune: shounka_a3_peugeot508_civ {};
	  class shounka_a3_peugeot508_civ_rose: shounka_a3_peugeot508_civ {};
	  class shounka_a3_peugeot508_civ_grise: shounka_a3_peugeot508_civ {};
	  class shounka_a3_peugeot508_civ_violet: shounka_a3_peugeot508_civ {};
	  class shounka_a3_peugeot508_civ_orange: shounka_a3_peugeot508_civ {};

		class Mrshounka_golfvi_civ
					{
						class trunk
						{
							civ = 35;
							west = 40;
							guer = 40;
						};
						class retrievePrice
						{
							civ = 500;
							west = 500;
							guer = 500;
						};
					};
		class Mrshounka_golfvi_noir: Mrshounka_golfvi_civ {};
    class Mrshounka_golfvi_bleufonce: Mrshounka_golfvi_civ {};
    class Mrshounka_golfvi_jaune: Mrshounka_golfvi_civ {};
    class Mrshounka_golfvi_rose: Mrshounka_golfvi_civ {};
    class Mrshounka_golfvi_grise: Mrshounka_golfvi_civ {};
	  class Mrshounka_golfvi_violet: Mrshounka_golfvi_civ {};
    class Mrshounka_golfvi_orange: Mrshounka_golfvi_civ {};


		class Mrshounka_subaru08_civ
						{
							class trunk
							{
								civ = 65;
								west = 40;
								guer = 40;
							};
							class retrievePrice
							{
								civ = 500;
								west = 500;
								guer = 500;
							};
						};
		class Mrshounka_subaru08_noir: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_bleufonce: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_jaune: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_rose: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_grise: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_violet: Mrshounka_subaru08_civ {};
    class Mrshounka_subaru08_orange: Mrshounka_subaru08_civ {};
		class shounka_clk: Mrshounka_subaru08_civ {};
		class shounka_clk_noir: Mrshounka_subaru08_civ {};
    class shounka_clk_bleufonce: Mrshounka_subaru08_civ {};
    class shounka_clk_jaune: Mrshounka_subaru08_civ {};
    class shounka_clk_rose: Mrshounka_subaru08_civ {};
    class shounka_clk_grise: Mrshounka_subaru08_civ {};
    class shounka_clk_violet: Mrshounka_subaru08_civ {};
    class shounka_clk_orange: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_civ: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_noir: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_bleufonce: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_jaune: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_rose: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_grise: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_violet: Mrshounka_subaru08_civ {};
		class Mrshounka_evox_orange: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_noir: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_bleufonce: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_jaune: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_rose: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_grise: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_violet: Mrshounka_subaru08_civ {};
		class Mrshounka_rs4_civ_orange: Mrshounka_subaru08_civ {};

		class shounka_rs6
			{
				class trunk
				{
					civ = 55;
					west = 40;
					guer = 40;
				};
				class retrievePrice
				{
					civ = 500;
					west = 500;
					guer = 500;
				};
			};
    class shounka_rs6_bleufonce: shounka_rs6 {};
		class shounka_rs6_noir: shounka_rs6 {};
    class shounka_rs6_jaune: shounka_rs6 {};
    class shounka_rs6_rose: shounka_rs6 {};
    class shounka_rs6_grise: shounka_rs6 {};
    class shounka_rs6_violet: shounka_rs6 {};
    class shounka_rs6_orange: shounka_rs6 {};







	/*--------------------RDM Zone-----------------*/
	class O_MRAP_02_F
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
	};
	class O_T_LSV_02_unarmed_F
	{
		class trunk
		{
			civ = 20;
			west = 20;
			guer = 20;
		};
		class retrievePrice
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
	};
	/*---------------TSF VEHICLES---------------*/
	class DAR_MaxxProDeploy
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class B_MRAP_01_F
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
		class textures
		{
			class west
			{
				class tsf
				{
					name = "TSF Black";
					textures[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
				};
			};
		};
	};
	class LandRover_TK_CIV_EP1
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_Evo_M
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class B_T_LSV_01_unarmed_F
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};


	class AN_TSO_Evo_ST
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_WRX_st
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_WRX_Marked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Ivory_evox_unmarked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
		class textures
		{
			class west
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
	};

	class Ivory_wrx_unmarked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class textures
		{
			class west
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Ivory_isf_unmarked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class textures
		{
			class west
			{
				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Ivory_m3_unmarked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class textures
		{
			class west
			{

				class Black
				{
					name = "Black";
					textures[] = {"#(argb,8,8,3)color(0,0,0,1)"};
				};
				class yellow
				{
					name = "Yellow";
					textures[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
				};
				class aqua
				{
					name = "Aqua";
					textures[] = {"#(argb,8,8,3)color(0.215686,0.94902,0.933333,1)"};
				};
				class pink
				{
					name = "Pink";
					textures[] = {"#(argb,8,8,3)color(0.945098,0.494118,0.996078,1)"};
				};
				class purple
				{
					name = "Purple";
					textures[] = {"#(argb,8,8,3)color(0.556863,0.00392157,0.619608,1)"};
				};
				class green
				{
					name = "Green";
					textures[] = {"#(argb,8,8,3)color(0,1,0.25098,1)"};
				};
				class lightgreen
				{
					name = "Light Green";
					textures[] = {"#(argb,8,8,3)color(0,0.54902,0.137255,1)"};
				};
			};
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_a3_308_gend
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_rs_2015_g
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class shounka_a3_508gend
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_M3_M
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_M3_ST
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_ISF_ST
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class AN_TSO_ISF_M
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_bmw_gend
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class shounka_a3_gendsprinter
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_Volkswagen_Touareg_police_police
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class Mrshounka_tahoe
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_ducati_police_p
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_cayman_z
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_agera_gend_p
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class shounka_a3_508banalise
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_rs4_gend_p_blanc
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_rs4_gend_p_noir
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_rs4_gend_p_jaune
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_rs4_gend_p_bleufonce
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_a3_dodge15_pol
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class Mrshounka_a3_dodge15_pol2
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};

	class EC635_TSO
	{
		class trunk
		{
			civ = 0;
			west = 40;
			guer = 00;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};


	class B_Heli_Light_01_stripped_F
	{
		class trunk
		{
			civ = 0;
			west = 0;
			guer = 0;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class shounka_a3_pompier_sprinter
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class shounka_nemo_pompier
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class AN_AERT_ORCA
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class AN_ERT_bird
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};


	class ivory_wrx_tsfi_marked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class ivory_wrx_tsfc_marked
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class EWK_HMMWV_Light
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	/*---------------UN VEHICLES---------------*/
	class sab_UN_SUV
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};
	class sab_UN_Hunter
	{
		class trunk
		{
			civ = 60;
			west = 60;
			guer = 60;
		};
		class retrievePrice
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
	};
	class sab_UN_Truck_O
	{
		class trunk
		{
			civ = 400;
			west = 400;
			guer = 400;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_Truck_C
	{
		class trunk
		{
			civ = 500;
			west = 500;
			guer = 500;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_Truck_Medi
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_Truck_Ammo
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_Truck_Rep
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_Truck_Fuel
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class ivory_wrx_UNC_marked
	{
		class trunk
		{
			civ = 40;
			west = 40;
			guer = 40;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	class sab_UN_UGV {};
	class sab_UN_Offroad_gun
	{
		class trunk
		{
			civ = 10;
			west = 10;
			guer = 10;
		};
		class retrievePrice
		{
			civ = 500;
			west = 100;
			guer = 500;
		};
	};
	/*---------------HELICOPTERS & OTHER AIR---------------*/
	//Orca Helicopter
	class O_Heli_Light_02_unarmed_F
	{
		class trunk
		{
			civ = 300;
			west = 300;
			guer = 300;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
		class textures
		{
			class civ
			{
				class bluewhite
				{
					name = "White / Blue";
					textures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
				};
				class orca
				{
					name = "Orca";
					textures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};
				};
			};
			class reb
			{
				class digitalgreen
				{
					name = "Digital Green";
					textures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
				};
				class desertdigi
				{
					name = "Desert Digital";
					textures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"};
				};
			};
		};
	};

//Planes

class C_Plane_Civil_01_F
	{
	class trunk
	{
		civ = 200;
		west = 200;
		guer = 200;
	};
	class retrievePrice
	{
		civ = 1500;
		west = 1500;
		guer = 1500;
	};
	class textures
	{
		class civ
		{
			class Race1
			{
				name = "Racing 1";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};
			class Race2
			{
				name = "Racing 2";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};
			class Redline1
			{
				name = "Redline 1";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};
			class Redline2
			{
				name = "Redline 2";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};
			class Tribal1
			{
				name = "Tribal 1";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};
			class Tribal2
			{
				name = "Tribal 2";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};
			class Wave1
			{
				name = "Wave 1";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};
			};
			class Wave2
			{
				name = "Wave 2";
				textures[] = {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};
			};
		};
	};
};

	// Mohawk Helicopter
	class I_Heli_Transport_02_F
	{
		class trunk
		{
			civ = 1500;
			west = 1500;
			guer = 1500;
		};
		class retrievePrice
		{
			civ = 1500;
			west = 1500;
			guer = 1500;
		};
		class textures
		{
			class civ
			{
				class ion
				{
					name = "Ion";
					textures[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"};
				};
				class dahoman
				{
					name = "Dahoman";
					textures[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"};
				};
			};
			class reb
			{
				class digitalgreen
				{
					name = "Digital Green";
					textures[] = {"\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_indp_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_indp_co.paa"};
				};
			};
		};
	};
  // MH-9 Hummingbird
  class B_Heli_Light_01_F
  {
    class trunk
    {
      civ = 25;
      west = 25;
      guer = 25;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
    class textures
    {
			class civ
			{
				class blue
				{
					name = "Blue";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
				};
				class red
				{
					name = "Red";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
				};
				class blueline
				{
					name = "Blueline";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"};
				};
				class elliptical
				{
					name = "Elliptical";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
				};
				class furious
				{
					name = "Furious";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
				};
				class bluejeans
				{
					name = "Jeans Blue";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
				};
				class speedyredline
				{
					name = "Speedy Redline";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
				};
				class sunset
				{
					name = "Sunset";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
				};
				class vrana
				{
					name = "Vrana";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
				};
				class wavesblue
				{
					name = "Waves Blue";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
				};
			};
			class reb
			{
				class rebeldigital
				{
					name = "Rebel Digital";
					textures[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
				};
			};
      class west
      {
        class Black
        {
          name = "Black";
          textures[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
        };
      };
      class guer
      {
        class med
        {
          name = "EMS Red";
          textures[] = {"#(argb,8,8,3)color(0.952941,0.00392157,0.00392157,1)"};
        };
      };
    };
  };
	//UN Orca
	class sab_UN_Heli
	{
		class trunk
    {
      civ = 200;
      west = 200;
      guer = 200;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//UN Mohawk
	class sab_UN_Large_Heli
	{
		class trunk
    {
      civ = 500;
      west = 500;
      guer = 500;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//UN M900
	class sab_UN_bird_civil
	{
		class trunk
    {
      civ = 60;
      west = 60;
      guer = 60;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//UN Hummingbird
	class sab_UN_bird
	{
		class trunk
    {
      civ = 80;
      west = 80;
      guer = 80;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//UN Full Taru
	class sab_UN_Taru
	{
		class trunk
    {
      civ = 10;
      west = 10;
      guer = 10;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//UN Taru Bench
	class sab_UN_TaruB
	{
		class trunk
    {
      civ = 80;
      west = 80;
      guer = 80;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	class sab_UN_UAV {};
	//UN Pawnee
	class sab_UN_pawnee
	{
		class trunk
    {
      civ = 10;
      west = 10;
      guer = 10;
    };
    class retrievePrice
    {
      civ = 1500;
      west = 1000;
      guer = 1000;
    };
	};
	//Huron Black Unarmed
	class B_Heli_Transport_03_unarmed_F
	{
		class trunk
    {
      civ = 700;
      west = 700;
      guer = 700;
    };
    class retrievePrice
    {
      civ = 5000;
      west = 1000;
      guer = 1000;
    };
		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_co.paa"};
				};

				class Black
				{
					name = "Black";
					textures[] = {"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_Black_co.paa","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_Black_co.paa"};
				};
			};
		};
	};
	//Hellcat Unarmed
	class I_Heli_light_03_unarmed_F
	{
		class trunk
		{
			civ = 100;
			west = 100;
			guer = 100;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	//Taru
	class O_Heli_Transport_04_F
	{
		class trunk
		{
			civ = 10;
			west = 10;
			guer = 10;
		};

		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};

		class textures
		{
			class civ
			{
				class default
				{
					name = "Default";
					textures[] = {"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa"};
				};

				class Black
				{
					name = "Black";
					textures[] = {"\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa","\a3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_Black_co.paa"};
				};
			};
		};
	};
	//Taru Bench
	class O_Heli_Transport_04_bench_F
	{
		class trunk
		{
			civ = 10;
			west = 10;
			guer = 10;
		};

		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	//Taru Transport
	class O_Heli_Transport_04_covered_F
	{
		class trunk
		{
			civ = 600;
			west = 600;
			guer = 600;
		};

		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
	//Taru Cargo
	class O_Heli_Transport_04_box_F
	{
		class trunk
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
		class retrievePrice
		{
			civ = 1000;
			west = 1000;
			guer = 1000;
		};
	};
};
