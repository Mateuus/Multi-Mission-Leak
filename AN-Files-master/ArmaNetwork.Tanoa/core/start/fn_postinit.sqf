if(!hasInterface) exitWith {};
enableSaving [false, false];
setGroupIconsVisible [false,false];
player allowDamage false;
if (getNumber(missionConfigFile >> "DebugMode") isEqualTo 1) then
{
    onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
    diag_log "DEBUG MODE: ON";
};
if(didJIP) then {};
0 fadeSound 0;
if(!(side player in [west,independent,civilian])) exitWith {};
player setVariable ["BIS_noCoreConversations",true];
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call BIS_fnc_MPexec};
enableSentences false;
player disableConversation true;
enableRadio false;
setViewDistance 1000;
setObjectViewDistance [835,100];
setTerrainGrid 50;
call life_fnc_xathaxus;
DYNAMICMARKET_boughtItems = [];
[getPlayerUID player] remoteExecCall ["TON_fnc_playerLogged",2];
waitUntil {!isNil "SideInfo"};
[] call life_fnc_nudrevep;
[] spawn life_fnc_dravutra;
