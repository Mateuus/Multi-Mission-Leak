class CfgGather {
    class Resources {
        class apple {
            amount = 10;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
            zoneSize = 75;
        };

        class peach {
            amount = 10;
            zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
            item = "";
            zoneSize = 75;
        };

        class heroin_unprocessed {
            amount = 3;
            zones[] = { "heroin_1" };
            item = "";
            zoneSize = 75;
        };

        class cocaine_unprocessed {
            amount = 3;
            zones[] = { "cocaine_1" };
            item = "";
            zoneSize = 75;
        };
		
		class pebble {
            amount = 1;
            zones[] = { "pebble_1" };
            item = "";
            zoneSize = 10;
        };

        class cannabis {
            amount = 3;
            zones[] = { "weed_1" };
            item = "";
            zoneSize = 75;
        };
		
		class frosch {
            amount = 4;
            zones[] = { "froschsumpf" };
            item = "";
            zoneSize = 75;
        };
		
		class hopfen {
            amount = 5;
            zones[] = { "hopfenfeld" };
            item = "";
            zoneSize = 75;
        };
		
		class malz {
            amount = 5;
            zones[] = { "malzfeld" };
            item = "";
            zoneSize = 75;
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
            amount = 3;
            zones[] = { "Kupfermine" };
            item = "pickaxe";
            mined[] = {"copper_unrefined"};
            zoneSize = 75;
        };

        class iron_unrefined {
            amount = 3;
            zones[] = { "iron_mine" };
            item = "pickaxe";
            mined[] = { "iron_unrefined" };
            zoneSize = 75;
        };

        class salt_unrefined {
            amount = 3;
            zones[] = { "salt_mine" };
            item = "pickaxe";
            mined[] = { "salt_unrefined" };
            zoneSize = 75;
        };

        class sand {
            amount = 3;
            zones[] = { "sand_mine" };
            item = "pickaxe";
            mined[] = { "sand" };
            zoneSize = 75;
        };

        class diamond_uncut {
            amount = 3;
            zones[] = { "diamond_mine" };
            item = "pickaxe";
            mined[] = { "diamond_uncut" };
            zoneSize = 75;
        };

        class rock {
            amount = 3;
            zones[] = { "rock_quarry" };
            item = "pickaxe";
            mined[] = { "rock" };
            zoneSize = 75;
        };

        class oil_unprocessed {
            amount = 3;
            zones[] = { "oil_field_1", "oil_field_2" };
            item = "pickaxe";
            mined[] = { "oil_unprocessed" };
            zoneSize = 75;
        };
		
		class silbererz {
            amount = 3;
            zones[] = { "Silbermine" };
            item = "pickaxe";
            mined[] = { "silbererz" };
            zoneSize = 75;
        };
		class aluminiumerz {
            amount = 3;
            zones[] = { "Aluminiumausgrabungen" };
            item = "pickaxe";
            mined[] = { "aluminiumerz" };
            zoneSize = 75;
        };
		class iridiumerz {
            amount = 3;
            zones[] = { "Iridiummine" };
            item = "pickaxe";
            mined[] = { "iridiumerz" };
            zoneSize = 75;
        };
		class uranerz {
            amount = 3;
            zones[] = { "Uranvorkommen" };
            item = "pickaxe";
            mined[] = { "uranerz" };
            zoneSize = 75;
        };
    };
};