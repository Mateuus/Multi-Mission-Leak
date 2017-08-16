

private ["_caller","_mode"];
_caller = param[0,objNull,[objNull]];
_mode = param[1,"easy",["easy"]];

if(isnull _caller) exitWith {};


switch (_mode) do
{
	case "hard":
	{
		_points = 0;
		switch(true) do {
			case (lhm_atmcash >= 0 && lhm_atmcash < 50000): {_points = _points + 15};
			case (lhm_atmcash >= 50000 && lhm_atmcash < 500000): {_points = _points + 3};
			case (lhm_atmcash >= 500000 && lhm_atmcash < 1000000): {_points = _points + 2};
			case (lhm_atmcash >= 1000000 && lhm_atmcash < 4000000): {_points = _points + 1};
			case (lhm_atmcash >= 4000000 && lhm_atmcash < 10000000): {_points = _points + 0};
			case (lhm_atmcash >= 10000000 && lhm_atmcash < 15000000): {_points = _points + 10};
			case (lhm_atmcash >= 15000000 && lhm_atmcash < 25000000): {_points = _points + 15};
			case (lhm_atmcash >= 25000000 && lhm_atmcash < 50000000): {_points = _points + 20};
			case (lhm_atmcash >= 50000000 && lhm_atmcash < 75000000): {_points = _points + 25};
			case (lhm_atmcash >= 75000000 && lhm_atmcash < 100000000): {_points = _points + 35};
			case (lhm_atmcash >= 100000000): {_points = _points + 45};

		};

		switch(true) do {
			case (lhm_cash >= 0 && lhm_cash < 50000): {_points = _points + 1};
			case (lhm_cash >= 50000 && lhm_cash < 500000): {_points = _points + 5};
			case (lhm_cash >= 500000 && lhm_cash < 1000000): {_points = _points + 9};
			case (lhm_cash >= 1000000 && lhm_cash < 4000000): {_points = _points + 12};
			case (lhm_cash >= 4000000 && lhm_cash < 10000000): {_points = _points + 15};
			case (lhm_cash >= 10000000 && lhm_cash < 15000000): {_points = _points + 18};
			case (lhm_cash >= 15000000 && lhm_cash < 25000000): {_points = _points + 25};
			case (lhm_cash >= 25000000 && lhm_cash < 50000000): {_points = _points + 33};
			case (lhm_cash >= 50000000 && lhm_cash < 75000000): {_points = _points + 45};
			case (lhm_cash >= 75000000 && lhm_cash < 100000000): {_points = _points + 55};
			case (lhm_cash >= 100000000): {_points = _points + 60};

		};
		_spawnzones = [[3641.23,13114.4,0.00140667],[12656.8,14392.3,0.00139618],[14041.7,18734.2,0.00151253],[16881.2,12639.1,0.00142288],[25711.5,21362.2,0.00143814]];
		{
			_distance = player distance _x;
			if(_distance < 150) then {
				_points = _points + 10;
			};
		} foreach _spawnzones;

		_weapons = ["srifle_DMR_05_tan_f","srifle_DMR_05_hex_F","srifle_DMR_05_blk_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_DMR_03_multicam_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_F","srifle_DMR_03_woodland_F","srifle_EBR_F","LMG_Mk200_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_F","arifle_MX_Black_F","arifle_MX_SW_F","arifle_MX_SW_Black_F","arifle_MXC_F","arifle_MXC_Black_F","arifle_MXM_F","arifle_MXM_Black_F","MMG_01_tan_F","MMG_01_hex_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","LMG_Zafir_F"];

		if(playerSide == civilian) then {
			if(primaryWeapon player in _weapons) then {
				_points = _points + 75;
			};

		};
		[[_mode,player,nil,nil,_points],"lhm_fnc_ClientSearched",[_caller],false] call lhm_fnc_mp;

	};

	default
	{
		[[_mode,player,lhm_cash,lhm_atmcash],"lhm_fnc_ClientSearched",[_caller],false] call lhm_fnc_mp;
	};
};

