class CfgGather {
	class Altis {
		class Resources {
			class apple {
				amount = 3;
				zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};

			class peach {
				amount = 3;
				zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};
			
			class grapes {
				amount = 2;
				zones[] = { "grape_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};
			
			class pfeffer {
				amount = 3;
				zones[] = { "pfeffer_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class pilz {
				amount = 1;
				zones[] = { "pilz_1" };
				item = "";
				zoneSize = 75;
				sleep = 1;
			};
			
			class muschel {
				amount = 1;
				zones[] = { "muschel_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class kartoffel {
				amount = 1;
				zones[] = { "kartoffel_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class salat {
				amount = 1;
				zones[] = { "salat_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class zimt {
				amount = 1;
				zones[] = { "zimt_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class curry {
				amount = 1;
				zones[] = { "curry_1" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};

			class heroinu {
				amount = 1;
				zones[] = { "heroin_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};

			class cocaine {
				amount = 1;
				zones[] = { "cocaine_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};

			class cannabis {
				amount = 1;
				zones[] = { "weed_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class methst {
				amount = 1;
				zones[] = { "meth_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class kroete {
				amount = 1;
				zones[] = { "kroete_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class zaupilz {
				amount = 1;
				zones[] = { "zaupilz_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class uranium1 {
				amount = 1;
				zones[] = { "uran_1" };
				item = "";
				zoneSize = 150;
				sleep = 1.5;
			};
		};		
/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
    };
    This will give :
    25(±1)% to copper_unrefined;
    70(±1)% to iron_unrefined;
    5%(±1)% to diamond_uncut;

                                                         ! Watch Out !
 If percents are used,you MUST put more than 1 resource in the mined parameter
 mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
 mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
 mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
 mined[] = { "copper_unrefined" }; OK
 mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/
		class Minerals {
			class copperore {
				amount = 2;
				zones[] = { "lead_1" };
				item = "pickaxe";
				mined[] = {"copperore"};
				zoneSize = 30;
				sleep = 1.25;
			};

			class ironore {
				amount = 2;
				zones[] = { "iron_1" };
				item = "pickaxe";
				mined[] = { "ironore" };
				zoneSize = 30;
				sleep = 1.25;
			};

			class salt {
				amount = 4;
				zones[] = { "salt_1" };
				item = "pickaxe";
				mined[] = { "salt" };
				zoneSize = 120;
				sleep = 1.25;
			};

			class sand {
				amount = 4;
				zones[] = { "sand_1" };
				item = "pickaxe";
				mined[] = { "sand" };
				zoneSize = 75;
				sleep = 1.25;
			};

			class diamond {
				amount = 1;
				zones[] = { "diamond_1" };
				item = "pickaxe";
				mined[] = { "diamond" };
				zoneSize = 50;
				sleep = 1.25;
			};

			class rock {
				amount = 2;
				zones[] = { "rock_1" };
				item = "pickaxe";
				mined[] = { "rock" };
				zoneSize = 50;
				sleep = 1.25;
			};

			class oilu {
				amount = 1;
				zones[] = { "oil_1", "oil_2" };
				item = "pickaxe";
				mined[] = { "oilu" };
				zoneSize = 40;
				sleep = 1.25;
			};
			
			class golderz {
				amount = 2;
				zones[] = { "golderz_1" };
				item = "pickaxe";
				mined[] = { "golderz" };
				zoneSize = 50;
				sleep = 1.25;
			};
			
			class silbererz {
				amount = 2;
				zones[] = { "silbererz_1" };
				item = "pickaxe";
				mined[] = { "silbererz" };
				zoneSize = 50;
				sleep = 1.25;
			};
			
			class Schatz_Rechts {
				amount = 1;
				zones[] = { "schatzinsel_1" };
				item = "shovel";
				mined[] = {};
				zoneSize = 330;
				sleep = 4;
			};
			
			class Schatz_Links {
				amount = 1;
				zones[] = { "schatzinsel_2" };
				item = "shovel";
				mined[] = {};
				zoneSize = 450;
				sleep = 4;
			};
		};	
	};
	
	class Tanoa {
		class Resources {
			class kokos {
				amount = 3;
				zones[] = { "kokos_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};

			class banana {
				amount = 3;
				zones[] = { "banana_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};
			
			class melon {
				amount = 1;
				zones[] = { "melon_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 0.5;
			};
			
			class kautschuk {
				amount = 2;
				zones[] = { "kautschuk_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 1.25;
			};
			
			class kakao {
				amount = 2;
				zones[] = { "kakao_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 1;
			};
			
			class tabak {
				amount = 3;
				zones[] = { "tabak_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};
			
			class zuckerrohr {
				amount = 2;
				zones[] = { "zuckerrohr_1_text" };
				item = "";
				zoneSize = 75;
				sleep = 0.75;
			};

			class kroko {
				amount = 1;
				zones[] = { "kroko_1_text" };
				item = "";
				zoneSize = 150;
				sleep = 1;
			};

			class anakonda {
				amount = 1;
				zones[] = { "anakonda_1_text" };
				item = "";
				zoneSize = 150;
				sleep = 1;
			};

			class kriegsschrott {
				amount = 1;
				zones[] = { "kriegsschrott_1_text" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class schlafmohn {
				amount = 1;
				zones[] = { "schlafmohn_1_text" };
				item = "";
				zoneSize = 150;
				sleep = 1.25;
			};
			
			class relikt {
				amount = 1;
				zones[] = { "relikt_1_text" };
				item = "";
				zoneSize = 150;
				sleep = 1.5;
			};
		};
	
		class Minerals {
			class platin {
				amount = 2;
				zones[] = { "platin_1_text" };
				item = "pickaxe";
				mined[] = {"platin"};
				zoneSize = 50;
				sleep = 1.25;
			};

			class kohle {
				amount = 3;
				zones[] = { "kohle_1_text" };
				item = "pickaxe";
				mined[] = { "kohle" };
				zoneSize = 50;
				sleep = 1.25;
			};

			class magma {
				amount = 1;
				zones[] = { "magma_1_text" };
				item = "pickaxe";
				mined[] = { "magma" };
				zoneSize = 50;
				sleep = 1.25;
			};

			class tropenholz {
				amount = 2;
				zones[] = { "tropenholz_1_text" };
				item = "pickaxe";
				mined[] = { "tropenholz" };
				zoneSize = 50;
				sleep = 1.25;
			};

			class lehm {
				amount = 3;
				zones[] = { "lehm_1_text" };
				item = "pickaxe";
				mined[] = { "lehm" };
				zoneSize = 50;
				sleep = 1.25;
			};
		};
	};
};