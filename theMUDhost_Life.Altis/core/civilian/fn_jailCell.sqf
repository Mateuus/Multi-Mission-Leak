/*
	File: fn_jailCell.sqf
	Author: Bryan "Tonic" Boardwine (modified by Michael Francis)
	
	Description:
	Allows cops to sentence peopel to lower jail times in a jail cell rather than prison
*/
private["_bad","_unit","_time","_cell","_markers"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {};
if(life_is_arrested OR life_is_arrestedCell) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,-1,[0]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["ziptie",false,true];

titleText[localize "STR_Jail_Cell_Warn","PLAIN"];
_markers = ["cell_1","cell_2"];
_cell = _markers select floor random count _markers;
player setPos getMarkerPos _cell;

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

if(player distance getMarkerPos _cell > 25) then
{
	player setPos getMarkerPos _cell;
};

if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_moonshine > 0) then {[false,"moonshine",life_inv_moonshine] call life_fnc_handleInv;};
if(life_inv_bottledshine > 0) then {[false,"bottledshine",life_inv_bottledshine] call life_fnc_handleInv;};
if(life_inv_joint > 0) then {[false,"joint",life_inv_joint] call life_fnc_handleInv;};
if(life_inv_boltcutter > 0) then {[false,"boltcutter",life_inv_boltcutter] call life_fnc_handleInv;};
if(life_inv_spikestrip > 0) then {[false,"spikestrip",life_inv_spikestrip] call life_fnc_handleInv;};
if(life_inv_underwatercharge > 0) then {[false,"underwatercharge",life_inv_underwatercharge] call life_fnc_handleInv;};
if(life_inv_goldbarp > 0) then {[false,"goldbarp",life_inv_goldbarp] call life_fnc_handleInv;};
if(life_inv_goldbar > 0) then {[false,"goldbar",life_inv_goldbar] call life_fnc_handleInv;};
if(life_inv_speedbomb > 0) then {[false,"speedbomb",life_inv_speedbomb] call life_fnc_handleInv;};
if(life_inv_kidney > 0) then {[false,"kidney",life_inv_kidney] call life_fnc_handleInv;};
if(life_inv_moonshine > 0) then {[false,"moonshine",life_inv_moonshine] call life_fnc_handleInv;};
if(life_inv_bottledshine > 0) then {[false,"bottledshine",life_inv_bottledshine] call life_fnc_handleInv;};
if(life_inv_demolitioncharge > 0) then {[false,"demolitioncharge",life_inv_demolitioncharge] call life_fnc_handleInv;};
if(life_inv_blastingcharge > 0) then {[false,"blastingcharge",life_inv_blastingcharge] call life_fnc_handleInv;};

if(life_inv_handgrip > 0) then {[false,"handgrip",life_inv_handgrip] call life_fnc_handleInv;};
if(life_inv_trigger > 0) then {[false,"trigger",life_inv_trigger] call life_fnc_handleInv;};
if(life_inv_9mmCase > 0) then {[false,"9mmCase",life_inv_9mmCase] call life_fnc_handleInv;};
if(life_inv_9mmBullet > 0) then {[false,"9mmBullet",life_inv_9mmBullet] call life_fnc_handleInv;};
if(life_inv_primer > 0) then {[false,"primer",life_inv_primer] call life_fnc_handleInv;};
if(life_inv_gunpowder > 0) then {[false,"gunpowder",life_inv_gunpowder] call life_fnc_handleInv;};
if(life_inv_glasslens > 0) then {[false,"glasslens",life_inv_glasslens] call life_fnc_handleInv;};
if(life_inv_electric > 0) then {[false,"electric",life_inv_electric] call life_fnc_handleInv;};
if(life_inv_steeltube > 0) then {[false,"steeltube",life_inv_steeltube] call life_fnc_handleInv;};
if(life_inv_chamber > 0) then {[false,"chamber",life_inv_chamber] call life_fnc_handleInv;};
if(life_inv_metalcase > 0) then {[false,"metalcase",life_inv_metalcase] call life_fnc_handleInv;};
if(life_inv_556Case > 0) then {[false,"556Case",life_inv_556Case] call life_fnc_handleInv;};
if(life_inv_556Bullet > 0) then {[false,"556Bullet",life_inv_556Bullet] call life_fnc_handleInv;};
if(life_inv_65Case > 0) then {[false,"65Case",life_inv_65Case] call life_fnc_handleInv;};
if(life_inv_65Bullet > 0) then {[false,"65Bullet",life_inv_65Bullet] call life_fnc_handleInv;};
if(life_inv_762Case > 0) then {[false,"762Case",life_inv_762Case] call life_fnc_handleInv;};
if(life_inv_762Bullet > 0) then {[false,"762Bullet",life_inv_762Bullet] call life_fnc_handleInv;};
if(life_inv_408Case > 0) then {[false,"408Case",life_inv_408Case] call life_fnc_handleInv;};
if(life_inv_408Bullet > 0) then {[false,"408Bullet",life_inv_408Bullet] call life_fnc_handleInv;};
if(life_inv_leather > 0) then {[false,"leather",life_inv_leather] call life_fnc_handleInv;};
if(life_inv_thread > 0) then {[false,"thread",life_inv_thread] call life_fnc_handleInv;};
if(life_inv_heavythread > 0) then {[false,"heavythread",life_inv_heavythread] call life_fnc_handleInv;};
if(life_inv_metalplate > 0) then {[false,"metalplate",life_inv_metalplate] call life_fnc_handleInv;};
if(life_inv_needle > 0) then {[false,"needle",life_inv_needle] call life_fnc_handleInv;};
if(life_inv_zipper > 0) then {[false,"zipper",life_inv_zipper] call life_fnc_handleInv;};
if(life_inv_45Case > 0) then {[false,"45Case",life_inv_45Case] call life_fnc_handleInv;};
if(life_inv_45Bullet > 0) then {[false,"45Bullet",life_inv_45Bullet] call life_fnc_handleInv;};
if(life_inv_explosive > 0) then {[false,"explosive",life_inv_explosive] call life_fnc_handleInv;};

life_is_arrestedCell = true;

//We won't remove all their gear for being in a cell
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

call life_fnc_equipGear;

//Heal the Player, quite annoying
player setDamage 0;

[[player,_bad,_time],"life_fnc_jailSysCell",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;