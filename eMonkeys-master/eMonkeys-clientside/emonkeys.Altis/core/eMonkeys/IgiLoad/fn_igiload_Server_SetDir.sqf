//Emonkeys_fnc_igiload_Server_SetDir




if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" Emonkeys_fnc_igiload_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj", "_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);