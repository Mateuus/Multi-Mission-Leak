/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
showChat true;
[0] call life_fnc_cruswutaq;
if !(isNil "life_spawn_point") then 
{
	player setPos (getMarkerPos life_spawn_point);
	life_spawn_point = nil;
};

if (life_firstSpawn) then 
{
	[true] call life_fnc_notificationInit;
	life_firstSpawn = false;
	titlecut [" ","BLACK IN",6];
	["Spawn"] call life_fnc_notificationHandler;
	if (life_isGov) then 
	{
		["PresidentWelcome"] call life_fnc_notificationHandler;
	};
};
player allowDamage true;
if (backpack player isEqualTo "tf_anprc155") then {removeBackpack player};
Camrunning = false;

if (UpdateThread isEqualTo -1) then
{
	UpdateThread = [150,life_fnc_kecedretr,[],true] call life_fnc_phefakefe;
};

if (FullThread isEqualTo -1) then
{
	FullThread = [1,life_fnc_phoaroefroegoe,[],true] call life_fnc_phefakefe;
};

if (MedicThread isEqualTo -1) then
{
	MedicThread = [1,life_fnc_houklamoustiup,[],true] call life_fnc_phefakefe;
};

if (PayCheckThread isEqualTo -1) then
{
	PayCheckThread = [300,life_fnc_hazephap,[],true] call life_fnc_phefakefe;
};

call life_fnc_tfr;
ctrlActivate ( ( findDisplay 12 ) displayCtrl 107 );
