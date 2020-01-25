/*
Lakeside Spray Car Finish
SprayCarFinish.sqf
*/
_price = 1000;
if(side player != civilian && side player != east && side player != west) exitwith {["MURZYN: NIE BEDE MALOWAL AUT PSOW! JP!", false] spawn domsg;};
if(vehicle player == player) exitwith { ["MURZYN: Musisz byc kierowca pojazdu abym Ci go sprejnal, ziom!", false] spawn domsg; };
if(driver (vehicle player) != player) exitwith { ["MURZYN: Musisz byc kierowca pojazdu abym Ci go sprejnal, ziom!", false] spawn domsg; };
if(cash_in_hand < _price) exitWith { ["MURZYN: Masz za malo hajsu, $1000 albo Ci nie sprejne furki!", false] spawn domsg; };	
_vehicle = vehicle player;

["MURZYN: Czekaj, musze znalezc ten walony spray w puszce!", false] spawn domsg;

_texture = _this select 1;
_startPos = getpos player;
_complete = false;
_remaining = 30;
[player,"spraypaint"] spawn life_fnc_nearestSound;
while{true} do {
	hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> Stoj w miejscu! Maluje, zostalo %1 sekund.",_remaining];
	uisleep 1;
	_remaining = _remaining - 1;
	if(_remaining == 0) exitwith { _complete = true; };
	if(getpos player distance _startpos > 5) exitwith {};
	if( _remaining == 7 || _remaining == 18 ) then { [player,"spraypaint"] spawn life_fnc_nearestSound; };
	if(vehicle player == player) exitwith {};
};

hint "";

if(_complete) then {
	["cash","take",_price] call life_fnc_handleCash;
	_vehicle setObjectTextureGlobal [0,_texture];
	_vehicle setObjectTextureGlobal [1,_texture];
	_vehicle setObjectTextureGlobal [2,_texture];
	_vehicle setObjectTextureGlobal [3,_texture];
	_vehicle setObjectTextureGlobal [4,_texture];
	_vehicle setObjectTextureGlobal [5,_texture];
	hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/>MURZYN: GOTOWE!",_remaining];
} else {
	hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/>MURZYN: NIE UDALO SIE!",_remaining];	
};