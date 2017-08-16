#include "BIS_AddonInfo.hpp"
class DefaultEventhandlers;
class CfgPatches {
    class server {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "server.pbo";
        author[]= {"Kupferkarpfen"};
    };
};

class CfgFunctions {
    class MySQL_Database {

        tag = "XYDB";
        class MySQL {
            file = "\server\DB";
            class numberSafe {};
            class mresArray {};
            class mresToArray {};
            class bool{};
            class mresString {};
            class asyncCall{};

            class log {};
            class fpsLog {};

            class queryRequest{};
            class insertRequest{};
            class updateRequest{};
            class updatePartial {};

            class vehicleCreate {};
            class retrieveVehicle {};
            class getVehicles {};
            class sellVehicle {};
            class vehicleRepaint {};
            class updateVehicle {};
            class getLockedVehicles {};
            class vehicleStore {};
            class updateHouseContainers {};
            class updateHouseTrunk {};

            class handleMessages {};
            class msgRequest {};

            class updateJailTime {};
            class requestJailTime {};

            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
            class gangBank {};
            class requestBanklog {};
            class uidToName;
        };
    };

    class XY_System {

        tag = "XY";
        class ServerInit {
            file = "\server";
            class initServer { postInit = 1; };
            class initHC { postInit = 1; };
            class initDB {};
        };

        class Wanted_Sys {
            file = "\server\Functions\WantedSystem";
            class wantedAdd {};
            class wantedAnnounce {};
            class wantedBounty {};
            class wantedFetch {};
            class wantedLoad {};
            class wantedRemove {};
        };

        class Systems {
            file = "\server\Functions\Systems";
            class managesc {};
            class clientDisconnect {};
            class log {};
            class activityMonitor {};
            class ctf {};
            class ssv {};
            class robCooldown {};
            class dangerMarker {};
            class bomb {};
            class fuelStations {};
            class timeAccelerator {};
            class randomWeather {};
            class savePlayerPosition {};
            class serverCleanup {};
            class federalUpdate {};
            class pvpEvents {};
            class clientFunctions {};
            class addToKeychain {};
            class pollKeychain {};
            class racingPlayerFinished {};
            class racingTools {};
            class realtimeClock {};
            class registerVehicleForDeletion {};
        };

        class Housing {
            file = "\server\Functions\Housing";
            class addHouse {};
            class fetchPlayerHouses {};
            class initHouses {};
            class removeHouse {};
            class houseCleanup {};
        };

        class Market {
            file = "\server\Functions\market";
            class marketVolume {};
            class marketConfiguration {};
            class marketChange {};
            class marketLoad {};
            class marketLogger {};
            class pollMarketPrices {};
        };
        class Event {
            file = "\server\Functions\events";
            class eventDrone {};
            class eventMoneyCrash {};
            class eventLostConvoy {};
            class eventOffroader {};
            class eventInfection {};
            class eventBurnHouse {};
            class eventWeaponDrop {};
        };
    };
};