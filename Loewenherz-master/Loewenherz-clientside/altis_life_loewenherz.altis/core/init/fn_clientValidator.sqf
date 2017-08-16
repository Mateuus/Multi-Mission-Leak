/*
	Description:
	Loops through a list of variables and checks whether
	or not they are defined, if they are defined then trigger
	spyglass and kick the client to the lobby.
*/
private["_vars"];
_vars = [
	"lhm_revive_fee","lhm_gangPrice","lhm_gangUpgradeBase","lhm_enableFatigue","lhm_paycheck_period","lhm_vShop_rentalOnly","sell_array","buy_array",
	"lhm_weapon_shop_array","lhm_garage_prices","lhm_garage_sell","lhm_houseLimit","lhm_gangUpgradeMultipler","lhm_impound_car","lhm_impound_boat",
	"lhm_impound_air"
];

{
	if(!isNil {(missionNamespace getVariable _x)}) exitWith {
		[[profileName,getPlayerUID player,format["VariableSetBeforeInitialized_%1",_x]],"SPY_fnc_cookieJar",false,false] call lhm_fnc_mp;
		[[profileName,format["Variable set before client initialized: %1",_x]],"SPY_fnc_notifyAdmins",true,false] call lhm_fnc_mp;
		sleep 0.5;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
} foreach _vars;