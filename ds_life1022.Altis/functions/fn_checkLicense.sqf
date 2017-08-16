/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks if a player has the license they need, if they do it returns an empty string, otherwise a message for a tooltip
*/

private ["_rebel","_return","_legalGuns","_civCar","_civTruck","_civAir","_civBoat","_oil","_sand","_processing","_iron","_diamond","_copper","_weed","_heroin","_cocaine","_rebelVeh","_wood"];

params ["_needed"];

_return = "start";

if(playerSide isEqualTo civilian)then {
	_processing = [38,40,41,42,43,44,45,49,50,51,105];
	//Vehicles
	_civCar = [0];//Civilian Car
	_civTruck = [1];//Civilian Truck
	_civAir = [2];//Civilian Air
	_civBoat = [3];//Civilian Boat
	//Weapons
	_legalGuns = [6];//Legal Weapon
	_legalGunsAdv = [7];//Legal Advanced
	_oil = [38];
	_sand = [40];
	_salt = [41];
	_rock = [42];
	_iron = [43];
	_diamond = [44];
	_copper = [45];
	_wood = [105];
	_weed = [49];
	_heroin = [50];
	_cocaine = [51];
	_rebel = [57,59,60,61,63,72,73,74,75,76,77];
	_rebelVeh = [62];

	if(_needed isEqualTo -1)then{_return = ""};
	if((_needed in _legalGuns)&&(DSL_weapons))then{_return = ""};
	if((_needed in _legalGunsAdv)&&(DSL_weaponsAdv))then{_return = ""};
	if((_needed in _civCar)&&(DSL_car))then{_return = ""};
	if((_needed in _civTruck)&&(DSL_truck))then{_return = ""};
	if((_needed in _civAir)&&(DSL_air))then{_return = ""};
	if((_needed in _civBoat)&&(DSL_boat))then{_return = ""};
	if((_needed in _oil)&&(DSL_oil))then{_return = ""};
	if((_needed in _sand)&&(DSL_sand))then{_return = ""};
	if((_needed in _salt)&&(DSL_salt))then{_return = ""};
	if((_needed in _rock)&&(DSL_rock))then{_return = ""};
	if((_needed in _iron)&&(DSL_iron))then{_return = ""};
	if((_needed in _diamond)&&(DSL_diamond))then{_return = ""};
	if((_needed in _copper)&&(DSL_copper))then{_return = ""};
	if((_needed in _wood)&&(DSL_wood))then{_return = ""};
	if((_needed in _weed)&&(DSL_weed))then{_return = ""};
	if((_needed in _heroin)&&(DSL_heroin))then{_return = ""};
	if((_needed in _cocaine)&&(DSL_cocaine))then{_return = ""};
	if((_needed in _rebel)&&((DSL_rebel)||(DSL_rebelAdv)))then{_return = ""};
	if((_needed in _rebelVeh)&&(DSL_rebelVeh))then{_return = ""};

	//If it all fails
	if(_return == "start")then {
		if(_needed in _legalGuns)then{_return = "You need a civilian gun license to purchase this, visit a weapons shop to purchase this license"};
		if(_needed in _legalGunsAdv)then{_return = "You need a advanced civilian gun license to purchase this, visit a weapons shop to purchase this license (You must have completed the correct quest in the civilian quest line first)"};
		if(_needed in _civCar)then{_return = "You need a car license to buy these, visit a license shop to purchase this license"};
		if(_needed in _civTruck)then{_return = "You need a truck license to buy these, visit a license shop to purchase this license"};
		if(_needed in _civAir)then{_return = "You need a air vehicle license to buy these, visit a license shop to purchase this license"};
		if(_needed in _civBoat)then{_return = "You need a boating license to buy these, visit a license shop to purchase this license"};
		if(_needed in _processing)then{_return = "You need the correct processing training to process this here"};
		if(_needed in _rebel)then{_return = "You need Rebel training to use this shop"};
		if(_needed in _rebelVeh)then{_return = "You need Rebel vehicle training to use this shop"};
	};
};

if(_return == "start")then{_return = ""};

_return;