/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = round(random 400); //0-400

switch(true) do
{
	case (_rand <= 40):
	{
		{
			if(random(10) <= 4) then
			{		
				_modifier = [-20,20] call life_fnc_randomRound;
				
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};
			};
		}
		foreach life_market_prices;
	};
	case (_rand <= 36): 
	{
		[0,"Interpol hat eine internationale Drogenbande ausgehoben und Drogen sowie Alkohol beschlagnahmt!"] remoteExecCall ["life_fnc_broadcast",0];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocaine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocainep", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroinp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["froglsd", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["bottledshine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["bottledwhiskey", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["bottledbeer", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
	};
	case (_rand <= 44): //8% Ölpreis erhöhen
	{
		[0,"Öltanker gesunken! Küste von Stratis wurde vom Staat gesperrt. Anwohner sind entsetzt."] remoteExecCall ["life_fnc_broadcast",0];
		
		["oilp", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
	};
	case (_rand <= 54): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		[0,"China baut World-China-Center! Es ist das größte Center der Welt. Über 10.000 Tonnen Eisen, Glas und Zement wurden verbaut."] remoteExecCall ["life_fnc_broadcast",0];
		
		["cement", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["iron_r", [20,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["glass", [25,35] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
	};
	case (_rand <= 60): //4% Goldpreis sinkt
	{
		[0,"Anleger verlieren Vertrauen in Gold! Aktien sind wieder in. Die Börse boomt."] remoteExecCall ["life_fnc_broadcast",0];
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
	};
	case (_rand <= 68): //8% Kupfer/Silber erhöht sich
	{
		[0,"Elektronikindustrie benötigt Edelmetalle und kauft Kupfer- und Silberdrähte ein."] remoteExecCall ["life_fnc_broadcast",0];
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["silver", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["silverr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
	};
	case (_rand <= 74): //6% Goldpreis erhöht sich
	{
		[0,"Anleger verlieren Vertrauen in Euro! Gold ist die Anlage der Zukunft, so ein Goldschmied aus Sofia."] remoteExecCall ["life_fnc_broadcast",0];
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
	};
	case (_rand <= 80): //6% Drogenpreis niedriger
	{
		[0,"Vergessen Sie Heroin, Kokain und Marihuana, eine neue synthetische Droge überschwemmt den Drogenmarkt!"] remoteExecCall ["life_fnc_broadcast",0];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocaine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocainep", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroinp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["froglsd", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
	};
	case (_rand <= 90): //10% Schildkröten höher
	{
		[0,"China entdeckt Schildkröten als neue Medizin! Tierschützer sind besorgt und schlagen Alarm."] remoteExecCall ["life_fnc_broadcast",0];
		
		//Erhöhe Marktpreis mit marketSell
		["turtle", [4,10] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
	};
	default
	{
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
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				
				
				//New price arr
				life_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,_modifier] ]; //set raw values
			
			};
		}
		foreach life_market_prices;
	};
};

publicVariable "life_market_prices";