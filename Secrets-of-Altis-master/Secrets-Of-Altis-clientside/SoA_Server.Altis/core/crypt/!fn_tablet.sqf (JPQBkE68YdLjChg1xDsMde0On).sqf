if(!alive player || dialog) exitWith {};
private["_dialog","_appid","_appidaction"];
createdialog "tablet";
DisableSerialization;

_dialog = findDisplay 3400;

ctrlSetText[3480,format["%1%2",life_battery,"%"]];
ctrlSetText[3481,[1] call life_fnc_gettime];
ctrlSetText[3482,"Altis-Talk GmbH"];

_slotSettingsPic = _dialog displayCtrl 3401;
_slotSavePic = _dialog displayCtrl 3402;
_slotAppStorePic = _dialog displayCtrl 3403;
_slotAchievementPic = _dialog displayCtrl 3404;
_slotKeysPic = _dialog displayCtrl 3405;
_slotGroupPic = _dialog displayCtrl 3406;
_slotMessagePic = _dialog displayCtrl 3407;
_slotPhonePic = _dialog displayCtrl 3408;

_slotGuidePic = _dialog displayCtrl 3409;
_slotMapsPic = _dialog displayCtrl 3410;
_slotBankPic = _dialog displayCtrl 3411;
_slotLizenzenPic = _dialog displayCtrl 3412;
_slotSelfiePic = _dialog displayCtrl 3413;
_slotNotizPic = _dialog displayCtrl 3414;
_slotCraftingPic = _dialog displayCtrl 3415; 
_slotVersicherungenPic = _dialog displayCtrl 3416;
_slotDPPic = _dialog displayCtrl 3417;
_slotFahndungPic = _dialog displayCtrl 3418;
_slotProtocolPic = _dialog displayCtrl 3419;
_slotKennzeichenPic = _dialog displayCtrl 3420;
_slotEinsatzzentralePic = _dialog displayCtrl 4050;

_slotSettingsButton = _dialog displayCtrl 3421;
_slotSaveButton = _dialog displayCtrl 3422;
_slotAppstoreButton = _dialog displayCtrl 3423;
_slotAchievementButton = _dialog displayCtrl 3424;
_slotKeysButton = _dialog displayCtrl 3425;
_slotGroupButton = _dialog displayCtrl 3426;
_slotMessageButton = _dialog displayCtrl 3427;
_slotPhoneButton = _dialog displayCtrl 3428;

_slotGuideButton = _dialog displayCtrl 3429;
_slotMapsButton = _dialog displayCtrl 3430;
_slotBankButton = _dialog displayCtrl 3431;
_slotLizenzenButton = _dialog displayCtrl 3432;
_slotSelfieButton = _dialog displayCtrl 3433;
_slotNotizButton = _dialog displayCtrl 3434;
_slotCraftingButton = _dialog displayCtrl 3435; 
_slotVersicherungenButton = _dialog displayCtrl 3436;
_slotDPButton = _dialog displayCtrl 3437;
_slotFahndungButton = _dialog displayCtrl 3438;
_slotProtocolButton = _dialog displayCtrl 3439;
_slotKennzeichenButton = _dialog displayCtrl 3440;
_slotEinsatzzentraleButton = _dialog displayCtrl 4000;

{_x ctrlShow false} foreach [_slotCraftingPic,_slotGuidePic,_slotMapsPic,_slotBankPic,_slotLizenzenPic,_slotDPPic,_slotSelfiePic,_slotNotizPic,_slotFahndungPic,_slotProtocolPic,_slotVersicherungenPic,_slotKennzeichenPic,_slotEinsatzzentralePic,_slotCraftingButton,_slotGuideButton,_slotMapsButton,_slotBankButton,_slotLizenzenButton,_slotDPButton,_slotSelfieButton,_slotNotizButton,_slotFahndungButton,_slotProtocolButton,_slotVersicherungenButton,_slotKennzeichenButton,_slotEinsatzzentraleButton];
if(player getVariable ["restrained",false]) then {_slotMessageButton ctrlEnable false;_slotPhoneButton ctrlEnable false; _slotMessagePic ctrlEnable false; _slotPhonePic ctrlEnable false;};

_slotSettingspic ctrlSetText "images\tablet\apps\settings.paa";
_slotSavepic ctrlSetText "images\tablet\apps\save.paa";
_slotAppStorePic ctrlSetText "images\tablet\apps\appstore.paa";
_slotAchievementPic ctrlSetText "images\tablet\apps\achievement.paa";
_slotKeysPic ctrlSetText "images\tablet\apps\keys.paa";
_slotGroupPic ctrlSetText "images\tablet\apps\group.paa";
_slotMessagePic ctrlSetText "images\tablet\apps\message.paa";
_slotPhonePic ctrlSetText "images\tablet\apps\phone.paa";
_slotFahndungPic ctrlSetText "images\tablet\apps\lizenzen.paa";
_slotProtocolPic ctrlSetText "images\tablet\apps\protocol.paa";
_slotKennzeichenPic ctrlSetText "images\tablet\apps\protocol.paa";
_slotEinsatzzentralePic ctrlSetText "images\tablet\apps\phone.paa";

_slotCraftingPic ctrlSetText "images\tablet\apps\crafting.paa";
_slotGuidePic ctrlSetText "images\tablet\apps\guide.paa";
_slotMapsPic ctrlSetText "images\tablet\apps\map.paa";
_slotBankPic ctrlSetText "images\tablet\apps\bank.paa";
_slotLizenzenPic ctrlSetText "images\tablet\apps\lizenzen.paa";
_slotVersicherungenPic ctrlSetText "images\tablet\apps\insurance.paa";
_slotDPPic ctrlSetText "images\tablet\apps\dp.paa";
_slotSelfiePic ctrlSetText "images\tablet\apps\selfie.paa";
_slotNotizPic ctrlSetText "images\tablet\apps\notizen.paa";

_slotSaveButton buttonSetAction "[] call SOCK_fnc_syncData";
_slotSettingsButton buttonSetAction "[] call life_fnc_settingsMenu";
_slotAppStoreButton buttonSetAction "[0] spawn life_fnc_appstore";
_slotAchievementButton buttonSetAction "[0] spawn life_fnc_erfolgeinfo";
_slotKeysButton buttonSetAction "createdialog 'Life_key_management'";
_slotGroupButton buttonSetAction "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
_slotMessageButton buttonSetAction "createdialog 'sms'";
_slotPhoneButton buttonSetAction "[0] spawn life_fnc_phone";
_slotFahndungButton buttonSetAction "[] call life_fnc_wantedMenu";
_slotProtocolButton buttonSetAction "createdialog 'protocol'";
_slotKennzeichenButton buttonSetAction "createdialog 'kennzeichen_abfrage'";
_slotEinsatzzentraleButton buttonSetAction "createdialog 'einsatzzentrale'";

_slotCraftingButton buttonSetAction "[] spawn life_fnc_craft";
_slotGuideButton ButtonSetAction "[0] spawn life_fnc_hilfe";
_slotMapsButton ButtonSetAction "[] call life_fnc_altismaps";
_slotBankButton ButtonSetAction "[] spawn life_fnc_openMarketView";
_slotLizenzenButton ButtonSetAction "[0] call life_fnc_lizenzen";
_slotVersicherungenButton ButtonSetAction "[0] call life_fnc_versicherung";
_slotDPButton ButtonSetAction "createdialog 'getpostmission'";
_slotSelfieButton ButtonSetAction "createdialog 'selfie'";
_slotNotizButton ButtonSetAction "createdialog 'notizen'";


switch(playerside) do {
	case west: {
		_slotFahndungPic ctrlShow true; 
		_slotFahndungButton ctrlShow true;
		_slotProtocolPic ctrlShow true;
		_slotProtocolButton ctrlShow true;
		_slotBankPic ctrlShow true;
		_slotBankButton ctrlShow true;
		_slotLizenzenPic ctrlShow true;
		_slotLizenzenButton ctrlShow true;
		_slotNotizPic ctrlShow true;
		_slotNotizButton ctrlShow true;
		_slotSelfiePic ctrlShow true;
		_slotSelfieButton ctrlShow true;
		_slotVersicherungenPic ctrlShow true;
		_slotVersicherungenButton ctrlShow true;
		_slotKennzeichenPic ctrlShow true;
		_slotKennzeichenButton ctrlShow true;
		_slotCraftingButton ctrlShow true;
		_slotCraftingPic ctrlShow true;

		_slotAppStorePic ctrlEnable false;
		_slotAppStoreButton ctrlEnable false;
		_slotGroupPic ctrlEnable false;
		_slotGroupButton ctrlEnable false;

		if((call life_coplevel) < 9) then {_slotProtocolButton ctrlEnable false; _slotProtocolPic ctrlSetTextColor [0.5,0.5,0.5,0.5]};
		if(str player != "cop") then {_slotKennzeichenButton ctrlEnable false; _slotKennzeichenPic ctrlSetTextColor [0.5,0.5,0.5,0.5]};
		
		_slotAppStorePic ctrlSetTextColor [0.5,0.5,0.5,0.5];
		_slotGroupPic ctrlSetTextColor [0.5,0.5,0.5,0.5];
	};
	
	case independent: {
		_slotProtocolPic ctrlShow true;
		_slotBankPic ctrlShow true;
		_slotBankButton ctrlShow true;
		_slotLizenzenPic ctrlShow true;
		_slotLizenzenButton ctrlShow true;
		_slotNotizPic ctrlShow true;
		_slotNotizButton ctrlShow true;
		_slotSelfiePic ctrlShow true;
		_slotSelfieButton ctrlShow true;
		_slotVersicherungenPic ctrlShow true;
		_slotVersicherungenButton ctrlShow true;
		_slotEinsatzzentralePic ctrlShow true;		
		_slotEinsatzzentraleButton ctrlShow true;
		_slotCraftingButton ctrlShow true;
		_slotCraftingPic ctrlShow true;

		_slotAppStorePic ctrlEnable false;
		_slotAppStoreButton ctrlEnable false;
		_slotGroupPic ctrlEnable false;
		_slotGroupButton ctrlEnable false;
		
		_slotAppStorePic ctrlSetTextColor [0.5,0.5,0.5,0.5];
		_slotGroupPic ctrlSetTextColor [0.5,0.5,0.5,0.5];
	};

	case civilian: {
		{
			_val = missionNamespace getVariable _x;
			if(_val) then
			{
				switch(_x) do {
					case "app_hilfe": {_slotGuidePic ctrlShow true; _slotGuideButton ctrlShow true;};
					case "app_karte": {_slotMapsPic ctrlShow true; _slotMapsButton ctrlShow true;};
					case "app_konto": {_slotBankPic ctrlShow true; _slotBankButton ctrlShow true;};
					case "app_lizenzen": {_slotLizenzenPic ctrlShow true; _slotLizenzenButton ctrlShow true;};
					case "app_auktion": {_slotVersicherungenPic ctrlShow true; _slotVersicherungenButton ctrlShow true;};
					case "app_dp": {_slotDPPic ctrlShow true; _slotDPButton ctrlShow true;};
					case "app_crafting": {_slotCraftingPic ctrlShow true; _slotCraftingButton ctrlShow true;};
					case "app_selfie": {_slotSelfiePic ctrlShow true; _slotSelfieButton ctrlShow true;};
					case "app_notizen": {_slotNotizPic ctrlShow true; _slotNotizButton ctrlShow true;};
				};
			};
		} foreach life_apps;
	};
};