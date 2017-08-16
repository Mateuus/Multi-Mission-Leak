private["_type","_mode"];
_type = _this select 0;
_side = _this select 1;
_mode = _this select 2;

if(isNil "_mode") then {_mode = 0};

if(_side == civilian) exitWith {};

switch(_side) do {
	case west: {
		switch (_type) do
		{
			case 1: 		{"Polizeianwärter"};
			case 2: 		{"Polizeimeister"};
			case 3:			{"Polizeiobermeister"};
			case 4: 		{"Polizeihauptmeister"};
			case 5: 		{"Polizeikommissaranwärter"};
			case 6: 		{"Polizeikommissar"};
			case 7:		 	{"Polizeioberkommissar"};
			case 8:			{"Polizeihauptkommissar"};
			case 9:			{"Polizeipräsident"};
		};
	};

	case independent: {
		if(_mode == 0) then 
		{
			switch (_type) do
			{
				case 1: 		{"Auszubildender"};
				case 2: 		{"Assistenzarzt"};
				case 3:			{"Sanitäter"};
				case 4: 		{"Notarzt"};
				case 5: 		{"Luftrettung"};
				case 6: 		{"Ausbilder"};
				case 7: 		{"Oberarzt"};
				case 8: 		{"Chefarzt"};
			};
		} else {
			switch (_type) do
			{
				case 1: 		{"Lehrling"};
				case 2: 		{"Unfallsicherung"};
				case 3:			{"Mechatroniker"};
				case 4: 		{"Feinelektroniker"};
				case 5: 		{"Serviceberatung"};
				case 6: 		{"Ausbilder"};
				case 7: 		{"Serviceleitung"};
				case 8: 		{"Meister"};
			};
		};
	};
};