/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = [0,200] call tanoarpg_fnc_randomRound; //0-200

/*

	HINWEIS: obige Zahl in random erhöhen, um alle ereignisse seltener zu machen!
	
*/

diag_log "[MARKET] marketChange called.";

switch(true) do
{
	case (_rand <= 30): //30% default market change value (strong version)
	{
		{
			if(random(10) <= 4) then //Random for each resource
			{
				/*_price = _x select 1;
				_globalchange = _x select 2;*/
				
				_modifier = [-20,20] call tanoarpg_fnc_randomRound; //Verkaufte/Gekaufte Items
				/*_modifier = _price * _modifier;
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				life_market_prices set [_forEachIndex, [_x select 0, _price, _globalchange, _modifier] ];*/
				
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call tanoarpg_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call tanoarpg_fnc_marketBuy; 
				};
			};
		}
		foreach life_market_prices;
	};
	case (_rand <= 36): //6% Drogenpreis erhöhen
	{
		[0,"++Aktuell++ Polizei meldet erfolg! Drogenkartell ausgerottet."] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["cocainep", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["heroinp", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["crack", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		
		diag_log "+Market+ Event drugp";
	};
	case (_rand <= 44): //8% Ölpreis erhöhen
	{
		[0,"++AKTUELL++ Skandal!! Tanoa Motors verarscht Verbraucher. Die neuen Motoren verbrennen das gesamte Öl im Motor, der Ölpreis steigt!!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		["oilheat", [20,40] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["oildiesel", [20,40] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["oilkerosin", [20,40] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		
		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 54): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		[0,"++AKTUELL++ Expansion!! Bauindustrie benötigt Zement, Holz und Glas!!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		["cement", [20,40] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["woodfurniture", [20,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["glass", [25,35] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		
		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 60): //4% Goldpreis sinkt
	{
		[0,"++AKTUELL++ Platin voll im Trend, keiner kauft mehr Goldschmuck!!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		["goldbar", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		["goldcoins", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		
		diag_log "+Market+ Event goldm";
	};
	case (_rand <= 68): //8% Kupfer/Eisen/Gold erhöht sich
	{
		[0,"++AKTUELL++ Polizei verzweifelt, der Knast ist zu klein! Für das neue Gefängnis wird viel Zement benötigt, der Zementpreis steigt!!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		["goldbar", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["cement", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["woodfurniture", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		diag_log "+Market+ Event copperp";
	};
	case (_rand <= 74): //6% Goldpreis erhöht sich
	{
		[0,"++AKTUELL++ Scheich von Stratis bestellt 20 vergoldete Autos aus Tanoa. Der Goldpreis steigt massiv!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		["goldbar", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		["goldcoins", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 
		
		diag_log "+Market+ Event goldp";
	};
	case (_rand <= 80): //6% Drogenpreis niedriger
	{
		[0,"++AKTUELL++ Poilzei ist machtlos! Drogenbanden verkaufen so viel Crack wie nie zuvor!! Die Junkies sind erfreut."] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		["cocainep", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		["crack", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		["heroinp", [15,30] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketSell; 
		
		diag_log "+Market+ Event drugm";
	};
	case (_rand <= 90): //10% Schildkröten höher
	{
		[0,"++AKTUELL++ Jägermeister kommt in Lieferschwierigkeiten bei hoher Nachfrage. Produzenten erfreut!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		//Erhöhe Marktpreis mit marketSell
		["hmbottled", [10,4] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 	
		["hmillegal", [10,4] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy; 	
		
		diag_log "+Market+ Event turtlep";
	};
	case (_rand <= 95): //5% Alkohl höher
	{
		[0,"++AKTUELL++ Nieder mit den Alkoholikern! Ab sofort erhöht die Regierung die Steuern auf Alk!"] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
		
		//Erhöhe Marktpreis mit marketSell
		["hmbottled", [6,10] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy;	
		["hmillegal", [15,8] call tanoarpg_fnc_randomRound, true] call tanoarpg_fnc_marketBuy;
		
		diag_log "+Market+ Event Alko";
	};
	default //market change: default version
	{
		//diag_log format["[MARKET] marketChange did nothing. Rand=%1", _rand];
		{
			//Get default price
			_defaultprice = 0;
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;
		
			{
				if((_x select 0) == _shortname) exitWith
				{
					_defaultprice = _x select 1;
				};
			}
			foreach life_market_resources;
			
			if(_defaultprice > 0) then
			{
			
				//Get difference
				_difference = _defaultprice - _price; //Defaultprice - current price
			
				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;
			
				//Protecting hard caps
				/*if( _modifier < -700) then {_modifier = -700;};
				if( _modifier > 700) then {_modifier = 700;};*/
			
				//_modifier = [-15,25] call tanoarpg_fnc_randomRound; //Verkaufte/Gekaufte Items
				
				/*if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call tanoarpg_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call tanoarpg_fnc_marketBuy; 
				};*/
				
				diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				
				
				//New price arr
				life_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,_modifier] ]; //set raw values
			
			}
			else
			{
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		}
		foreach life_market_prices;
	};
};

publicVariable "life_market_prices";