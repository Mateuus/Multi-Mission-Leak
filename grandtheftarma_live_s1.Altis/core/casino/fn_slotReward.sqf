/*
	File: fn_slotReward.sqf
	Author: stuffz - CheapSuit Inc
	
	Desc:
	Check for rewards
*/

private["_rowa","_rowb","_rowc","_count","_reward","_handled","_id","_type","_extra","_priceMultiplier"];

// Params
_rowa = [_this,0,0,[0]] call GTA_fnc_param;
_rowb = [_this,1,0,[0]] call GTA_fnc_param;
_rowc = [_this,2,0,[0]] call GTA_fnc_param;

// Vars
_reward = 0;
_handled = false;
_id = -1;
_type = -1;
_extra = "";

// Check which type of slot machine we're using
_priceMultiplier = switch((life_casino_slotmachine select 3)) do
{
	case "highroller": { 100; };
	case "averageroller": { 10; };
	case "hoboroller": { 1; };
	default { 1; };
};

// All rows are equal
if((_rowa == _rowb) && (_rowb == _rowc)) then 
{
	switch (_rowa) do
	{
		case 0: { _reward = 10000; };	// Seven
		case 1: { _reward = 3000; };	// Orange
		case 2: { _reward = 1000; };	// Cherries
		case 3: { _reward = 7500; };	// Bar
		case 4: { _reward = 5000; };	// Bananas
		case 5: { _reward = 6000; };	// Grape
		case 6: { _reward = 2000; };	// Melon
		case 7: { _reward = 4000; };	// Lemon
	};
	
	_type = 1;
	_handled = true;
};

// 2 rows are equal
if((_rowa == _rowb) && !(_handled)) then
{
	_id = _rowa;
	_handled = true;
};

// 2 rows are equal
if((_rowa == _rowc) && !(_handled)) then
{
	_id = _rowa;
	_handled = true;
};

// 2 rows are equal
if((_rowb == _rowc) && !(_handled)) then
{
	_id = _rowb;
	_handled = true;
};

// 2 row rewards
if(!(_id == -1)) then
{
	switch (_id) do
	{
		case 0: { _reward = 200; };		// Seven
		case 1: { _reward = 70; };		// Orange
		case 2: { _reward = 50; };		// Cherries
		case 3: { _reward = 150; };		// Bar
		case 4: { _reward = 90; };		// Bananas
		case 5: { _reward = 100; };		// Grape
		case 6: { _reward = 60; };		// Melon
		case 7: { _reward = 80; };		// Lemon
	};
	
	_type = 2;
};

// Check if we need to add the reward
if(_reward > 0) then
{
	// Increase the price depending on which slot machine we're using
	_reward = _reward * _priceMultiplier;
	GTA_money_cash = GTA_money_cash + _reward;
	
	// Extra test depending on how we won
	switch (_type) do
	{
		case 1: { _extra = "by getting all rows equal"; };
		case 2: { _extra = "by getting 2 rows equal"; };
	};
	
	// Print a hint telling us what the win amount was
	hint format
	[
		"You've won £%1 %2.",
		[_reward] call life_fnc_numberText,
		_extra
	];
};