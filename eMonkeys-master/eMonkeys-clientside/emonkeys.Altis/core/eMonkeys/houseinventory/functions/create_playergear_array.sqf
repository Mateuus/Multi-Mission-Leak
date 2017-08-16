//In dieser Funktion wird das Gear des Spielers in einem 2 Dim Array zusammengefasst
//Parameter: [Spieler]
//Rückgabe: 2Dim Array des SpielerGears
private ["_unit","_return"];

_unit = _this select 0;
_return = [];
//Waffen
_return = _return + [weapons _unit];
//Magazine
_return = _return + [magazines _unit];
//Items
_return = _return + [items _unit];
//Uniform
if (uniform _unit != "") then
{
	_return = _return + [[uniform _unit]];
}else{
	_return = _return + [[]];
};
//Vest
if (vest _unit != "") then
{
	_return = _return + [[vest _unit]];
}else{
	_return = _return + [[]];
};
//Backpack
if (backpack _unit != "") then 
{
	_return = _return + [[backpack _unit]];
}else{
	_return = _return + [[]];
};
//Headgear
if (headgear _unit != "") then
{
	_return = _return + [[headgear _unit]];
}else{
	_return = _return + [[]];
};

_return; //returns the fucking array of dooom