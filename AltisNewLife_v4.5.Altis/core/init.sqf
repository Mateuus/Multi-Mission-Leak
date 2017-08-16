#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define SVAR setVariable
#define GETC(var) (call var)
#define steamid getPlayerUID player

private "_handle";
life_firstSpawn = true;
life_session_completed = false;

waitUntil {!isNull player && player == player};
setDefaultCamera [[3150.5,13097.5,71],[1,0,0]];
1 fadeSound 0;
1 fadeMusic 0;
1 fadeSpeech 0;
enableRadio false;
0 fadeRadio 0;

cutText["Configuration en cours, merci de patienter...","BLACK FADED"];
0 cutFadeOut 9999999;

waitUntil {(!isNil {fnc_setupconfig})};
_handle = [] spawn fnc_setupconfig;
waitUntil {scriptDone _handle;};

[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
[] call compile PreprocessFileLineNumbers "core\init\initRSSystem.sqf";
[] call life_fnc_initEVH;

life_ppColor = ppEffectCreate ["colorCorrections",2015];
life_ppColor ppEffectEnable true;
life_ppColor ppEffectAdjust [1,1,-0.03,[0,0,0,0],[0.4,0.3,0.2,1.3],[1,1,1,0]];
life_ppColor ppEffectCommit 0;

waitUntil {(!isNil {TON_fnc_clientGangLeader})};
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
cutText["Configuration client terminé","BLACK FADED"];
0 cutFadeOut 9999999;

[] spawn life_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};	
	case civilian:
	{
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};	
	case independent:
	{
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};	
	case east:
	{
		_handle = [] spawn life_fnc_initAdac;
		waitUntil {scriptDone _handle};
	};
};

player SVAR["restrained",false,true];
player SVAR["Escorting",false,true];
player SVAR["transporting",false,true];

player switchCamera "EXTERNAL";
setCurrentChannel 5;
1 fadeSound 1;
1 fadeMusic 1;
1 fadeSpeech 1;

[] execFSM "core\fsm\altisnewlife.fsm";
waitUntil {!(isNull (findDisplay 46))};
[] call life_fnc_settingsInit;

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
player addRating 99999999;

life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player SVAR["steam64ID",steamid];
player SVAR["realname",profileName,true];

player enableFatigue false;

life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";
life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	compte_banque = compte_banque + _price;
";
[] execVM "core\init\init_survival.sqf";
CONST(life_paycheck,life_paycheck);
[] execVM "scripts\IgiLoadinit.sqf";
DYNAMICMARKET_boughtItems = [];
[[steamid],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;
life_init = true;

waitUntil {vAH_loaded};
private["_total","_uid","_toDel"];
_total = 0;
_toDel = [];
_uid = getPlayerUID player;
{if ((_x select 5 == _uid) && (_x select 7 == 2)) then {_total = _total + (_x select 4);_toDel pushBack (_x select 0)};}forEach all_ah_items;
 
if (_total > 0) then {
{[[1,_x],"TON_fnc_vAH_update",false,false] spawn life_fnc_mp;}forEach _toDel;
[[0,format["Durant votre absence, vous avez vendu pour %1€ de marchandise au marché noir",[_total]call life_fnc_numberText]],"life_fnc_broadcast",player,false] spawn life_fnc_MP;
compte_banque = compte_banque + _total;
};