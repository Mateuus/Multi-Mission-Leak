class CfgFunctions
{
	class A3
	{
		tag = "BIS";
		project = "arma3";
		class Ambient
		{
			file = "core\arma";
			class animalBehaviour{};
		};
		class MP
		{
			file = "core\arma";
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
			class MP{};
			class MPexec{};
			class initMultiplayer{};
			class call{};
			class spawn{};
			class deleteVehicleCrew{};
		};
	};
	class Life_Client_Core
	{
		tag = "life";
		class Start
		{
			file = "core\start";
			class preInit {preInit = 1;};
			class postInit {postInit = 1;};
			class connection {ext = ".fsm";};
			class restrainCop {ext = ".fsm";};
			class zipTied {ext = ".fsm";};
			class failedRobbery {ext = ".fsm";};
		};
		class Medical_System
		{
			file = "core\medical";
			class respawned {};
			class medicSirenLights {};
			class medicLights {};
			class medicSiren {};
			class medicHorn {};
			class medicPhaser {};
			class medicInteractionMenu {};
		};
		class DynMarket
		{
			file = "core\DynMarket";
			class bought {};
			class update {};
			class DisplayPrices {};
			class LoadIntoListbox {};
			class ForcePrice {};
			class DYNMARKET_getPrice {};
		};
		class Housing
		{
			file = "core\housing";
			class buyHouse {};
			class getBuildingPositions {};
			class houseMenu {};
			class lightHouse {};
			class lightHouseAction {};
			class sellHouse {};
			class initHouses {};
			class copBreakDoor {};
			class raidHouse {};
			class lockupHouse {};
			class copHouseOwner {};
			class lockHouse {};
			class garageRefund {};
		};
		class Player_Menu
		{
			file = "core\pmenu";
			class p_openMenu {};
			class p_updateMenu {};
			class cellphone {};
		};
		class Functions
		{
			file = "core\functions";
			class inString {};
		};
		class Network
		{
			file = "core\functions\network";
			class addAction {};
			class corpse {};
			class soundDevice {};
			class setTexture {};
			class say3D {};
		};
		class Civilian
		{
			file = "core\civilian";
			class skyDive {};
			class civInteractionMenu {};
			class generalInteractionMenu {};
			class inVehicleInteraction {};
		};
		class Vehicle
		{
			file = "core\vehicle";
			class lockVehicle {};
			class vehicleOwners {};
			class vInteractionMenu {};
			class vehicleWeight {};
			class deviceMine {};
			class deviceOil {};
		};
		class Cop
		{
			file = "core\cop";
			class copSearch {};
			class radar {};
			class copInteractionMenu {};
			class repairDoor {};
			class doorAnimate {};
			class fedCamDisplay {};
			class wantedGrab {};
		};
		class Shops
		{
			file = "core\shops";
			class virt_buy {};
			class virt_menu {};
			class virt_update {};
			class virt_sell {};
			class chopShopMenu {};
			class chopShopSelection {};
			class chopShopSell {};
		};
		class Items
		{
			file = "core\items";
			class chainsawUse {};
			class lockpick {};
			class jerryRefuel {};
			class flashbang {};
			class boltcutter {};
			class storageBox {};
		};
		class Dialog_Controls
		{
			file = "dialog\function";
			class displayHandler {};
		};
	};
};
