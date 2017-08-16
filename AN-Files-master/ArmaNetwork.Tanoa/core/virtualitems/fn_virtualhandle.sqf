/*
    ArmA.Network
    Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_add",false,[false]],
    ["_item","",[""]],
    ["_amount",0,[0]]
];

private _success = false;

if (_item isEqualTo "" OR _amount isEqualTo 0) exitWith 
{
    _success;
};

if (_math) then 
{
	private _diff = [_item,_amount,life_carryWeight,life_maxWeight] call life_fnc_wacruspekuc;
	_diff = round(_diff);
	_amount = _diff;
	if(_amount <= 0) exitWith 
    {
        _success;
    };
};

private _weight = ([_item] call life_fnc_pruvubezust) * _amount;

if (_math) then 
{
    if((life_carryWeight + _weight) <= life_maxWeight) then 
    {
        private _index = [_item,AN_Inventory] call life_fnc_uiudhfyqwtfkdsf;
        if (_index isEqualTo -1) then 
        {
            AN_Inventory pushBack [_item,_amount];
        } 
        else 
        {
            private _val = (AN_Inventory select _index) select 1;
            AN_Inventory set [_index,[_item,(_val + _amount)]];
        }; 
    }; 
}
else
{
    if ((_value - _num) < 0) exitWith 
	{ 
		_success;
	};
    private _index = [_item,AN_Inventory] call life_fnc_uiudhfyqwtfkdsf;
    if (_index isEqualTo -1) exitWith 
    {   
        _success;
    };
    private _value = (AN_Inventory select _index) select 1;
    if(_amount > _value) exitWith 
    {
        _success;
    };
    if (_num isEqualTo _value) then
	{
		AN_Inventory deleteAt _index;
	} 
    else 
    {
		_value = (_value - _amount);
		AN_Inventory set [_index,[_item,_value]];
	};
};