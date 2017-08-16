disableSerialization;
createdialog "immoscout";

_spCfg = [] call life_fnc_spawnPointCfg;
if!(_SpCfg IsEqualTo []) then {
	_ctrl = ((findDisplay 7600) displayCtrl 7601);
	{
		_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
		_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
		_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
	} foreach _spCfg;

	_sp = _spCfg select 0;
	life_spawn_point = _sp;
};