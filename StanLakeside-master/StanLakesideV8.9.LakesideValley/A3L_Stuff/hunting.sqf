	animalArray =
    [
            "Goat_random_F",
            "Sheep_random_F",
			"Cock_random_F",
            "Hen_random_F",
			"Rabbit_F"
    ];
     
    animalMeat =
    [
            ["Goat_random_F", "Goat",2,2,"Raw Meat"],
            ["Cock_random_F", "Cock",1,0,"raw chicken"],
            ["Hen_random_F", "Hen",1,0,"raw chicken"],
            ["Sheep_random_F", "Sheep",2,2,"raw sheep meat"],
            ["Rabbit_F", "Rabbit",1,0,"raw rabbit"]
    ];	

fnc_gutanimal = {
	life_action_inUse = true;
	_animal = _this select 0;
	_cursortarget = _this select 1;
	swagger = _cursortarget getvariable "killed";
	_iskilled = _cursortarget getvariable "killed";
	if (!_iskilled) exitwith {["Animal is not dead yet!",5,"red"] spawn domsg; life_action_inUse = false;};
	_animalname = "";
	_amountyouget = 0;
	_extraamount = 8;
	_itemyouget = "";
	{
		_selclassname = _x select 0;
		_selanimal = _x select 1;
		if (_selclassname == _animal) then {
			_animalname = _selanimal;
			_amountyouget = _x select 2;
			_extraamount = _x select 3;
			_itemyouget = _x select 4;
		};
	} foreach animalMeat;
	_distance = player distance _cursortarget;
	if (_distance > 2) exitwith { 
	_fancytexty = format ["You are too far away!",_animalname];
	[_fancytexty,5,"red"] spawn domsg;
	life_action_inUse = false;	
	};
	_guttext = format ["Gutting %1, please wait.",_animalname];
	[_guttext,5,"blue"] spawn domsg;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	uiSleep 3;
	waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1";};
	_extraamount = round (random _extraamount);
	_totalamount = _amountyouget + _extraamount;
	if (!([true,_itemyouget,_totalamount] call life_fnc_handleInv)) exitwith {["Your inventory is full!",5,"red"] spawn domsg; life_action_inUse = false;};
	deletevehicle _cursortarget;
	_gotitem = format ["You got yourself %1 %2",_totalamount,_itemyouget];
	[_gotitem,10,"green"] spawn domsg;
	life_action_inUse = false;
};