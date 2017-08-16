/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Switching it up and making it prettier..
*/
private _option = _this select 0;
private _state = _this select 1;

switch _option do 
{
	case "silent": 
	{
		if (_state isEqualTo 1) then 
		{
			life_silentMode = true;
			["Stream Mode turned On",true,[0,1,0,1]] call life_fnc_notificationHandler;
		} 
		else 
		{
			life_silentMode = false;
			["Stream Mode turned Off",true,[1,0,0,1]] call life_fnc_notificationHandler
		};
	};
	case "chat": 
	{
		if (_state isEqualTo 1) then 
		{
			showChat false;
			life_systemChat = true;
			["System Chat turned Off",true,[0,1,0,1]] call life_fnc_notificationHandler;
		} 
		else 
		{
			showChat true;
			life_systemChat = false;
			["System Chat turned On",true,[1,0,0,1]] call life_fnc_notificationHandler;
		};
	};
	default {};
};
