_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;
pricePerM = 2;

switch (_mode) do
{
	case 1:
	{
		TaxiCallsClient = _info;
		systemChat "Your active taxi calls have been updated!";
	};
	case 2:
	{
		hint format ["Taxi Driver %1 accepted your call, he is currently %2 meters away from your position.",name _info,floor (player distance _info)];
		life_taxiDriver = _info;
		life_calledTaxi = true;
		taxi_eventHandlerID1 = player addEventHandler ["GetIn", {
			sleep 0.1;
			if (life_taxiDriver == (driver vehicle player)) then {life_inTaxi = true;};
		}];
		taxi_ActionToLeave = player addAction ["Stop Taxiservice", {
			hint format ["You have stopped using the taxiservice, you payed $%1 for the ride.",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_atmcash<life_taxiTotalPrice) then {life_atmcash = 0;} else { life_atmcash = life_atmcash - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
		}];
		_oldTaxiPos = getPos player;
		life_taxiTotalPrice = 0;
		_updateCount = 0;
		sleep 5;
		while {life_calledTaxi && !(player getVariable "restrained")} do {
			uiSleep 0.1;
			_updateCount = _updateCount + 1;
			hintSilent parseText format ["TAXI-METER<br/><br/><t align='left'>Distance driven</t><t align='right'>%1</t><br/><t align='left'>Price</t><t align='right'>%2</t>",floor (life_taxiTotalPrice/pricePerM),life_taxiTotalPrice];
			if ((_oldTaxiPos distance player >= 1)&&(life_taxiDriver == (driver vehicle player))) then { life_taxiTotalPrice = life_taxiTotalPrice + pricePerM; _oldTaxiPos = getPos player; };
			if (_updateCount>=200) then {
				[[5,life_taxiTotalPrice],"life_fnc_respond",life_taxiDriver,false] spawn life_fnc_mp;
			};
		};
		if (life_inTaxi) then {
			hint format ["You have stopped using the taxiservice, you payed $%1 for the ride.",life_taxiTotalPrice];
			life_calledTaxi = false;
			life_inTaxi = false;
			if (life_atmcash<life_taxiTotalPrice) then {life_atmcash = 0;} else { life_atmcash = life_atmcash - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
		};
	};
	case 3:
	{
		hint "No taxi driver accepted your request after 60 seconds, your call got deleted from the active calls list. You can now create a new call.";
		life_calledTaxi = false;
    };
    case 4:
    {
    	hint "There are currently no Taxidrivers on duty.";
    	life_calledTaxi = false;
	};
	case 5:
	{
		life_taxiTotalPriceBACKUP = _info;
	};
	case 6:
	{
			life_calledTaxi = false;
			sleep 0.2;
			hint format ["The taxidriver stopped the service, you payed $%1 for it.",life_taxiTotalPrice];
			life_inTaxi = false;
			if (life_atmcash<life_taxiTotalPrice) then {life_atmcash = 0;} else { life_atmcash = life_atmcash - life_taxiTotalPrice;};
			[[life_taxiTotalPrice,pricePerM],"life_fnc_finishRide",life_taxiDriver,false] spawn life_fnc_mp;
			player removeAction taxi_ActionToLeave;
	};
};