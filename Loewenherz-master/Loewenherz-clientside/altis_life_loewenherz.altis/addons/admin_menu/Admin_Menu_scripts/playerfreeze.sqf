testIndex  = _this select 1;
_thePlayer = _this select 2;


{
	if (name _x == _thePlayer) then
	{
		_playeruid=getplayeruid _x;



		if(_playeruid in ["76561198018512569","76561198027669628","76561197977412109","76561198055205907","76561197993078472","76561198066801041","76561198015670039"])
		exitWith {hint "Den kann keiner Freezen!"};

		 [[],"lhm_fnc_freeze",_x,false] spawn lHM_fnc_mp;
	};
} foreach playableUnits;

[["admin",(format["%1 with UID %2 has freezed %3 ",name player,getPlayerUID player,name _thePlayer])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;