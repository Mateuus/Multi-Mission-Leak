/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
	
	
	
"[[civ_1,"",0.0123082,civ_1,"",-1]]"
"[[civ_1,"face_hub",0.0486699,civ_1,"",0]]"
"[[civ_1,"neck",0.0579372,civ_1,"",1]]"
"[[civ_1,"head",0.0417752,civ_1,"",2]]"
"[[civ_1,"pelvis",0.25298,civ_1,"",3]]"
"[[civ_1,"spine1",0.235979,civ_1,"",4]]"
"[[civ_1,"spine2",0.133404,civ_1,"",5]]"
"[[civ_1,"spine3",0.0843887,civ_1,"",6]]"
"[[civ_1,"body",0.25298,civ_1,"",7]]"
"[[civ_1,"arms",0.0669924,civ_1,"",8]]"
"[[civ_1,"hands",0.0782553,civ_1,"",9]]"
"[[civ_1,"legs",0.25298,civ_1,"",10]]"
	
*/
private["_data","_unit","_damage","_source","_projectile","_part"];
_data = _this select 0;
_damage = _data select 2;
_source = _data select 3;
_count = _data select 5;

_playerincar = !(vehicle player == player);

Emonkeys_killer = _source;
if (_playerincar && (_source == player) && !(_count == -1)) then {

_damage = 0;


};

switch (_count) do {

    case -1:
    {
	if (_playerincar) then {
		_damage = (_damage / 6);
		};
		eM_damage_null = eM_damage_null + _damage;
		
    };
    case 0:
    {
		eM_face_hub = eM_face_hub +	_damage;
    };
	case 1:
    {
		eM_neck = eM_neck +	_damage;
    };
	case 2:
    {
		eM_head = eM_head +	_damage;
    };
	case 3:
    {
		eM_pelvis = eM_pelvis +	_damage;
    };
	case 4:
    {
		eM_spine1 = eM_spine1 +	_damage;
    };
	case 5:
    {
		eM_spine2 = eM_spine2 +	_damage;
    };
	case 6:
    {
		eM_spine3 = eM_spine3 +	_damage;
    };
	case 7:
    {
		eM_body = eM_body +	_damage;
    };
	case 8:
    {
		eM_arms = eM_arms +	_damage;
    };
	case 9:
    {
		eM_hands = eM_hands +	_damage;
    };
	case 10:
    {
		eM_legs = eM_legs +	_damage;
    };

};	

