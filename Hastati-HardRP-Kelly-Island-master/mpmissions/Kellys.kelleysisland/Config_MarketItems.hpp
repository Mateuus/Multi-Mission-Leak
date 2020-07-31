/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
class MarketItems {
    //Virtual Items
    class oil_unprocessed {
		startPrice = 5;
		maxPrice = 10;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class oil_processed {
		startPrice = 15;
		maxPrice = 30;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class copper_unrefined {
		startPrice = 6;
		maxPrice = 12;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class copper_refined {
		startPrice = 16;
		maxPrice = 32;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class iron_unrefined {
		startPrice = 2;
		maxPrice = 4;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class iron_refined {
		startPrice = 6;
		maxPrice = 12;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class salt_unrefined {
		startPrice = 33;
		maxPrice = 67;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class salt_refined {
		startPrice = 100;
		maxPrice = 200;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class diamond_uncut {
		startPrice = 1666;
		maxPrice = 3300;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class diamond_cut {
		startPrice = 5000;
		maxPrice = 10000;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };

    class rock {
		startPrice = 4;
		maxPrice = 8;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
        icon = "";
    };
    class cement {
		startPrice = 11;
		maxPrice = 22;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class sand {
		startPrice = 27;
		maxPrice = 54;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class glass {
		startPrice = 80;
		maxPrice = 160;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };

    //Drugs
    class heroin_unprocessed {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class cannabis {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };

    class cocaine_unprocessed {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class heroin_processed {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class marijuana {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
    class cocaine_processed {
		startPrice = 200;
		maxPrice = 400;
		minPrice = 0;
		consumption = 50;
		maxQuantity = 1000;
    };
};
