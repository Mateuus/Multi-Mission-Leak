	/*
        Mode:
			0: remote execution is blocked
			1: only whitelisted functions/commands are allowed for remote execution
			2: remote execution fully opened

		allowedTargets:
			0: can target all machines (default)
			1: can target only clients, execution on server is denied
			2: can target only server, execution on clients is denied

		jip:
			0: JIP flag cannot be set
			1: JIP flag can be set (default) // Jetzt ausführen und für jeden joinenden Spieler
	*/

	#define ALL 0
	#define CLIENTS 1
	#define SERVER 2
	
	
		class Commands
        {
                mode = 1;
				jip = 0;
                //class setFuel {allowedTargets = SERVER;};           //execute only on server
                //class hint {jip = ALL;};                         //jip is not allowed for this command
				class diag_log {};
				class hint {};
				class systemChat {};
				//class skipTime {allowedTargets = SERVER;};
        };

        class Functions
        {
                mode = 1;
                jip = 0;                                       //no functions can use jip

                class DWEV_fnc_pulloutVeh {allowedTargets = CLIENTS;};
				class SOCK_fnc_requestReceived {allowedTargets = CLIENTS;};
				class DB_fnc_queryRequest {allowedTargets = ALL;};
				class DWEV_fnc_wantedBounty {allowedTargets = SERVER;};
				class DWEV_fnc_jail {allowedTargets = CLIENTS;};
				class DWEV_fnc_broadcast {allowedTargets = CLIENTS;};
				class DWEV_fnc_animSync {allowedTargets = CLIENTS;};
				class DWEV_fnc_moveIn {allowedTargets = CLIENTS;};
				class DWEV_fnc_robPerson {allowedTargets = CLIENTS;};
				class DWEV_fnc_robReceive {allowedTargets = CLIENTS;};
				class DWF_fnc_robBanks {allowedTargets = ALL;};
				class DWF_fnc_bankState {allowedTargets = ALL;};
				class DWEV_fnc_wantedAdd {allowedTargets = SERVER;};
				class DWEV_fnc_addSell {allowedTargets = SERVER;};
				class DWEV_fnc_addBuy {allowedTargets = SERVER;};
				class DWEV_fnc_addBuyProm {allowedTargets = SERVER;};
				class DWF_fnc_vehicleStore {allowedTargets = ALL;};
				class DWEV_fnc_restrain {allowedTargets = CLIENTS;};
				class DWF_fnc_robShops {allowedTargets = ALL;};
				class DWF_fnc_shopState {allowedTargets = SERVER;};
				class DWEV_fnc_searchClient {allowedTargets = CLIENTS;};
				class DWEV_fnc_setFuel {allowedTargets = ALL;};
				class DWEV_fnc_hasOrgan {allowedTargets = CLIENTS;};
				class DWF_fnc_getID {allowedTargets = SERVER;};
				class DWF_fnc_player_query {allowedTargets = CLIENTS;};
				class DWEV_fnc_jaiISys {allowedTargets = SERVER;};
				class DWEV_fnc_wantedRemove {allowedTargets = SERVER;};
				class DWEV_fnc_knockedOut {allowedTargets = CLIENTS;};
				class CLIENT_fnc_kickMe {allowedTargets = SERVER;};
				class DWEV_fnc_tazeSound {allowedTargets = CLIENTS;};
				class DWEV_fnc_licenseCheck {allowedTargets = CLIENTS;};
				class DWEV_fnc_licensesRead {allowedTargets = CLIENTS;};
				class DWEV_fnc_alcoholCheck {allowedTargets = CLIENTS;};
				class DWEV_fnc_alcoholRead {allowedTargets = CLIENTS;};
				class DWEV_fnc_drugCheck {allowedTargets = CLIENTS;};
				class DWEV_fnc_drugRead {allowedTargets = CLIENTS;};
				class DWEV_fnc_searchClientGun {allowedTargets = CLIENTS;};
				class DWEV_fnc_copSearch {allowedTargets = CLIENTS;};
				class DWEV_fnc_removeWeaponBack {allowedTargets = CLIENTS;};
				class DWEV_fnc_showClientGuns {allowedTargets = CLIENTS;};
				class DWEV_fnc_copLights {allowedTargets = CLIENTS;};
				class DWEV_fnc_medicLights {allowedTargets = CLIENTS;};
				class DWEV_fnc_ticketPrompt {allowedTargets = CLIENTS;};
				class DWEV_fnc_ticketPaid {allowedTargets = CLIENTS;};
				class DWEV_fnc_globalSoundClient {allowedTargets = CLIENTS;};
				class DWF_fnc_updateHouseContainerInventory {allowedTargets = ALL;};
				class DB_fnc_saveVehInventory {allowedTargets = ALL;};
				class DWEV_fnc_copSiren {allowedTargets = CLIENTS;};
				class DWEV_fnc_copSiren1 {allowedTargets = CLIENTS;};
				class DWEV_fnc_copSiren2 {allowedTargets = CLIENTS;};
				class DWEV_fnc_medicSiren {allowedTargets = CLIENTS;};
				class DWEV_fnc_lockVehicle {allowedTargets = ALL;};
				class DB_fnc_saveVehTrunk {allowedTargets = ALL;};
				class DWF_fnc_updateHouseContainerTrunk {allowedTargets = ALL;};
				class DWF_fnc_insertHouseContainer {allowedTargets = ALL;};
				class DWEV_fnc_giveDiff {allowedTargets = CLIENTS;};
				class DWEV_fnc_keyManagement {allowedTargets = SERVER;};
				class DWEV_fnc_admininfo {allowedTargets = CLIENTS;};
				class DWF_fnc_managesc {allowedTargets = SERVER;};
				class DWF_fnc_insertGang {allowedTargets = ALL;};
				class DWF_fnc_removeGang {allowedTargets = ALL;};
				class DWF_fnc_updateGang {allowedTargets = ALL;};
				class DWEV_fnc_gangInvite {allowedTargets = CLIENTS;};
				class DWF_fnc_clientGangKick {allowedTargets = CLIENTS;};
				class DWF_fnc_clientGangLeft {allowedTargets = CLIENTS;};
				class DWF_fnc_clientGangLeader {allowedTargets = CLIENTS;};
				class DWF_fnc_addHouse {allowedTargets = ALL;};
				class DWEV_fnc_lightHouse {allowedTargets = CLIENTS;};
				class DWF_fnc_sellHouse {allowedTargets = ALL;};
				class DWEV_fnc_demoChargeTimer {allowedTargets = CLIENTS;};
				class DWEV_fnc_carAlarm {allowedTargets = CLIENTS;};
				class DWF_fnc_spikeStrip {allowedTargets = ALL;};
				class DWEV_fnc_removeLicenses {allowedTargets = CLIENTS;};
				class DWEV_fnc_medicRequest {allowedTargets = CLIENTS;};
				class DWEV_fnc_corpse {allowedTargets = CLIENTS;};
				class DWEV_fnc_revived {allowedTargets = CLIENTS;};
				class DWEV_fnc_ticketmePrompt {allowedTargets = CLIENTS;};
				class DWEV_fnc_ticketmePaid {allowedTargets = CLIENTS;};
				class DWEV_fnc_receiveItem {allowedTargets = CLIENTS;};
				class DWEV_fnc_receiveMoney {allowedTargets = CLIENTS;};
				class DWF_fnc_clientGetKey {allowedTargets = CLIENTS;};
				class DWEV_fnc_wantedPardon {allowedTargets = SERVER;};
				class DWEV_fnc_wantedFetch {allowedTargets = SERVER;};
				class DWEV_fnc_EZread {allowedTargets = ALL;};
				class DWEV_fnc_EZedit {allowedTargets = ALL;};
				class DWEV_fnc_EZadd {allowedTargets = ALL;};
				class DB_fnc_insertRequest {allowedTargets = ALL;};	// Überarbeitet
				//class DB_fnc_BanPlayer {allowedTargets = SERVER;};
				class DWEV_fnc_jumpfnc {allowedTargets = CLIENTS;};
				class DB_fnc_updatePartial {allowedTargets = ALL;};  	// Überarbeitet
				class DB_fnc_updateRequest {allowedTargets = ALL;};  	// Überarbeitet
				class DWF_fnc_chopShopSell {allowedTargets = ALL;};
				class DWF_fnc_setObjVar {allowedTargets = SERVER;};
				class DWF_fnc_setObjVars {allowedTargets = SERVER;};
				class DWEV_fnc_colorVehicle {allowedTargets = ALL;};
				class DWF_fnc_keyManagement {allowedTargets = SERVER;};
				class DWF_fnc_vehicIeCreate {allowedTargets = ALL;};
				class DWEV_fnc_vehicleEmpd {allowedTargets = CLIENTS;};
				class DWF_fnc_vehicleRepaint {allowedTargets = ALL;};
				class DWEV_fnc_vehicleWarned {allowedTargets = CLIENTS;};
				class DWF_fnc_addVehicleAlarm {allowedTargets = ALL;};
				class DWF_fnc_addVehicleSperre {allowedTargets = ALL;};
				class DWEV_fnc_soundDevice {allowedTargets = CLIENTS;};
				class DWF_fnc_clientWireTransfer {allowedTargets = CLIENTS;};
				class DWF_fnc_vehicleDelete {allowedTargets = ALL;};		//<<<<<<<<<
				class DWF_fnc_spawnVehicIe {allowedTargets = ALL;}; 		// Überarbeitet
				class DWF_fnc_getVehicle {allowedTargets = ALL;};  		// Überarbeitet
				class DWF_fnc_clientMessage {allowedTargets = CLIENTS;};
				class DWEV_fnc_networkSetVar {allowedTargets = CLIENTS;};
				class DWEV_fnc_gangCreated {allowedTargets = CLIENTS;};
				class DWEV_fnc_gangDisbanded {allowedTargets = CLIENTS;};
				class DWEV_fnc_hcHeartBeatRecive {allowedTargets = SERVER;};
				class DWEV_fnc_jailMe {allowedTargets = CLIENTS;};
				class DWEV_fnc_execJailTimer {allowedTargets = CLIENTS;};
				class SOCK_fnc_dataQuery {allowedTargets = CLIENTS;};
				class SOCK_fnc_insertPlayerInfo {allowedTargets = CLIENTS;};
				class DWEV_fnc_bankState {allowedTargets = CLIENTS;};
				class DWEV_fnc_adminid {allowedTargets = CLIENTS;};
				class DWEV_fnc_impoundMenu {allowedTargets = CLIENTS;};
				class DWEV_fnc_robBanks2 {allowedTargets = ALL;};
				class DWEV_fnc_robShops2 {allowedTargets = ALL;};
				class DWEV_fnc_shopState {allowedTargets = ALL;};
				class DWEV_fnc_garageRefund {allowedTargets = CLIENTS;};
				class DWEV_fnc_addVehicle2Chain {allowedTargets = CLIENTS;};
				class DWEV_fnc_vehicleAnimate {allowedTargets = CLIENTS;};
				class DWEV_fnc_spikeStripEffect {allowedTargets = CLIENTS;};
				class DWEV_fnc_bountyReceive {allowedTargets = CLIENTS;};
				class DWEV_fnc_bountyjail {allowedTargets = CLIENTS;};
				class DWEV_fnc_wantedList {allowedTargets = CLIENTS;};
				class DWEV_fnc_wantedRestoreAdd {allowedTargets = SERVER;};
				class dwf_fnc_cleanuprequest {allowedTargets = ALL;};
				class DWEV_fnc_painballHitConfirmed {allowedTargets = CLIENTS;};
				class DB_fnc_saveVehFuel {allowedTargets = ALL;};
				class DWF_fnc_removeNoobProtection {allowedTargets = ALL;};
				class DWF_fnc_saveCombatlog {allowedTargets = ALL;};
				class GHB_fnc_handleMessages {allowedTargets = ALL;};
				class GHB_fnc_msgRequest {allowedTargets = ALL;};
				class DWEV_fnc_ticketopforPaid {allowedTargets = CLIENTS;};
				class DWEV_fnc_ticketopforPrompt {allowedTargets = CLIENTS;};
				class dws_fnc_switchmove {allowedTargets = ALL;};
				class DWEV_fnc_backupCall {allowedTargets = CLIENTS;};
				class DWF_fnc_adminVonChannel {allowedTargets = SERVER;};
				class DWF_fnc_clientueber {allowedTargets = CLIENTS;};
				class DWEV_fnc_taxiMenu {allowedTargets = CLIENTS;};
				class MSR_fnc_callTaxi {allowedTargets = ALL;};
				class DB_fnc_logToDB {allowedTargets = ALL;};
				class DWEV_fnc_Lizenzsehen {allowedTargets = CLIENTS;};
				class DB_fnc_adventslose {allowedTargets = ALL;};
				class DWF_fnc_addToStateBank {allowedTargets = ALL;};
				class DWF_fnc_getFromStateBank {allowedTargets = ALL;};
				class DWF_fnc_getGasFromStateBank {allowedTargets = ALL;};
				class DWF_fnc_getStateBankValue {allowedTargets = SERVER;};
				class DB_fnc_bugreport {allowedTargets = ALL;};
				class DWF_fnc_lockBanks {allowedTargets = SERVER;};
				class DWEV_fnc_pingRequest {allowedTargets = CLIENTS;};
				class DWEV_fnc_pingRecived {allowedTargets = CLIENTS;};
				class DWEV_fnc_webcamHouse {allowedTargets = CLIENTS;};
				class DWF_fnc_upgradeSecurity {allowedTargets = ALL;};
				class DWEV_fnc_HouseAlarm {allowedTargets = CLIENTS;};
				class DWEV_fnc_HouseMarker {allowedTargets = CLIENTS;};
				class DWF_fnc_updateHouseFurniturePos {allowedTargets = ALL;};
				class DWF_fnc_updateHouseContainerPos {allowedTargets = ALL;};
				class DWF_fnc_removeHouseContainer {allowedTargets = ALL;};
				class DWEV_fnc_fwzentral {allowedTargets = ALL;};
				//class BIS_fnc_execVM {allowedTargets = SERVER;};
				class DWF_fnc_setWeather {allowedTargets = SERVER;};
				class DWF_fnc_saveFuelCargo {allowedTargets = ALL;};
				class DWF_fnc_killLog {allowedTargets = ALL;};
				class DWF_fnc_lifeTravel {allowedTargets = SERVER;};
				class DWEV_fnc_useFerry {allowedTargets = ALL;};
				class DWEV_fnc_travelPlayerArrived {allowedTargets = ALL;};
				class DWF_fnc_travelVehicleArrived {allowedTargets = ALL;};
				class DWF_fnc_moveTravelPlayerInVehicle {allowedTargets = SERVER;};
				class DWF_fnc_lottoAdd {allowedTargets = SERVER;};
				class DWF_fnc_addIllegalControllerAmount {allowedTargets = SERVER;};
				class DWF_fnc_gangBankDeposit {allowedTargets = ALL;};
				class DWF_fnc_gangBankWithdraw {allowedTargets = ALL;};
				class DWF_fnc_leaveGang {allowedTargets = ALL;};
				class DWF_fnc_addGangPlayer {allowedTargets = ALL;};
				class DWF_fnc_setPlayerGangRank {allowedTargets = ALL;};
				class DWF_fnc_newGangLeader {allowedTargets = ALL;};
				class DWEV_fnc_logTicket {allowedTargets = SERVER;};
				class DWF_fnc_vAH_init {allowedTargets = SERVER;};
				class DWF_fnc_vAH_update {allowedTargets = SERVER;};
				class DWEV_fnc_vAH_reciever {allowedTargets = CLIENTS;};
				class DWEV_fnc_perso_laden {allowedTargets = CLIENTS;};
				class DWEV_fnc_persoBeantragen {allowedTargets = CLIENTS;};
				class DWEV_fnc_persoCheck {allowedTargets = CLIENTS;};
				class DWEV_fnc_persoErgebnis {allowedTargets = CLIENTS;};
				class DWEV_fnc_persoNeu {allowedTargets = CLIENTS;};
				class DWEV_fnc_updateMonat {allowedTargets = CLIENTS;};
				class DWEV_fnc_updateTag {allowedTargets = CLIENTS;};
				class DWEV_fnc_zeigePerso {allowedTargets = CLIENTS;};
				class DWEV_fnc_updatePersoBild {allowedTargets = CLIENTS;};
				class DWEV_fnc_simDisable {allowedTargets = ALL;};
				class DB_fnc_persoRequest {allowedTargets = ALL;};
				class DB_fnc_persoInsert {allowedTargets = ALL;};
				class DB_fnc_persoUpdate {allowedTargets = ALL;};
        };