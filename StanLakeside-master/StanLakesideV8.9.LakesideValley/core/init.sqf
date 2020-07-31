#include <macro.h>
/*
	Master client initialization file
*/

// Run Some Client Stuff
[] execVM "A3L_Stuff\bank.sqf";




player setVariable["tf_receivingDistanceMultiplicator", 10];
player setVariable["tf_sendingDistanceMultiplicator", 10];
deadPlayer = false;
candy = 0;
scarylevel = 0;
godMode = false;
// A3L CURRENT VERSION

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];

_timeStamp = diag_tickTime;

waitUntil {!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";






[] call life_fnc_setupEVH;
waitUntil {(!isNil {clientGangLeader})};

A3L_Fnc_Request = player;
PublicvariableServer "A3L_Fnc_Request";
waitUntil {(!isNil {A3L_fnc_dreDeta8})};

["Czekam az serwer bedzie gotowy..", false] spawn domsg;

waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	["The server-side extension extDB was not loaded into the engine, report this to the server admin.", false] spawn domsg;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
["Serwer gotowy! Lacze z gra...", false] spawn domsg;

[] spawn life_fnc_escInterupt;



fnc_checkPhone = {

	_radios = player call TFAR_fnc_radiosList;

	if(count _radios > 0) then {
		if([(call TFAR_fnc_activeSwRadio),"cg_tabletd"] call TFAR_fnc_isSameRadio) then {  

		} else {
			_myradio = call TFAR_fnc_ActiveSwRadio;
			player unassignitem _myradio;
			player removeitem _myradio;
			player additem "cg_tabletd";
			player assignitem "cg_tabletd";
		};
	} else {
		player additem "cg_tabletd";
		player assignitem "cg_tabletd";
	};

	call TFAR_fnc_HideHint;

};

fnc_resetCallSpawn = {
	player setvariable["PhoneCallNumber",0,true];
	player setvariable["PhoneID",0,true];
	player setVariable ["tf_unable_to_use_radio", true];
	sleep 5;
	callInProgress = false;
	myCallOwner = player;
	_mynumber = getPlayerUID player;
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, _mynumber] call TFAR_fnc_SetChannelFrequency;
	call TFAR_fnc_HideHint;
};



switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case east:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

[] execFSM "core\fsm\client.fsm";
waitUntil {!(isNull (findDisplay 46))};

player addRating 99999999;

life_sidechat = true;
[player,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",2];
marker_on = false;
godMode = false;

//arrays for masked items
GoggleList = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","A3L_Balaclava","Payday_Cagoule","Masque_Chirurgical","Masque_Solitaire","TRYK_kio_balaclava_ESS","Mask_M40","G_Bandanna_blk","G_Bandanna_oli"];		
HatList = ["kio_vfv_mask","cg_dinomask","cg_dinomask_p","cg_dinomask_r","cg_horsehead","cg_horsehead_2",
"cg_horsehead_blk","cg_horsehead_pnk","Masque_Alien1","Masque_Anonymous","Masque_Chains","Payday_GeneralO","Casque_Moto",
"Masque_Clinton","Masque_speedRunner","Masque_Unic","Masque_Aubrey","Masque_Bonnie","Masque_Bush","Masque_Mempo","Masque_Lincoln",
"Masque_Wolfv2","Masque_archNemesis","Masque_Arnold","Masque_Chuck","Masque_Clover","Masque_Fish","Masque_Hockey","Masque_Metalhead",
"Masque_Religieuse","Masque_Smiley","Masque_Santa","Masque_Momie","Masque_Optimiste","Masque_forceAlpha","Masque_GdG","Masque_Gombo",
"Masque_Lion","Masque_Orc","Masque_Mark","Masque_Macrilleuse","Masque_Hoxton","Masque_Incendiaire","Masque_Dallas","A3L_Legoman",
"jokermask","TRYK_Kio_Balaclava","A3L_Halloween_JigSaw","kio_skl_msk","kio_skl_msk_grn","kio_skl_msk_red","H_RacingHelmet_1_black_F",
"H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_blue_F","H_RacingHelmet_1_yellow_F","H_RacingHelmet_1_green_F",
"H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F","H_ShrekMask","H_MickeyMask","H_UltronMask","H_PatriotMask",
"H_AntmanMask","H_BobaMask","H_AugustusMask","H_RAAMMask","H_HulkMask","H_VenomMask","H_SpongebobMask","H_SquidwardMask",
"H_JasonMask","H_DeadpoolMask","H_GingerbreadMask","H_KermitMask","H_SpidermanMask","H_StarFoxMask","H_BatmanMask",
"H_ScarecrowMask","H_GuyFawkesMask","H_WashingtonMask","H_LincolnMask","H_GrantMask","H_NixonMask","H_ClintonMask","H_BushMask","H_ObamaMask",
"H_FranklinMask","Gorb_Santa_White","Gorb_Santa_Tan","Gorb_Santa_Black","Gorb_Reindeer","Gorb_Snowman","Gorb_Penguin","Gorb_Gingerbread1",
"Gorb_ElfMask1","Gorb_ElfMask2","Gorb_ElfMask3","Gorb_TurkeyMask1","Gorb_TurkeyMask2","Gorb_TurkeyMask3","Gorb_UglyMrsClaus1","Gorb_UglyMrsClaus2",
"Gorb_UglyMrsClaus3","Gorb_AngryGingerbread1","Gorb_AngryGingerbread2","Gorb_AngryGingerbread3","Gorb_PuddingMask1","Gorb_PuddingMask2",
"Gorb_RoughSantaClaus1","Gorb_RoughSantaClaus2","Gorb_RoughSantaClaus3","Gorb_AngryGingerbreadSwirl1","Gorb_AngryGingerbreadSwirl2",
"Gorb_CoolElfMask1","Gorb_CoolElfMask2","Gorb_CoolElfMask3","Gorb_TreeMask1","Gorb_TreeMask2","Gorb_TreeMask3","Gorb_TreeMask4","Gorb_TreeMask5",
"Gorb_TreeMask6","Gorb_MrsClaus1","Gorb_MrsClaus2","Gorb_MrsClaus3","kio_skl_msk_fire","kio_skl_msk_weed","kio_skl_msk_frost","kio_skl_msk_pun",
"kio_skl_msk_adc","kio_skl_msk_blood","kio_skl_msk_redranger","kio_skl_msk_UK","kio_skl_msk_US","kio_skl_msk_black","kio_skl_msk_can","kio_skl_msk_german",
"kio_skl_msk_GOW","kio_skl_msk_grey","kio_skl_msk_irish","kio_skl_msk_nirish","kio_skl_msk_o","kio_skl_msk_p","kio_skl_msk_scot","kio_skl_msk_fran"];


LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
//LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

KK_fnc_forceRagdoll = compileFinal
"
	if (vehicle player != player || godMode) exitWith {};
	private ""_rag"";
	godMode = true;
	player allowdamage false;
	_rag = ""Land_Can_V3_F"" createVehicleLocal [0,0,0];
	_rag setMass 1e10;
	_rag attachTo [player, [0,0,0], ""Spine3""];
	_rag setVelocity [0,0,8];
	detach _rag;
	0 = _rag spawn {
		deleteVehicle _this;
		uisleep 1;
		godMode = false;
		player allowdamage true;
	};
";

player addEventHandler ["AnimStateChanged", {
	if (_this select 1 == "incapacitated") then {
		player setPosWorld getPosWorld player;
	};
}];

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.

if!(getRemoteSensorsDisabled)then
{
	disableRemoteSensors true;
};

ASAGNDJSN = true;


[] spawn {
	life_canrob = false;
	sleep 600;
	life_canrob = true;	
};