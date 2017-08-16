
/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
	e-Monkeys.com
*/
_item = "";
_red = round(random 35);

		switch(true) do
		{
			case (_red == 1) : 
			{
               _item = "bp_sln9mm";
            };
			case (_red == 2) : 
			{
               _item = "bp_sln65";
            };
			case (_red == 3) : {
                _item = "bp_sln556";
            };
			case (_red == 14) : {
                _item = "bp_mx";
            };
			case (_red == 20) : {
               _item = "bp_katiba";
            };
			case (_red == 16) : {
                _item = "bp_sniperoptic";
            };
			case (_red == 4) : {
				_item = "bp_mk20";
            };
			case (_red == 12) : {
                _item = "bp_rahim";
		    };
			case (_red == 21) : {
                _item = "bp_ghillie";				
            };
			case (_red == 22) : {
                _item = "bp_bipod";				
            };
			case (_red == 23) : {
                _item = "bp_fatvest";				
            };
			case (_red == 24) : {
                _item = "bp_slnacp";				
            };
			case (_red == 25) : {
                _item = "bp_humm_civ";				
            };
			case (_red == 26) : {
                _item = "bp_mxc";				
            };
			
		};
		
			if (_item == "") exitWith {};
			
		        _div = [_item,1,Emonkeys_carryWeight,Emonkeys_maxWeight] call Emonkeys_fnc_calWeightDiff;
				if(_div <= 0) exitWith {hint "Sie haben nicht genug Platz!"};
				_name = [([_item,0] call Emonkeys_fnc_varHandle)] call Emonkeys_fnc_varToStr;
				if(([true,_item,1] call Emonkeys_fnc_handleInv)) then
				{
				hint format["Du hast ein %1 bekommen",_name];
				};