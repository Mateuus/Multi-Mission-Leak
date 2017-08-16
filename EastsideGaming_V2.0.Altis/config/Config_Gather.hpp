class CfgGather {
    class Resources {
        class apfel {
            amount = 2;
            zones[] = { "apfelfeld_1","apfelfeld_2","apfelfeld_3","apfelfeld_4" };
            item = "";
            zoneSize = 20;
        };
		class pfirsich {
            amount = 2;
            zones[] = { "pfirsichfeld_1","pfirsichfeld_2","pfirsichfeld_3","pfirsichfeld_4" };
            item = "";
            zoneSize = 20;
        };
		class heroin {
            amount = 2;
            zones[] = { "heroinfeld_1" };
            item = "";
            zoneSize = 20;
        };

		class hanfpflanze {
            amount = 2;
            zones[] = { "hanffeld" };
            item = "";
            zoneSize = 20;
        };

		class kokainstrauch {
            amount = 2;
            zones[] = { "kokainfeld" };
            item = "";
            zoneSize = 20;
        };

		class fisch {
            amount = 2;
            zones[] = { "fischgrund_1", "fischgrund_2" };
            item = "angel";
            zoneSize = 20;
        };

		class holz {
            amount = 2;
            zones[] = { "wald" };
            item = "";
            zoneSize = 20;
        };

		class sand {
            amount = 2;
            zones[] = { "sandmine" };
            item = "";
            zoneSize = 20;
        };

		class rohoel {
            amount = 2;
            zones[] = { "oelfeld" };
            item = "pickaxe";
            zoneSize = 20;
        };

		class kirsche {
            amount = 2;
            zones[] = { "kirschfeld" };
            item = "";
            zoneSize = 20;
        };

		class banane {
            amount = 2;
            zones[] = { "bananenfeld" };
            item = "";
            zoneSize = 20;
        };

		class gerste {
            amount = 2;
            zones[] = { "gerstefeld" };
            item = "";
            zoneSize = 20;
        };

		class hopfen {
            amount = 2;
            zones[] = { "hopfenfeld" };
            item = "";
            zoneSize = 20;
        };

		class maische {
            amount = 2;
            zones[] = { "maischefeld" };
            item = "";
            zoneSize = 20;
        };

        class weintrauben {
                amount = 2;
                zones[] = { "weintraubenfeld" };
                item = "";
                zoneSize = 20;
            };

            class pilz {
                    amount = 2;
                    zones[] = { "pilzfeld" };
                    item = "";
                    zoneSize = 20;
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
        class kupfererz {
            amount = 2;
            zones[] = { "kupfermine" };
            item = "pickaxe";
            mined[] = {"kupfererz"};
            zoneSize = 30;
        };

		class eisenerz {
            amount = 2;
            zones[] = { "eisenmine" };
            item = "pickaxe";
            mined[] = {"eisenerz"};
            zoneSize = 30;
        };

		class relikte {
            amount = 2;
            zones[] = { "reliktmine" };
            item = "pickaxe";
            mined[] = {"relikte"};
            zoneSize = 30;
        };

		class diamantenerz {
            amount = 2;
            zones[] = { "diamantenmine" };
            item = "pickaxe";
            mined[] = {"diamantenerz"};
            zoneSize = 30;
        };

		class salzerz {
            amount = 2;
            zones[] = { "salzmine" };
            item = "pickaxe";
            mined[] = {"salzerz"};
            zoneSize = 30;
        };

		class stein {
            amount = 2;
            zones[] = { "steinbruch" };
            item = "pickaxe";
            mined[] = {"stein"};
            zoneSize = 30;
        };

		class kohle {
            amount = 2;
            zones[] = { "kohlemine" };
            item = "pickaxe";
            mined[] = {"kohle"};
            zoneSize = 30;
        };

		class silbererz {
            amount = 2;
            zones[] = { "silbermine" };
            item = "pickaxe";
            mined[] = {"silbererz"};
            zoneSize = 30;
        };
        class uranerz {
                amount = 2;
                zones[] = { "uranmine" };
                item = "pickaxe";
                mined[] = {"uranerz"};
                zoneSize = 30;
            };
    };
};
