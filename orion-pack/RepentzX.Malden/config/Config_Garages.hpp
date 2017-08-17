/*
    Anything defined in Config_Garages is strictly just a garage, it will not act like a house.

    price - Cost of the garage
    garageSpawnPos[] - worldToModel position to spawn vehicles
    garageSpawnDir - Offset to garage direction to spawn at (+-90 etc). It will be used in the manner: getDir _garage + spawnDir
    garageBlacklists[] - List of blacklisted houses for buying garages
        default: {}
*/

class Garages {

    class Malden {

        class Land_i_Garage_V1_F {
            price = 1000000;
            garageSpawnPos[] = {-11.5,0,0};
            garageSpawnDir = -90;
            garageBlacklists[] = {};
        };

        class Land_i_Garage_V2_F : Land_i_Garage_V1_F{};

    };
};