enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "core\weather\fn_dynamicWeather.sqf";
[] execVM "core\cop\fn_teargas.sqf";
[] execVM "scripts\fn_fastrope.sqf";
[] execVM "scripts\fn_noSideChat.sqf";
[] execVM "scripts\fn_safeZone.sqf";
[] execVM "scripts\fn_disableSnakes.sqf";

null = [[Monitor1,Monitor2,Monitor3,Monitor4,Monitor5],["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19"]] execVM "scripts\fn_feedInit.sqf";

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

[] spawn life_fnc_showDirectVON;

StartProgress = true;

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;  
};

DYNAMICMARKET_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;