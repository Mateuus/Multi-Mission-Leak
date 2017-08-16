/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Market_Dealer.sqf

Description:
For selling
*/
["RPP_Market_Dealer_Dialog", {
	[_this select 0] spawn {
		private ["_Classname","_text","_SellPrice","_c","_data"];
		RPP_Market_Using = _this select 0;

		createDialog "RPP_MarketMenu";
		buttonSetAction [1600, "[] call RPP_Market_Dealer_Sell;"];
		{
			_Classname = _x;
			_text = "";
			_SellPrice = "";
			_c = false;
			{
				if (_Classname == _x select 0) exitWith {
					_text = _x select 1;
					_SellPrice = _x select 4;

					_c = true;
				};
			} count RPP_Items_Config;

			waitUntil {_c};
			_data = lbAdd [1500, format ["%1 ($%2)",_text,_SellPrice]];
			lbSetData [1500, _data, _text];
		} foreach RPP_Market_Using;
	};
}] call RPP_Function;
publicVariable "RPP_Market_Dealer_Dialog";

["RPP_Market_Dealer_Sell", {
	private ["_item","_amount","_Sell","_price","_count"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please select an item to sell first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_item = lbData [ 1500, ( lbCurSel 1500 ) ];
	_amount = round(parseNumber(ctrlText 1400));

	if (_item isEqualTo "") exitWith {
		_msg = "Please select an item to sell.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_amount <= 0) exitWith {
		_msg = "Should not sell less then 1 item at a time.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (!([_item] call RPP_Inventory_Count >= _amount)) exitWith {
		_msg = format ["You don't have any %1",_item];
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	_Sell = 0;
	_price = 0;
	{
		if (_item == _x select 1) exitWith {
			_price = _x select 4;
		};
	} count RPP_Items_Config;

	_Count = for "_i" from 1 to _amount do {
		_Sell = _Sell + _price;
	};

	[_item,_amount] call RPP_Inventory_Remove;
	[_Sell] call RPP_AntiCheat_Addmoney;
	_msg = format ["You sold %1 %2 for $%3",_amount,_item,_Sell];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;

}] call RPP_Function;
publicVariable "RPP_Market_Dealer_Sell";