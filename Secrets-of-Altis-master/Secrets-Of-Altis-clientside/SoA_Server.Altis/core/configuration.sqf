#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
*/

life_ausweisdaten = [];
life_actions = [];
life_spawned = false;
in_safezone = false;
life_ahwpremium = false;
life_SchrankeOn = false;
life_loadmission = false;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_siren3_active = false;
life_hupe_active = false;
life_crafting = false;
life_god = false;
life_vgod = false;
life_hiding = false;
life_frozen = false;
life_radio = false;
life_markers = false;
life_spectate = false;
life_empInUse = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_gathertime = 0;
life_spawnedItems = false;
life_gatheringTime = -1000;
life_spikestrip = ObjNull;
life_holzb = ObjNull;
life_ticket_polizist = ObjNull;
life_ticket_unit = ObjNull;
life_sperre = ObjNull;
life_hut = ObjNull;
life_band = ObjNull;
life_netz = ObjNull;
life_netzaktiv = false;
life_feuer = ObjNull;
life_rolly = ObjNull;
life_airhorn = ObjNull;
life_football = ObjNull;
life_feueraktiv = false;
life_klappstuhl = ObjNull;
life_klappstuhlaktiv = false;
life_schild = false;
life_laterne = false;
life_inTime = false;
life_pissing = false;
life_salzactive = false;
life_callinUse1 = false;
life_callinUse2 = false;
life_callactive = false;
life_netzhacked = false;
life_process_bad = false;
life_process_distance = false;
life_funknetzUsed = false;
life_legend_show = true;
life_adacCall = false;
life_detail = false;
life_name = false;
life_chat = false;
life_schatzsuche = false;
life_bankraub = false;
life_galerieraub = false;
//life_respawn_timer = 3;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_newlife = false;
life_removeWanted = false;
life_afk = false;
life_action_gathering = false;
life_action_sitzt = false;
life_gemaelde = [];
life_kunstraubActive = [false,ObjNull];
life_TankLaster = 1;
life_kw_athira = false;
life_kw_kavala = false;
life_kw_sofia = false;
life_kw_pyrgos = false;
life_nottoofast = 0;
life_drink = 0;
life_curWep_h = currentWeapon player;
life_mailbox = [];
life_guthabencode = [-1,""];
life_aufladen = false;
life_postpaket = 0;
life_postdone = false;
airhorn_played = false;
inMine = false;
muell_Verkauf = 30000;
muellCMAX = 1;
muell_InfoPreis = 700;
muellMarkMAX = 2;
muellMarkSet = [];
sellTemp = [];
spendenhausaktiv = false;
lightOn = false;
flagsOn = false;
lightboot = ObjNull;
cli_nitroLock = false;
vehCreated = false;
Rage_RadioApplyed = false;
radio_active = false;
life_lightorbrevive = false;
life_lightorblight = false;
schlittschuhfahrt = false;
snowevent = false;
realdate = [];
hudactive = true;
admingrund = "";
hudselection = profileNamespace getVariable "life_hud";
if(isnil "hudselection") then {hudselection = 0};
ringtone = profileNamespace getVariable "life_ringtone";
if(isnil "ringtone") then {ringtone = "phoneImpossible"};
mailreceived = false;
phonereceived = false;
veh_shop_vehicle = ObjNull;
weapon_shop_vehicle = ObjNull;
volleyball = ObjNull;

life_legend = profileNameSpace getVariable [format["%1_legend_%2",missionName,getplayerUID player],[]];

if(life_legend isEqualTo []) then {
	life_legend = [0,0,true,true,true,false,false,false,true,true,true,false,false,false,false];
};

//Levelsystem
level1 = false;
level2 = false;
level3 = false;
level4 = false;
level5 = false;
level6 = false;
level7 = false;
level8 = false;
level9 = false;
level10 = false;
level11 = false;
level12 = false;

__CONST__(life_save_civ,TRUE);
__CONST__(life_save_yinv,TRUE);
__CONST__(life_revive_cops,false);
__CONST__(life_revive_fee,15000);
__CONST__(life_houseLimit,7);
__CONST__(life_gangPrice,600000);
__CONST__(life_gangUpgradeBase,500000);
__CONST__(life_gangUpgradeMultipler,5);
__CONST__(life_enableFatigue,false);
__CONST__(life_paycheck_period,10);
__CONST__(life_impound_car,10000);
__CONST__(life_impound_boat,15000);
__CONST__(life_impound_air,20000);

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
life_maxWeight = 100;
life_maxWeightT = 24;
life_carryWeight = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_ausweis = false;
life_thirst = 100;
life_hunger = 100;
life_zustand = "Gesund";
life_battery = 100;
life_toilet = 0;
life_guthaben = 2000;
life_speedTicket = 0;
life_speedCaught = 0;
life_serverpoints = 0;
life_beatgeld = 0;
life_parkticket = 250;
life_istazed = false;
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;
life_smsTarget = ObjNull;
life_fadeSound = false;
life_kontakte = [];
life_vehicles = [];
life_notizen = [];
bank_robber = [];

switch (playerSide) do
{

	case civilian:
	{
		life_beatbankgeld = 20000;
		life_paycheck = 400;
		life_exp = 0;
		life_level = 0;
		life_veh_kfz = "";
	};

	case west:
	{
		life_beatbankgeld = 40000;
		life_paycheck = 0;
		life_exp = 0;
		life_activity = 0;
		life_level = 255;
		life_veh_kfz = "ALPO110";
	};

	case independent:
	{
		life_beatbankgeld = 40000;
		life_paycheck = 0;
		life_exp = 0;
		life_activity = 0;
		life_level = 255;
		life_veh_kfz = "ALHW112";
	};

	/*case east:
	{
		life_beatbankgeld = 40000;
		life_paycheck = 0;
		life_exp = 0;
		life_activity = 0;
		life_level = 255;
	};*/
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","O_MRAP_02_hmg_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_holzb",
	"life_inv_sperre",
	"life_inv_hut",
	"life_inv_band",
	"life_inv_battery",
	"life_inv_kidney",
	"life_inv_scalpel",
	"life_inv_eis",
	"life_inv_party",
	"life_inv_bobby",
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_moonshine",
	"life_inv_mash",
	"life_inv_gpsTracker",
	"life_inv_joghurt",
	"life_inv_pumpe",
	"life_inv_tablette",
	"life_inv_tablette2",
	"life_inv_tablette3",
	"life_inv_gegengift",
	"life_inv_verband",
	"life_inv_krankmeldung",
	"life_inv_protestschild",
	"life_inv_laterne",
	"life_inv_henraw",
    "life_inv_roosterraw",
    "life_inv_sheepraw",
    "life_inv_goatraw",
	"life_inv_rabbitraw",
	"life_inv_henmeat",
    "life_inv_roostermeat",
    "life_inv_sheepmeat",
    "life_inv_goatmeat",
	"life_inv_seide",
	"life_inv_bratwurst",
	"life_inv_netz",
	"life_inv_jagdmesser",
	"life_inv_jagdhorn",
	"life_inv_jagdmeister",
	"life_inv_timemachine",
	"life_inv_plutoniumu",
	"life_inv_plutonium",
	"life_inv_ahwcart",
	"life_inv_feuer",
	"life_inv_klappstuhl",
	"life_inv_axt",
	"life_inv_holz",
	"life_inv_mahagoni",
	"life_inv_laminat",
	"life_inv_bauholz",
	"life_inv_kabelbinder",
	"life_inv_kabelbinderkey",
	"life_inv_baumwolle",
	"life_inv_indigo",
	"life_inv_nadel",
	"life_inv_pizza",
	"life_inv_guthaben",
	"life_inv_guthabenplus",
	"life_inv_guthabenpremium",
	"life_inv_detektor",
	"life_inv_dublonen",
	"life_inv_reichtum",
	"life_inv_perlen",
	"life_inv_perlenp",
	"life_inv_plastik",
	"life_inv_schmuck",
	"life_inv_pressluft",
	"life_inv_darkorb",
	"life_inv_darkuni",
	"life_inv_quest1",
	"life_inv_quest2",
	"life_inv_quest3",
	"life_inv_skelett",
	"life_inv_ticket",
	"life_inv_parkschein",
	"life_inv_feuerwerkr",
	"life_inv_feuerwerkg",
	"life_inv_feuerwerkb",
	"life_inv_feuerwerkw",
	"life_inv_feuerwerk",
	"life_inv_gmandeln",
	"life_inv_gwein",
	"life_inv_kakao",
	"life_inv_geschenk",
	"life_inv_wschokolade",
	"life_inv_toiletpaper",
	"life_inv_schokolade",
	"life_inv_praline",
	"life_inv_kakaobohne",
	"life_inv_salat",
	"life_inv_tomate",
	"life_inv_gsalat",
	"life_inv_rollator",
	"life_inv_defibrillator",
	"life_inv_schrott",
	"life_inv_medizin",
	"life_inv_schrott_p",
	"life_inv_medizin_p",
	"life_inv_longbox",
	"life_inv_plastikmuell",
	"life_inv_football",
	"life_inv_airhorn",
	"life_inv_alterschuh",
	"life_inv_bananenschale",
	"life_inv_buegeleisen",
	"life_inv_dose",
	"life_inv_altesocke",
	"life_inv_fischdose",
	"life_inv_joint",
	"life_inv_papier",
	"life_inv_cable",
	"life_inv_reifen",
	"life_inv_aluminium",	
	"life_inv_pizzaschachtel",
	"life_inv_zschachtel_leer",
	"life_inv_zschachtel_voll",
	"life_inv_schrauben",
	"life_inv_spielzeugpuppe",
	"life_inv_stahl",
	"life_inv_tabakblatt",
	"life_inv_trinkpack",
	"life_inv_zigarette",
	"life_inv_zigarre",
	"life_inv_blueprintsport",
	"life_inv_blueprintifrit",
	"life_inv_blueprintqilin",
	"life_inv_blueprintprowler",
	"life_inv_blueprintcaesar",
	"life_inv_blueprintscooter",
	"life_inv_blueprintorca",
	"life_inv_schaufel",
	"life_inv_banane",
	"life_inv_goetzikopf",
	"life_inv_goetzitorso",
	"life_inv_goetziglied",
	"life_inv_bertramkopf",
	"life_inv_bertramtorso",
	"life_inv_bertramglied",
	"life_inv_momphredkopf",
	"life_inv_momphredtorso",
	"life_inv_momphredglied",
	"life_inv_ronkopf",
	"life_inv_rontorso",
	"life_inv_ronglied",
	"life_inv_johnkopf",
	"life_inv_johntorso",
	"life_inv_johnglied",
	"life_inv_goetzi",
	"life_inv_bertram",
	"life_inv_momphred",
	"life_inv_ron",
	"life_inv_john",
	"life_inv_lupe",
	"life_inv_volleyball"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_cg","cop"],
	["license_civ_lotse","civ"],	
	["license_civ_ausweis","civ"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_fly","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_hack","civ"],
	["license_civ_hack","cop"],
	["license_civ_hack","med"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_med_boat","med"],
	["license_civ_home","civ"],
	["license_civ_gruppe","civ"],
	["license_civ_presse","civ"],
	["license_civ_esc","civ"],
	["license_civ_ims","civ"],
	["license_civ_lud","civ"],
	["license_civ_pm","civ"],		
	["license_civ_imf","civ"],
	["license_civ_slg","civ"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_hunter","civ"],
	["license_civ_plutonium","civ"],
	["license_civ_holz","civ"],
	["license_civ_president","civ"],
	["license_civ_radio","civ"],
	["license_civ_archo","civ"]
];

//Licenses
{missionNamespace setVariable[(_x select 0),false]} foreach life_licenses;

life_apps =
[
	"app_auktion",
	"app_lizenzen",
	"app_dp",
	"app_konto",
	"app_hilfe",
	"app_karte",
	"app_crafting",
	"app_selfie",
	"app_notizen"
];

//Apps
{missionNamespace setVariable[_x,false]} foreach life_apps;

life_erfolge =
[
	"erfolg_level5",
	"erfolg_level10",
	"erfolg_donator",
	"erfolg_10mio",
	"erfolg_25mio",
	"erfolg_50mio",
	"erfolg_100mio",
	"erfolg_halloween",
	"erfolg_gang",
	"erfolg_rarzeug1",
	"erfolg_rarzeug2",
	"erfolg_rarzeug3",
	"erfolg_rarzeug4",
	"erfolg_rarzeug",
	"erfolg_herstellung",
	"erfolg_schatzsuche",
	"erfolg_muell",
	"erfolg_laterne",
	"erfolg_timemachine",
	"erfolg_house3",
	"erfolg_house7",
	"erfolg_pyromane",
	"erfolg_lizenzen",
	"erfolg_berufepol",
	"erfolg_berufemed",
	"erfolg_christmas",
	"erfolg_wschokolade",
	"erfolg_toilet",
	"erfolg_flieger",
	"erfolg_post",
	"erfolg_brummi",
	"erfolg_bankraub",
	"erfolg_kunstraub",
	"erfolg_andreas",
	"erfolg_euro2016",
	"erfolg_ingenieur",
	"erfolg_schneider",
	"erfolg_muellsammlung",
	"erfolg_bananarama",
	"erfolg_pirat"
];

//Erfolge
{missionNamespace setVariable[_x,false];} foreach life_erfolge;

//[shortVar,reward]
life_illegal_items =
[
	["heroinu",2850],
	["heroinp",4500],
	["cocaine",4500],
	["cocainep",6500],
	["marijuana",4800],
	["turtle",16000],
	["goldbar",100000],
	["blastingcharge",30000],
	["boltcutter",1500],
	["kidney",10000],
	["scalpel",1000],
	["moonshine",9000],
	["bottledshine",11000],
	["spikeStrip",5000],
	["lockpick",5000],
	["timemachine",1500000],
	["plutoniumu",1500],
	["plutonium",6500],
	["kabelbinder",7000],
	["kabelbinderkey",7000],
	["reichtum",50000],
	["skelett",10000],
	["joint",2000]
];

//Tutorials
Tutorialmenu = [
	["Im Web","Hilfreiche Links","<br/><a color='#ff1000' href='https://www.secretsofaltis.de'>Auf unsere Website</a><br/><a color='#ff1000' href='http://tinyurl.com/pzxf42h'>Direkt auf den Teamspeak</a><br/><a color='#ff1000' href='http://www.youtube.com/user/overpgamingyt/videos'>Spannende Trailer auf Youtube</a></t>","icons\items\quest.paa"],

	["Serverregeln","Serverregeln","Alle aktuellen <a color='#ff1000' href='https://www.secretsofaltis.de/index.php/altis/regelwerk'>Serverregeln</a> findest du auf unserer Website. Da du die AGB akzeptiert hast, solltest du diese Regeln bereits beherrschen!","icons\items\protestschild.paa"],

	["Tastenbelegung","Tasten und Tipps","<t color='#B51414'>Drücke 'H' um eine vollständige Auflistung aller Tastenbelegungen zu erhalten!</t><br/><br/>Drücke <t color='#B51414'>Shift + NUM -</t> und gebe dann 'flush' ein um den Grafikspeicher zu leeren (FPS Steigerung)<br /><br/>Drücke <t color='#B51414'>Shift + NUM -</t> und gebe dann 'fps' ein, bis im Fenster 0 angezeigt wird. (FPS Steigerung)<br /><br/>Drücke <t color='#B51414'>Z</t> und stell in den Einstellungen das Gras aus. (FPS Steigerung)<br/><br/>Gehe im ESC-Menü unter 'Konfigurieren' auf 'Spiel' -> 'Layout' und verschiebe das GPS-Overlay, falls es von unserem HUD blockiert wird!","icons\items\construction.paa"],

	["Tutorial: Levelsystem","Levelsystem","Bei uns ist es nur noch möglich per Level an bestimmte Dinge zu kommen. Darunter zählen wir Waffen, Kleidung, Fahrzeuge. Aber je nachdem welches Level du besitzt, kannst du auch Sachen freischalten, welche weitere Möglichkeiten bieten. (Wie beispielsweise AAN Nachrichten zu senden.).<br/><br/>'Erlevel' dir diese Möglichkeiten einfach indem du farmen gehst oder Müll- bzw. Postmissionen machst. Deiner Freiheit sind keine Grenzen gesetzt! Dein Level wird allerdings auch negativ beeinflusst, beispielsweise wenn du Bußgelder erhältst oder ins Gefängnis kommst. Diese Ereignisse ziehen dir nämlich wieder Erfahrung ab. (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/459-feature-tutorial-levelsystem/'>weiterlesen</a>)","icons\items\timemachine.paa"],

	["Tutorial: Jagen","Jagen","Es gibt 2 Jagdgebiete (Wildpark nahe Sofia und Nationalpark nahe Kavala), wo du folgende Tiere jagen kannst:<br/><br/>Hühner<br/>Schafe<br/>Ziegen<br/><br/>Du findest dort auch vermehrt Hasen und Schlangen. (Diese können aber auch außerhalb des Gebietes gejagt werden.)<br/><br/>Ein Jagdschein (45.000€) ist erforderlich, wenn du legal jagen gehen möchtest. Solltest du ohne Jagdschein erwischt werden, kann das teuer werden. Das rohe Fleisch der gejagten Tiere kann in den <br/>Schlachthöfen in der Nähe von Zaros oder Molos weiterverarbeitet und letztendlich zu den Metzgereien in Kavala oder Paros transportiert und verkauft werden. Je nach Tier, gibt dies unterschiedlich viel Geld. (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/456-farm-tutorial-jagen/'>weiterlesen</a>)","icons\items\jagdhorn.paa"],

	["Tutorial: Plutonium","Plutonium","Hinweis: Plutonium und unreines Plutonium sind illegal!<br/>Wie immer ist alles auf Vikos nicht mit einem Helikopter transportierbar.<br/><br/>Was du brauchst zum Plutonium farmen:<br/>1. Schutzanzug (Wissenschaftlerkleidung) 100k<br/>2. Spitzhacke<br/>3. Brückenzoll (30k wenn du in Vikos bei den Rebellen starten kannst, 60k bei Hin- und Rückweg.)<br/>4. (Optional) Chemikerausbildung (100k)<br/><br/>Du fährst auf der Halbinsel Vikos zur radioaktiven Zone. Zieh vorher deinen Schutzanzug an, sonst bist du binnen Minuten tot. <br/><br/> (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/454-farm-tutorial-plutonium/'>weiterlesen</a>)","icons\items\plutonium.paa"],

	["Tutorial: Alkohol","Alkoholherstellung","Alkohol kann folgendermaßen verarbeitet werden:<br/><br/>Hefe + Roggen = Whiskey --> Whiskey + Flaschen = Flasche Whiskey zum verkaufen<br/><br/>Hefe + Hopfen = Bier --> Bier + Flaschen = Flasche Bier zum verkaufen<br/><br/>Hefe + Maische = schwarzgebrannter Schnaps --> schwarzgebrannter Schnaps + Flaschen = Flasche schwarzgebrannter Schnaps zum verkaufen<br/><br/>Wasser(flasche) + Maismehl = Maische - Maische wird gebraucht um schwarzgebrannten Schnaps herzustellen<br/><br/> (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/453-farm-tutorial-alkohol/'>weiterlesen</a>)","icons\items\bier.paa"],

	["Tutorial: Müll","Müllabfuhr","Eine Müllmission nimmst du bei einer Müllinfo in einer Stadt an. Dort wählst du aus, in welcher Stadt, Bezirk und sogar Farbe dir der Marker angezeigt werden soll bzw. wo du arbeiten willst.<br/>Je kleiner der Marker, desto teurer natürlich die Summe die du investieren musst, da es für dich einfacher ist die Mülltonne zu finden.<br/><br/>Eine Mülltonne kannst du nur auf einen Geländewagen aufladen. Mülltonnen sind immer verschlossen und haben einen türkisen Deckel. Das Menü zum Aufladen findest du unter 'ENDE' auf deiner Tastatur. Solltest du eine Mülltonne gefunden und sie aufgeladen haben, musst du sie entweder zur Mülldeponie Kavala bzw. Athira bringen.<br/><br/>Eine Mülltonne gibt 30.000€ und ist nur einmal pro Serversitzung (alle 4 Stunden) vorhanden.","icons\items\plastik.paa"],

	["Tutorial: Forstsystem","Forstsystem","Du hast ebenfalls die Möglichkeit Holz zu hacken, dies im Sägewerk oder direkt über das Herstellungssystem zu verarbeiten und anschließend in einem der Möbelhäuser zu verkaufen.<br/><br/>Es gibt derzeitig 3 unterschiedliche Holzendprodukte:<br/><br/>- Bauholz (5x Holz benötigt)<br/>- Laminat (10x Holz benötigt)<br/>- Mahagoni (20x Holz benötigt)<br/><br/>Holz bekommst du in umliegenden Waldgebieten und du benötigst eine Axt um es sammeln zu können. Die Axt gibt es in jedem Werkzeugladen deines Vertrauens.","icons\items\holzv.paa"],

	["Tutorial: Telefonsystem","Telefonsystem","Das Telefonsystem ermöglicht dir, jemanden anzurufen und für 2 Minuten (über Telefonzelle) oder 5 Minuten (übers Smartphone) mit demjenigen zu reden.<br/><br/>Für ein Telefongespräch über das Smartphone benötigst du lediglich Guthaben auf deinem Smartphone (einsehbar unter 'Z' -> 'Anrufen')<br/><br/>Gespräche über die Telefonzellen sind anonym und können nur von der Polizei zurückverfolgt werden wenn die Gesprächszeit voll ausgenutzt wird. Gespräche über das Smartphone sind dementsprechend nicht anonym!","icons\items\guthaben.paa"],

	["Tutorial: Schatzsuche","Schatzsuche","Die Schatzsuche kann erst ab Level 4 und mithilfe eines Metalldetektors erfolgen.<br/><br/>Du musst dann lediglich das richtige Wrack (welches mit Schätzen gefüllt ist) in einem der 'ewigen Muschelgründe' im Meer finden.<br/>Du benötigst eine volle Taucherausrüstung und ggfs. ein Nachtsichtgerät!<br/><br/>Solltest du am Meeresboden angekommen sein, prüfst du einfach mit dem Metalldetektor, ob du am richtigen Wrack bist. Entferne dich während des Vorgangs nicht vom Wrack! <br/><br/>Die Ausbeute kann sehr hilfreich sein und auch viel Geld einbringen!<br/>","icons\items\goldbar.paa"],

	["Tutorial: Schokolade","Schokolade","Du hast die Möglichkeit aus einer winzigen Kakaobohne (Zu sammeln an der Kakaoplantage bei Syrta) sowohl Trinkkakao, Schokolade als auch Pralinen herzustellen.<br/>Für den Trinkkakao müssen die Kakaobohnen lediglich zur Abfüllanlage gebracht werden.<br/><br/>Solltest du aber Tafelschokolade oder Praline herstellen wollen, endet deine Reise bei der Schokoladenfabrik in Neochori.<br/><br/>Vergiss nicht, dass für die Praline als Zutat Schokolade und als Zusatz Schnaps (Kein abgefüllter Schnaps!) benötigt wird! (Mehr dazu im Tutorial [Alkohol])<br/><br/>Letzten Endes bringst du Schokolade und/oder Pralinen zur Konditorei nach Selakano. Den Trinkkakao kannst du bei jedem Markt verkaufen.","icons\items\schokolade.paa"],

	["Tutorial: Kunstraub","Kunstraub","Die Kunstgalerie 'Urban Art' südlich von Pyrgos öffnet seine Pforten für alle Bewohner dieser Insel. Zumindestens für die, die einen Bolzenschneider besitzen! Dies ist nämlich genau der Gegenstand, den du zum Knacken der Galerie benötigst.<br/>In der Kunstgalerie befinden sich rare Bilder von bekannten Persönlichkeiten, wie zum Beispiel Dimitri da Winschi.<br/><br/>Um diese Bilder einzusammeln wird mindestens 1 Kunstbehältnis benötigt. Der Kunstfälscher westlich der Horst-Andreas Gedächtnisbrücke beginnt seine Arbeit allerdings erst ab 5 Bildern, die vorher im Kunstbehältnis verpackt wurden. Dabei ist besonders zu beachten, dass maximal 1 Person die Bilder einsammelt, da diese NICHT an andere Spieler weitergegeben werden können.","icons\items\longbox.paa"],

	["Tutorial: Drogen","Drogen","Da wächst ja was! (Bekannter Spruch der altisianischen Geschichte).<br/><br/>Das alt bekannte beschweren der 'Ö-Taste' ist bei Drogen nun nicht mehr notwendig, da du die jeweiligen Pflanzen nun auch sehen kannst! Selbstverständlich sind für die Weiterverarbeitungen, die du selbst vornimmst, weiterhin Lehrgänge von Nöten.<br/><br/>Diese Lehrgänge sind bei den jeweiligen Verarbeitern erhältlich. Den jeweiligen Dealer findest du in verschiedenen Variationen von 'Dealer' auf der Karte, damit diese von der Polizei nicht direkt am Berufskennzeichen erkannt werden können.<br/><br/> (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/946-farm-tutorial-rauschmittel/'>weiterlesen</a>)","icons\items\cannabis.paa"],

	["Tutorial: Salz","Salz","Der Schornstein raucht!<br/><br/>Salz wird nun an der Salzgewinnungsanlage der Salzwüste gefördert, wie bei den Drogen entfällt auch hier das standardmäßige 'Ö-Tasten-Farmsystem'. Zunächst solltest du dein Fahrzeug unter den dafür vorgesehenen Abfülltrichter positionieren, um dann die Förderbänder zu starten. Die Förderbänder werden per Tastenklick am Monitor, welcher mit einem lila Pfeil markiert ist, gestartet. Wenn genügend Sole im Trichter angesammelt wurde, kann am daneben stehenden Schaltpult die Zufur geöffnet werden und die Sole in das darunter stehende Fahrzeug 'eingelassen' werden.<br/><br/>Die Verarbeitung von Sole zu Speisesalz kann nördlich von Sofia, am Molos-Flugfeld, an der Salzraffinerie vorgenommen werden, dazu wird wie gewohnt eine Lizenz benötigt. Der Salzankauf befindet sich westlich der Horst-Andreas Gedächtnisbrücke am AAC-Flugfeld.<br/><br/> (<a color='#ff1000' href='https://www.secretsofaltis.de/forum/index.php?thread/947-farm-tutorial-salz-ausgelegt-auf-flugzeug/'>weiterlesen</a>)","icons\items\salt.paa"]
];