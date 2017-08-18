/*
	File: fn_compAction.sqf
	Author: Kevin Webb

	Description:
	The client runs this to finish the comping process
*/
_type = [_this,0,0,[0]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;
_admin = [_this,2,"",[""]] call BIS_fnc_param;

if(_type == 0) then
{
	life_atmcash = life_atmcash + _amount;
	hint format["You have received $%1 in compensation to your bank account from the Admin %2",_amount,_admin];
} 
else
{
	life_atmcash = life_atmcash - _amount;
	hint format["Your bank account has been deducted $%1 by Admin %2",_amount,_admin];
};