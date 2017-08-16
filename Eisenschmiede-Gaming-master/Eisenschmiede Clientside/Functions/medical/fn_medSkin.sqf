_mode = _this select 0;


switch (_mode) do
{
	case 0:
	{

		_NamePlayer = player getVariable["realname",name player];
		_SteamIDPlayer = getPlayerUID player;

		((findDisplay 1234564) displayCtrl 1013) ctrlSetText format["%1", _NamePlayer];
		((findDisplay 1234564) displayCtrl 1014) ctrlSetText format["%1", _SteamIDPlayer];
		((findDisplay 1234564) displayCtrl 1016) ctrlSetText format["Med LVL: %1", ES_xp_lvl];
		((findDisplay 1234564) displayCtrl 1017) ctrlSetText format["%1", Servername];

	};

	case 1:
	{
		player setVariable ["medSkin",1];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 2:
	{
		player setVariable ["medSkin",2];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 3:
	{
		player setVariable ["medSkin",3];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 4:
	{
		player setVariable ["medSkin",4];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 5:
	{
		player setVariable ["medSkin",5];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 6:
	{
		player setVariable ["medSkin",6];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};

	case 7:
	{
		player setVariable ["medSkin",7];
		sleep 0.1;
		[] spawn ES_fnc_updateClothing;
	};
};