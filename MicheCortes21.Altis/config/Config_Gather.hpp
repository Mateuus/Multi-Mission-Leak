class CfgGather {
    class Resources {
        class test {
            amount = 3;
            zones[] = { "test_1", "test_2", "test_3", "test_4" };
            item = "";
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
		
        class kakao_unrefined {
            amount = 3;
            zones[] = { "kakao_mine" };
            item = "";
            mined[] = {"kakao_unrefined" };
            zoneSize = 30;
        };
		
		class apple {
            amount = 5;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
            mined[] = {"apple"};
            zoneSize = 30;
        };
		
		class peach {
            amount = 5;
            zones[] = { "peaches_1", "peaches_2", "peaches_3", "peaches_4" };
            item = "";
            mined[] = {"peach"};
            zoneSize = 30;
        };
		
		class getreide_unrefined {
            amount = 3;
            zones[] = { "getreide_1" };
            item = "";
            mined[] = {"getreide_unrefined" , };
            zoneSize = 30;
        };
		
		class mais_unrefined {
            amount = 2;
            zones[] = { "mais_1" };
            item = "";
            mined[] = {"mais_unrefined" , };
            zoneSize = 30;
        };
		
		class heroin_unprocessed {
            amount = 3;
            zones[] = { "heroin_1" };
            item = "";
            mined[] = {"heroin_unprocessed"};
            zoneSize = 30;
        };
		
		class cocaine_unprocessed {
            amount = 3;
            zones[] = { "cocaine_1" };
            item = "";
            mined[] = {"cocaine_unprocessed"};
            zoneSize = 30;
        };
		
	    class cannabis {
            amount = 3;
            zones[] = { "weed_1" };
            item = "";
            mined[] = {"cannabis"};
            zoneSize = 30;
        };
		
		class frog {
            amount = 1;
            zones[] = { "frog_1" };
            item = "netz";
            mined[] = {"lsd_unprocessed"};
            zoneSize = 30;
        };
		
        class muschel_unrefined {
            amount = 2;
            zones[] = { "muschel_mine" };
            item = "netz";
            mined[] = {"muschel_unrefined"};
            zoneSize = 30;
        };

        class holz_unrefined {
            amount = 4;
            zones[] = { "holz_mine" };
            item = "axt";
            mined[] = {"holz_unrefined"};
            zoneSize = 30;
        };

        class iron_unrefined {
            amount = 2;
            zones[] = { "iron_mine" };
            item = "pickaxe";
            mined[] = { "iron_unrefined" };
            zoneSize = 30;
        };
		
        class silber_unrefined {
            amount = 3;
            zones[] = { "silber_mine" };
            item = "pickaxe";
            mined[] = { "silber_unrefined" };
            zoneSize = 30;
        };
		
        class tea_unrefined {
            amount = 7;
            zones[] = { "tea_mine" };
            item = "";
            mined[] = { "tea_unrefined" };
            zoneSize = 30;
        };


        class salt_unrefined {
            amount = 4;
            zones[] = { "salt_mine" };
            item = "pickaxe";
            mined[] = { "salt_unrefined" };
            zoneSize = 30;
        };

        class sand {
            amount = 4;
            zones[] = { "sand_mine" };
            item = "schaufel";
            mined[] = { "sand" };
            zoneSize = 30;
        };

        class diamond_uncut {
            amount = 2;
            zones[] = { "diamond_mine" };
            item = "pickaxe";
            mined[] = { "diamond_uncut" };
            zoneSize = 30;
        };

        class rock {
            amount = 4;
            zones[] = { "rock_quarry" };
            item = "pickaxe";
            mined[] = { "rock" };
            zoneSize = 30;
        };

        class oil_unprocessed {
            amount = 3;
            zones[] = { "oil_field_1", "oil_field_2" };
            item = "pickaxe";
            mined[] = { "oil_unprocessed" };
            zoneSize = 30;
        };
    };
};