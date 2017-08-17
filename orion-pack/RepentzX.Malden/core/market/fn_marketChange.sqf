#include "..\..\script_macros.hpp"
/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = [0,200] call life_fnc_randomRound; //0-200

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
				
				_modifier = [-20,20] call life_fnc_randomRound; //Verkaufte/Gekaufte Items
				/*_modifier = _price * _modifier;
				
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				life_market_prices set [_forEachIndex, [_x select 0, _price, _globalchange, _modifier] ];*/
				
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
	case (_rand <= 36): //6% Drogenpreis erhöhen
	{
		[0,format["News: drugs prices increased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocaine_unprocessed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocaine_processed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroin_unprocessed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroin_processed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event drugp";
	};
	case (_rand <= 44): //8% Ölpreis erhöhen
	{
		[0,format["News: oil processed price increased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		["oil_processed", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 54): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		[0,format["News: cement-ironrefined-glass prices increased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		["cement", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["iron_refined", [20,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["glass", [25,35] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event wcc";
	};
	case (_rand <= 60): //4% Goldpreis sinkt
	{
		[0,format["News: goldenbarz3 price decreased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		["goldenbarz3", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		
		diag_log "+Market+ Event goldm";
	};
	case (_rand <= 68): //8% Kupfer/Silber erhöht sich
	{
		[0,format["News: goldenbarz3 - copper refined prices increased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		["goldenbarz3", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["copper_refined", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		diag_log "+Market+ Event copperp";
	};
	case (_rand <= 74): //6% Goldpreis erhöht sich
	{
		[0,format["News: goldenbarz3 price increased."]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		["goldenbarz3", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event goldp";
	};
	case (_rand <= 80): //6% Drogenpreis niedriger
	{
		[0,format["News: drugs prices decreased"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocaine_unprocessed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocaine_processed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroin_unprocessed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroin_processed", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		
		diag_log "+Market+ Event drugm";
	};
	case (_rand <= 90): //10% Schildkröten höher
	{
		[0,format["News: example items prices increased"]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		
		//Erhöhe Marktpreis mit marketSell
		["exampleitem", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
		["exampleitem", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
		["exampleitem", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
		["exampleitem", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
		
		diag_log "+Market+ Event exampleitem";
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
			
				//_modifier = [-15,25] call life_fnc_randomRound; //Verkaufte/Gekaufte Items
				
				/*if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
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