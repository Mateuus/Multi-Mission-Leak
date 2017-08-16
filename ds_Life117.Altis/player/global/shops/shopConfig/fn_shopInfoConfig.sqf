/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fills the array and sets up variables for shop items
*/

private ["_shop","_returnList"];

_shop = _this select 0;
_returnList = [];

if((!DS_spotted)&&((DS_wanted_Stats select 0) > 0))then{[]spawn DS_fnc_recordAdd;};

switch(_shop)do
	{
	case 666:
		{
		_returnList = ["ATM","atm","Access your bank account"];
		};
	case 0:
		{
		_returnList = ["Civilian Car Shop","carShop","Buy civilian cars here"];
		};
	case 1:
		{
		_returnList = ["Civilian Truck Shop","truckShop","Buy civilian trucks here"];
		};
	case 2:
		{
		_returnList = ["Civilian Air Shop","airShop","Buy civilian air vehicles here"];
		};
	case 3:
		{
		_returnList = ["Civilian Boat Shop","boatShop","Buy civilian sea vehicles here"];
		};
	case 4:
		{
		_returnList = ["Civilian Market","market","Buy civilian inventory items here"];
		};
	case 5:
		{
		_returnList = ["High tech Store","hitech","Buy your high tech items here"];
		};
	case 6:
		{
		_returnList = ["Civilian Weapons shop","gun","Buy your legal civilian firearms here"];
		};
	case 7:
		{
		_returnList = ["Advanced Weapons shop","gunAdv","Buy your legal advanced civilian firearms here"];
		};
	case 8:
		{
		_returnList = ["Main License shop","license","Purchase most legal licenses at this shop"];
		};
	case 9:
		{
		_returnList = ["Civilian Clothing Shop","civClothing","Buy your civilian clothing here"];
		};
	case 10:
		{
		_returnList = ["Civilian Hat Shop","civHats","Buy your civilian hats here"];
		};
	case 11:
		{
		_returnList = ["Civilian Glasses Shop","civGlasses","Buy your civilian Glasses here"];
		};
	case 12:
		{
		_returnList = ["Civilian Backpack Shop","civBackpack","Buy your civilian backpacks here"];
		};
	case 13:
		{
		_returnList = ["Civilian Diving Shop","civDiving","Buy your civilian diving gear here"];
		};
	case 14:
		{
		_returnList = ["Police Weapons","\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa","Police weapons and items are bought here"];
		};
	case 15:
		{
		_returnList = ["Patrol Officer Weapons","\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa","Weapons and items for Patrol Officers are bought here"];
		};
	case 16:
		{
		_returnList = ["Sergeant Weapons","\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa","Weapons and items for Sergeants are bought here"];
		};
	case 17:
		{
		_returnList = ["Senior Sergeant Weapons","\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa","Weapons and items for Senior Sergeants are bought here"];
		};
	case 18:
		{
		_returnList = ["Lieutenant Weapons","\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa","Weapons and items for Lieutenants are bought here"];
		};
	case 19:
		{
		_returnList = ["Superintendent Weapons","\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa","Weapons and items for Superintendents are bought here"];
		};
	case 20:
		{
		_returnList = ["Deputy Chief Weapons","\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa","Weapons and items for Deputy Chiefs are bought here"];
		};
	case 21:
		{
		_returnList = ["Police Attachments","scope","Attachments for police weapons are bought here"];
		};
	case 22:
		{
		_returnList = ["Police Items","market","Police inventory items are bought here"];
		};
	case 23:
		{
		_returnList = ["Police Item Kit","market","Buy your full item kit here"];
		};
	case 24:
		{
		_returnList = ["Police Clothing","\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa","Buy your police clothing here"];
		};
	case 25:
		{
		_returnList = ["Patrol Officer Clothing","\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa","Buy your low ranking police clothing here"];
		};
	case 26:
		{
		_returnList = ["Sergeant Clothing","\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa","Buy your mid ranking police clothing here"];
		};
	case 27:
		{
		_returnList = ["Snr Sergeant Clothing","\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa","Buy your mid ranking police clothing here"];
		};
	case 28:
		{
		_returnList = ["Lieutenant Clothing","\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa","Buy your high ranking police clothing here"];
		};
	case 29:
		{
		_returnList = ["Super Intendant Clothing","\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa","Buy your high ranking police clothing here"];
		};
	case 30:
		{
		_returnList = ["Rent-A-Cop Vehicles","carShop","Buy your public officer vehicles here"];
		};
	case 31:
		{
		_returnList = ["Cadet Vehicles","\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa","Buy your Cadet vehicles here"];
		};
	case 32:
		{
		_returnList = ["Patrol Officer Vehicles","\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa","Buy your patrol Officer vehicles here"];
		};
	case 33:
		{
		_returnList = ["Sergeant vehicles","\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa","Buy your Sergeant vehicles here"];
		};
	case 34:
		{
		_returnList = ["Snr Sergeant Vehicles","\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa","Buy your Senior Sergeant vehicles here"];
		};
	case 35:
		{
		_returnList = ["High Ranking Vehicles","\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa","Buy your high ranking and armoured vehicles here"];
		};
	case 36:
		{
		_returnList = ["Police Air Vehicles","airShop","Buy your police air vehicles here"];
		};
	case 37:
		{
		_returnList = ["Body Armour","armour","Buy your body armour here"];
		};
	case 38:
		{
		_returnList = ["Process Oil","oilu","Process your oil here"];
		};
	case 39:
		{
		_returnList = ["Processing training","license","Purchase your processing training certificates here"];
		};
	case 40:
		{
		_returnList = ["Process Sand","sandu","Process your sand into glass here"];
		};
	case 41:
		{
		_returnList = ["Process Salt","saltu","Process your salt here"];
		};
	case 42:
		{
		_returnList = ["Process Rocks","rocku","Process your rocks into cement here"];
		};
	case 43:
		{
		_returnList = ["Process Iron","ironu","Process your Iron here"];
		};
	case 44:
		{
		_returnList = ["Process diamonds","diamondu","Process your Diamonds here"];
		};
	case 45:
		{
		_returnList = ["Process copper","copperu","Process your Copper here"];
		};
	case 46:
		{
		_returnList = ["Sell Raw","copperu","Sell your unprocessed goods here"];
		};
	case 47:
		{
		_returnList = ["Sell Processed Goods","processed","Sell your processed goods here"];
		};
	case 48:
		{
		_returnList = ["Capture Gang Hideout","gang","Capture the nearby gang area"];
		};
	case 49:
		{
		_returnList = ["Process Weed","gang","Process your weed here"];
		};
	case 50:
		{
		_returnList = ["Process Heroin","gang","Process your heroin here"];
		};
	case 51:
		{
		_returnList = ["Process Cocaine","gang","Process your cocaine here"];
		};
	case 52:
		{
		_returnList = ["Drug Training","gang","Purchase your drug processing training here"];
		};
	case 53:
		{
		_returnList = ["Illegal Goods Dealer","gang","Sell your illegal goods such as drugs and stolen relics here"];
		};
	case 54:
		{
		_returnList = ["Gang Items","gang","Buy your gang inventory items here"];
		};
	case 55:
		{
		_returnList = ["Retrieve Garaged Vehicle","carShop","Retrieve your garaged vehicles here"];
		};
	case 56:
		{
		_returnList = ["Store Vehicle","carShop","Store your vehicle in your garage here"];
		};
	case 57:
		{
		_returnList = ["Rebel Weapons","rebelLargeGun","Purchase your rebel weapons here"];
		};
	case 58:
		{
		_returnList = ["Rebel Licenses","rebelLargeGun","Purchase your rebel trainings here"];
		};
	case 59:
		{
		_returnList = ["Rebel Large Weapons","rebelLargeGun","Purchase your large rebel weapons here"];
		};
	case 60:
		{
		_returnList = ["Rebel KOS Weapons","rebelLargeGun","Purchase your KOS rebel weapons here"];
		};
	case 61:
		{
		_returnList = ["Rebel Vehicles","carShop","Purchase your Rebel vehicles here"];
		};
	case 62:
		{
		_returnList = ["Armed Rebel Vehicles","rebVeh","Purchase your Armed Rebel vehicles here"];
		};
	case 63:
		{
		_returnList = ["Rebel Attachments","scope","Purchase attachments for your rebel weapons here"];
		};
	case 64:
		{
		_returnList = ["Gang Weapons","gunAdv","Illegal low caliber weapons are bought here"];
		};
	case 65:
		{
		_returnList = ["Gang Vehicles","gang","Get your gang vehicles here"];
		};
	case 66:
		{
		_returnList = ["Polish Relics","gang","Polish your relics here to prepare them for selling"];
		};
	case 67:
		{
		_returnList = ["Gas Station Store","market","Buy vehicle related items here"];
		};
	case 68:
		{
		_returnList = ["Rob Gas Station","robber","Rob the gas station for money"];
		};
	case 69:
		{
		_returnList = ["Treat Sickness","medic","Treat any sickness you may have"];
		};
	case 70:
		{
		_returnList = ["Rob Hospital (Chemicals)","robber","Rob the hospital for chemicals"];
		};
	case 71:
		{
		_returnList = ["Rob Hospital (Cash)","robber","Rob the hospital for cash"];
		};
	case 72:
		{
		_returnList = ["Rebel Items","market","Items for Rebels"];
		};
	case 73:
		{
		_returnList = ["Rebel Clothing","civClothing","Rebel styled uniforms"];
		};
	case 74:
		{
		_returnList = ["Rebel Head Gear","civHats","Rebel styled headgear"];
		};
	case 75:
		{
		_returnList = ["Rebel Glasses","civGlasses","Rebel styled glasses"];
		};
	case 76:
		{
		_returnList = ["Rebel Vest","civBackpack","Rebel styled vest"];
		};
	case 77:
		{
		_returnList = ["Rebel backpacks","civBackpack","Rebel styled backpacks"];
		};
	case 78:
		{
		_returnList = ["Process Meth","Gang","Process crystal Meth"];
		};
	case 79:
		{
		_returnList = ["Drug Convoy","Gang","Begin a Drug Convoy"];
		};
	case 80:
		{
		_returnList = ["Weapons Convoy","Gang","Begin a Weapons Convoy"];
		};
	case 81:
		{
		_returnList = ["Rebel Item Trader","Gang","Trade your illegal Items for cash here"];
		};
	case 82:
		{
		_returnList = ["Police Transport","carShop","Transport to other police HQ's"];
		};
	case 83:
		{
		_returnList = ["Police Air Vehicles","airShop","Buy your police Air Vehicles here"];
		};
	case 84:
		{
		_returnList = ["Air Vehicle Garage","airShop","Retrieve vehicles from your air garage here"];
		};
	case 85:
		{
		_returnList = ["Buy RealEstate","atm","Purchase an investment property to boost your pay-checks"];
		};
	case 86:
		{
		_returnList = ["Boat Garage","boatShop","Retrieve your stored boats here"];
		};
	case 87:
		{
		_returnList = ["Crop Dusting","airShop","Begin your crop dusting jobs here"];
		};
	case 88:
		{
		_returnList = ["Jobs Depot","goldBar","A place to get a job as a civilian"];
		};
	case 89:
		{
		_returnList = ["Evict Gang","gang","Evict the owners of this gang hideout"];
		};
	case 90:
		{
		_returnList = ["Police Convoys","truckShop","Start a police convoy mission"];
		};
	case 91:
		{
		_returnList = ["Vehicle Upgrades","repairKit","Upgrade your vehicles here"];
		};
	case 92:
		{
		_returnList = ["Police Locker","vehLocker","Store and retrieve items from your police locker"];
		};
	case 93:
		{
		_returnList = ["Gun License","gun","Civilian Legal Weapons license"];
		};
	case 94:
		{
		_returnList = ["Retrieve MCU","mcu","Retrieve the police Mobile Command Unit vehicle"];
		};
	case 95:
		{
		_returnList = ["Medic Vehicles","carShop","Buy your Medic vehicles here"];
		};
	case 96:
		{
		_returnList = ["Mechanic Vehicles","mechanic","Buy your Mechanic vehicles here"];
		};
	case 97:
		{
		_returnList = ["Rebel Kit (Sniper)","gang","Use this to quickly buy your rebel inventory gear and fit Stun Armour"];
		};
	case 98:
		{
		_returnList = ["Rebel Kit (General)","gang","Use this to quickly buy your rebel inventory gear and fit Stun Armour"];
		};
	case 99:
		{
		_returnList = ["Store the MCU","mcu","Store the MCU here"];
		};
	case 100:
		{
		_returnList = ["Chop Shop","gang","Chop a nearby vehicle for money"];
		};
	case 101:
		{
		_returnList = ["Public Transport","bus","Use the bus to get around Altis quick and cheaply"];
		};
	case 102:
		{
		_returnList = ["Rebel Missions","gang","Begin Rebel Missions here"];
		};
	case 103:
		{
		_returnList = ["Pod Shop","pods","Buy your cargo pods here"];
		};
	case 104:
		{
		_returnList = ["Blueprints","blueprint","Purchase your blue prints here, detailing the needed materials to craft items"];
		};
	case 105:
		{
		_returnList = ["Process Lumber","woodu","Purchase your lumber here and either sell it or use it at the factory"];
		};
	case 106:
		{
		_returnList = ["Craft Vehicle Items","vehRepair","Craft your vehicle upgrade related items here"];
		};
	case 107:
		{
		_returnList = ["Craft Ingredients","defuse","Craft your required ingredients here"];
		};
	case 108:
		{
		_returnList = ["Sell Ingredients","market","Sell left over Ingredients here"];
		};
	case 109:
		{
		_returnList = ["Sell Items","hitech","Sell crafted items here"];
		};
	case 110:
		{
		_returnList = ["Bribe Dealer","beating","Bribe the dealer for the drug prices"];
		};
	case 111:
		{
		_returnList = ["Craft Weapon Items","gunAdv","Craft your weapon related items here"];
		};
	case 112:
		{
		_returnList = ["Lower Truck Level","mdown","Lower your trucking level here to re-do earlier missions"];
		};
	case 113:
		{
		_returnList = ["Vehicle Paint Shop","carShop","Paint your vehicles here"];
		};
	case 114:
		{
		_returnList = ["Play Lotto","spyDocs","Purchase your lotto ticket here"];
		};
	case 115:
		{
		_returnList = ["Building Shop","buildingBox","Purchase building equipment here"];
		};
	case 116:
		{
		_returnList = ["Pack Box","buildingBox","Pack the box and all equipment bought from it"];
		};
	case 117:
		{
		_returnList = ["Rearm Vehicles","vehAmmo","Rearm all nearby vehicles"];
		};
	case 118:
		{
		_returnList = ["Insurance Broker","goldBar","Purchase insurance policies here"];
		};
	case 119:
		{
		_returnList = ["Items Shop","market","Purchase virtual items here"];
		};
	case 120:
		{
		_returnList = ["Vehicle Shop","carShop","Purchase vehicles here"];
		};
	case 121:
		{
		_returnList = ["Weapons Shop","gunAdv","Purchase weapons here"];
		};
	case 122:
		{
		_returnList = ["Weapons Shop","gunAdv","Purchase weapons here"];
		};
	case 123:
		{
		_returnList = ["Vehicle Shop","carShop","Purchase vehicles here"];
		};
	case 124:
		{
		_returnList = ["Security Clothing Shop","civClothing","Buy your security clothing here"];
		};
	case 125:
		{
		_returnList = ["Security Kit","market","Purchase a Security Kit"];
		};
	case 126:
		{
		_returnList = ["Hire a Lawyer","lawyer","Hire a lawyer in an attempt to have your prison sentence reduced"];
		};
	case 127:
		{
		_returnList = ["Police Boat Shop","boatShop","Buy police sea vehicles here"];
		};
	case 128:
		{
		_returnList = ["Clothing retexture shop","civClothing","Retexture your clothing here"];
		};
	case 129:
		{
		_returnList = ["Vehicle retexture shop","carShop","Retexture your vehicle here"];
		};
	case 130:
		{
		_returnList = ["Rebel Token Shop","gang","Use your Rebel Tokens to buy Rebel Items here"];
		};
	case 131:
		{
		_returnList = ["Process Wheat","wheatp","Bake bread using your wheat to sell"];
		};
	case 132:
		{
		_returnList = ["Purchase ten police lives","medic","Purchase ten police lives to stop you having your gear wiped"];
		};
	case 133:
		{
		_returnList = ["Begin Police Patrol","\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa","Begin your police patrol missions here"];
		};
	case 134:
		{
		_returnList = ["Base Upgrades","gang","Purchase Base Upgrades"];
		};
	case 135:
		{
		_returnList = ["Plane Missions","airShop","Plane Missions"];
		};
	case 136:
		{
		_returnList = ["ID Convoy","Gang","Begin a Fake ID Convoy"];
		};
	case 137:
		{
		_returnList = ["Mechanic Missions","repairKit","Begin a Mechanic Mission"];
		};
	case 138:
		{
		_returnList = ["Deliver Human Remains","gang","Deliver collected human remains"];
		};
	case 139:
		{
		_returnList = ["Medic Missions","goldBar","Begin Medic Missions"];
		};
	case 140:
		{
		_returnList = ["Medic Transport","airShop","Medic Quick Transport"];
		};
	};

_returnList;

