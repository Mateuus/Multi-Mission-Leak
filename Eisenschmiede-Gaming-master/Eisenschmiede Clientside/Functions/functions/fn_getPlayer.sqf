GrpPlayerSide = "";
_NamePlayer = player getVariable["realname",name player];
_SteamIDPlayer = getPlayerUID player;
_PositionPlayer = mapGridPosition player;

switch (playerSide) do
{
	case west:
	{
		GrpPlayerSide = "Police";
	};

	case civilian :
	{
		if(!isNil {(group player) getVariable "gang_name"}) then {GrpPlayerSide = group player getVariable "gang_name";} else {GrpPlayerSide = "";};
	};

	case independent:
	{
		GrpPlayerSide = "Feuerwehr";
	};
};

((findDisplay 2001) displayCtrl 1234566) ctrlSetText GrpPlayerSide;
((findDisplay 2001) displayCtrl 1234567) ctrlSetText _NamePlayer;
((findDisplay 2001) displayCtrl 1234568) ctrlSetText _SteamIDPlayer;
((findDisplay 2001) displayCtrl 1234569) ctrlSetText _PositionPlayer;