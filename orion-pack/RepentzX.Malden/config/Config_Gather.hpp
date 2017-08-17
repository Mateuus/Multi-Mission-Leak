class CfgGather {
    class Resources {
        class apple {
            amount = 3;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
            zoneSize = 30;
        };

        class peach {
            amount = 3;
            zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
            item = "";
            zoneSize = 30;
        };

        class heroin_unprocessed {
            amount = 1;
            zones[] = { "heroin_1" };
            item = "";
            zoneSize = 30;
        };

        class cocaine_unprocessed {
            amount = 1;
            zones[] = { "cocaine_1" };
            item = "";
            zoneSize = 30;
        };

        class cannabis {
            amount = 1;
            zones[] = { "weed_1" };
            item = "";
            zoneSize = 30;
        };

        class MDMA {
            amount = 1;
            zones[] = { "MDMA_1" };
            item = "";
            zoneSize = 30;
        };
        

        //custom

		class rubberU
		{
			amount = 2;
			zones[] = { "rubber_1" };
			item = "";
            zoneSize = 30;
		};

		class goldcoin
		{
			amount = 1;
			zones[] = { "goldcoin_1" };
			item = "";
            zoneSize = 30;
		};

		class sulfur
		{
			amount = 2;
			zones[] = { "sulfur_1" };
			item = "";
            zoneSize = 30;
		};

		class nitroamine
		{
			amount = 1;
			zones[] = { "nitroamine_1" };
			item = "";
            zoneSize = 30;
		};

		class steel
		{
			amount = 2;
			zones[] = { "steel_1" };
			item = "";
            zoneSize = 30;
		};

		class wool
		{
			amount = 3;
			zones[] = { "wool_1" };
			item = "";
            zoneSize = 30;
		};

        class uraniumU {
            amount = 1;
            zones[] = { "uranium_1" };
            item = "pdrill";
            //skill = 1;
            zoneSize = 30;
        };

        class mushrooms {
            amount = 1;
            zones[] = { "lsd_1" };
            //skill2 = 1;
            zoneSize = 30;
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
        class copper_unrefined {
            amount = 2;
            zones[] = { "copper_mine" };
            item = "pickaxe";
            mined[] = {"copper_unrefined"};
            zoneSize = 30;
        };

        class iron_unrefined {
            amount = 2;
            zones[] = { "iron_mine" };
            item = "pickaxe";
            mined[] = { "iron_unrefined" };
            zoneSize = 30;
        };

        class salt_unrefined {
            amount = 2;
            zones[] = { "salt_mine" };
            item = "pickaxe";
            mined[] = { "salt_unrefined" };
            zoneSize = 30;
        };

        class sand {
            amount = 2;
            zones[] = { "sand_mine" };
            item = "pickaxe";
            mined[] = { "sand" };
            zoneSize = 30;
        };

        class diamond_uncut {
            amount = 1;
            zones[] = { "diamond_mine" };
            item = "pickaxe";
            mined[] = { "diamond_uncut" };
            zoneSize = 30;
        };

        class rock {
            amount = 2;
            zones[] = { "rock_quarry" };
            item = "pickaxe";
            mined[] = { "rock" };
            zoneSize = 30;
        };

        class ruby {
            amount = 1;
            zones[] = { "ruby_1" };
            item = "pickaxe";
            mined[] = { "rubyU" };
            zoneSize = 30;
        };

        class oil_unprocessed {
            amount = 2;
            zones[] = { "oil_field_1", "oil_field_2" };
            item = "pickaxe";
            mined[] = { "oil_unprocessed" };
            zoneSize = 30;
        };

        class relic_1 {
            amount = 1;
            zones[] = { "relic_1" };
            item = "";
            mined[] = { "relic1" };
            zoneSize = 10;
        };
        class relic_2 {
            amount = 1;
            zones[] = { "relic_2" };
            item = "";
            mined[] = { "relic2" };
            zoneSize = 10;
        };
        class relic_3 {
            amount = 1;
            zones[] = { "relic_3" };
            item = "";
            mined[] = { "relic3" };
            zoneSize = 10;
        };
        class relic_4 {
            amount = 1;
            zones[] = { "relic_4" };
            item = "";
            mined[] = { "relic4" };
            zoneSize = 10;
        };
    };
};