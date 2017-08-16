_price = _this select 0;
_unit = _this select 1;
if(_unit != player) exitWith {};
dwf_atmcash = dwf_atmcash + _price;