if(isserver)then
{
	_me=_this select 0;
	_me addEventHandler ["GETIN",
	{
		missionNamespace setVariable [format ["%1_playerIn", (_this select 0)],[true,(_this select 2)]];
	}];
	_me addEventHandler ["GETOUT",
	{
		missionNamespace setVariable [format ["%1_playerIn", (_this select 0)],[false,(_this select 2)]];
	}];
};
