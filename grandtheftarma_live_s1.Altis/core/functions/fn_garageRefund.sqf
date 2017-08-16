_price = _this select 0;
_unit = _this select 1;
if ( _unit != player ) exitWith {};
GTA_money_bank = GTA_money_bank + _price;