class BIS_AddonInfo
{
author="76561197963884021";
timepacked="1472138527";
};

class DefaultEventhandlers;
class CfgPatches 
{
class life_server
{
units[] = {"C_man_1"};
weapons[] = {};
requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
fileName = "life_server.pbo";
author[]= {"Asylum"}; 
};
};

class CfgFunctions
{
class STS_DB
{
tag = "DB";
class MySQL
{
file = "\life_server\core\DB";
class insert{};
class query{};
class update{};
class numberSafe {};
class formatArray {};
class mresArray {};
class mresToArray {};
class flushPlayer {};
class flushAllPlayers {};
class addQueue {};
class asyncQuery {};
class processQueue {};
class queueManagement {};
class insertVehicle {};
class queryStock {};
class queryVehicle {};
class queryVehicles {};
class queryConfig {};
class insertHouse {};
class updateHouse {};
class deleteHouse {};
class listHouse {};
class deleteVehicle {};
class queryHouses {};
class queryStorage {};
class insertStorage {};
class updateStorage {};
class insertGang {};
class queryGangs {};
class updateGang {};
class deleteGang {};
class queryGangMembers {};
class gangMember {};
class queryCaptures {};
class updateCaptures {};
class updateTurf {};
class uC {};
class updateConfig {};
class updateVehicle {};
class saveVehicles {};
class restoreVehicles {};
class insertWanted {};
class deleteWanted {};
class setDeadState {};
class bool{};
};
};

class Life_System
{
tag = "life";
class Wanted_Sys
{
file = "\life_server\core\wantedsys";
class wantedFetch {};
class wantedPerson {};
class wantedBounty {};
class wantedTicket {};
class wantedPardon {};
class wantedGetBounty {};
class createDispatch {};
class swatDispatch {};
class setRestrained {};
};

class Jail_Sys
{
file = "\life_server\core\jail";
class jailSys {};
class startPrisonBreak {};
class trialRequest {};
class trialBegin {};
class juryRegistered {};
class juryVote {};
};
};

class STS_System
{
tag = "ASY";
class System
{
file = "\life_server\core\system";
class doRestart {};
class playerDisconnected {};
class setOwnerID {};
class query {};
class queryHouses {};
class queryHouse {};
class houseContainerPos {};
class setGangTalents {};
class addGangExp {};
class initEvent {};
class addToEvent {};
class add {};
class update {};
class startKaraoke {};
class manageRadio {};
class managePhone {};
class cleanup {};
class cleanupHouses {};
class cleanupStorage {};
class timeStamp {};
class huntingZone {};
class spawnCaptures {};
class swatRegistered {};
class football {};
class setWaypoint {};
class reduceMarket {};
class spawnVehicle {};
class addVehicle2Chain {};
class removeStorage {};
class experienceReq {};
class getVehicles {};
class vehicleStore {};
class vehicleCreate {};
class vehicleDelete {};
class vehicleDead {};
class addMessage {};
class requestDispatcher {};
class joinRace {};
class finishRace {};
class getHouses {};
class addToLottery {};
class spikeStrip {};
class requestQueue {};
class logIt {};
class martialAlarm {};
class martialStop {};
class govMaint {};
class rebootMonitor {};
class patchServer {};
class patchServer1M {};
class hardRestart {};
class hardRestart1M {};
class verifyPickup {};
class weatherSync {};
class laserQueue {};
class laserTag {};
class laserEliminated {};
class getGuid {};
class getIpAddress {};
class getBattlEye {};
class placeStorage {};
class addStorage {};
class doOpenLootCrate {};
class receiveHouses {};
class checkHacks {};
class banPlayer {};
class chopShopSell {};
class igiInit {};
class robStore {};
class spawnGoldBars {};
class isUIDActive {};
class queryGangs {};
class addGang {};
class updateGang {};
class receiveGangs {};
class gangMembers {};
class gangMember {};
class joinGangGroup {};
class monitorCaptures {};
class updateGangBank {};
class uC {};
class queryGangBank {};
class setIdletime {};
class flipVehicle {};
class addObjectWhitelist {};
class insured {};
class updateWar {};
class visible {};
class getAdmin {};
};

class Bank_Sys
{
file = "\life_server\core\bank";
class fedAlarm {};
class bankDrillVault {};
};

class Politics
{
file = "\life_server\core\politics";
class getCandidate {};
class submitCandidate {};
class getCandidates {};
class getVote {};
class vote {};
};
};
class GEServer
{
tag = "KBW";
class GE
{
file = "\life_server\core\GE";
class getOffers {};
class offlineComp {};
class listing {};
class updateMailbox {};
class fixBadOffers {};
class listHouse {};
class queryMail {};
};
};
};

class CfgVehicles
{
class Car_F;
class Plane_Base_F;
class CAManBase;
class Civilian;

class Civilian_F : Civilian
{
class EventHandlers;
class CfgMovesFatigue
{
staminaCooldown = 7;
staminaDuration = 90;
staminaRestoration = 20;
};
};

class C_man_1 : Civilian_F
{
class EventHandlers;
class CfgMovesFatigue
{
staminaCooldown = 7;
staminaDuration = 90;
staminaRestoration = 20;
};
};
};