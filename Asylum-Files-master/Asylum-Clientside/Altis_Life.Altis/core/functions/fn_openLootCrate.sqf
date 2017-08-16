/*
	File: fn_openLootCrate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Request server opens a loot crate
*/
private["_type","_started","_tier","_items","_itemCount"];

_type = [_this,0,0,[0]] call BIS_fnc_param;
closeDialog 0;

life_lootReturn = -1;
[[player, _type],"ASY_fnc_doOpenLootCrate",false,false] spawn life_fnc_MP;
while {dialog} do { closeDialog 0; };
waitUntil { life_lootReturn > 0 };

_tier = [_type] call life_fnc_lootCrateItems;

_items = (_tier select 0) + (_tier select 0) + (_tier select 0) + (_tier select 1) + (_tier select 1) + (_tier select 2);
_itemCount = (floor random 9) + 5;
_itemQueue = [];
for "_i" from 1 to _itemCount do { _itemQueue pushBack (_items call BIS_fnc_selectRandom); };

_rewardItem = [-1,""];
{ if (_x select 0 == life_lootReturn) exitWith { _rewardItem = _x }} forEach ((_tier select 0) + (_tier select 1) + (_tier select 2));
_itemQueue set [(count _itemQueue) - 2, _rewardItem];

disableUserInput true;
createDialog "lootticker_menu";
disableSerialization;
waitUntil {!isNull (findDisplay 12200)};

_display = findDisplay 12200;
_tickBox1 = _display displayCtrl 12201;
_tickBox2 = _display displayCtrl 12202;
_tickBox3 = _display displayCtrl 12203;
_rewardFrame = _display displayCtrl 12205;
_tickBox1 ctrlSetFade 0.65; _tickBox1 ctrlCommit 0;
_tickBox3 ctrlSetFade 0.65; _tickBox3 ctrlCommit 0;
_rewardFrame ctrlShow false;

for "_i" from 0 to ((count _itemQueue) - 2) do
{
	if (_i > 0) then { _tickBox1 ctrlSetText format["images\loot%1.jpg", (_itemQueue select (_i-1)) select 0]; };
	_tickBox2 ctrlSetText format["images\loot%1.jpg", (_itemQueue select _i) select 0];
	_tickBox3 ctrlSetText format["images\loot%1.jpg", (_itemQueue select (_i+1)) select 0];
	playSound "loottick";
	sleep 1.5;
};
_rewardFrame ctrlShow true;
_rewardSound = switch (true) do
{
	case (_rewardItem in (_tier select 1)): { "lootreward2" };
	case (_rewardItem in (_tier select 2)): { "lootreward3" };
	default { "lootreward1" };
};
playSound _rewardSound;
sleep 4;
closeDialog 0;
[false,format["lootcrate%1",_type],1] call life_fnc_handleInv;
disableUserInput false;

if ((life_lootKeys select (_type - 1)) > 0 && (call compile format["life_inv_lootcrate%1",_type]) > 0) then { [_type] call life_fnc_inspectLootCrate; };

if (life_lootReturn in life_lootRewards) exitWith
{
	[[0,1],"Because you've won a reward you already had, you'll now be able to sell the excess item on My Asylum for real money!"] call life_fnc_broadcast;
};

life_lootRewards pushBack life_lootReturn;
[[0,1,2],format["Congrats, your account can now purchase %1 from stores!", _rewardItem select 1]] call life_fnc_broadcast;