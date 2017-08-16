/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for shop items
*/

params ["_shop"];

private _return = [];

switch(_shop)do {
	case 8: { //Main civ licenses
		_return = [
			["DSL_car",999,"carShop","Car License","Buy this to be allowed to legally drive a car"],
			["DSL_truck",999,"truckShop","Truck License","Buy this to be allowed to legally drive a truck"],
			["DSL_air",999,"airShop","Pilot License","Buy this to be allowed to legally fly an air vehicle"],
			["DSL_boat",999,"boatShop","Boat License","Buy this to be allowed to legally use a sea vehicle"],
			["DSL_weapons",999,"gun","Legal Weapon License","Buy this to be allowed to legally carry an approved firearm"]
		];

		if((DS_infoArray select 13) > 17)then {
			_return pushback ["DSL_weaponsAdv",999,"gun","Advanced Legal Weapon License","Buy this to be allowed to legally carry advanced approved firearm"];
		};
	};
	case 39: { //Processing Trainings
		_return = [
			["DSL_oil",2200,"oilu","Oil Processing Training","Purchase this training to process oil"],
			["DSL_diamond",2200,"diamondu","Diamond Processing Training","Purchase this training to process diamonds"],
			["DSL_copper",2200,"copperu","Copper Processing Training","Purchase this training to process copper"],
			["DSL_rock",2200,"rocku","Rock Processing Training","Purchase this training to process rocks"],
			["DSL_salt",2200,"saltu","Salt Processing Training","Purchase this training to process salt"],
			["DSL_iron",2200,"ironu","Iron Processing Training","Purchase this training to process Iron"],
			["DSL_sand",2200,"sandu","Sand Processing Training","Purchase this training to process sand"],
			["DSL_wood",2200,"woodu","Lumber Processing Training","Purchase this training to process lumber"]
		]
	};
	case 52: { //Drug Processing Trainings
		_return = [
			["DSL_weed",7500,"weedu","Weed Processing Training","Purchase this training to process weed"],
			["DSL_heroin",7500,"heroinu","Heroin Processing Training","Purchase this training to process heroin"],
			["DSL_cocaine",7500,"cocaineu","Cocaine Processing Training","Purchase this training to process cocaine"]
		]
	};
	case 58: { //Rebel Trainings
		_return = [
			["DSL_rebel",20000,"rebelSmallGun","Rebel Training","Purchase this training to purchase rebel weapons and gear"],
			["DSL_rebelAdv",40000,"rebelLargeGun","Advanced Rebel Training","Purchase this training to purchase rebel weapons and gear. You can also revive people and respawn at rebel zones with this training"],
			["DSL_rebelVeh",60000,"rebVeh","Rebel Vehicle Training","Purchase this training to purchase Armed Rebel vehicles"]
		]
	};
	case 93: { //Gun License
		_return = [["DSL_weapons",4000,"gun","Legal Weapon License","Buy this to be allowed to legally carry an approved firearm"]];

		if((DS_infoArray select 13) > 17)then {
			_return pushback ["DSL_weaponsAdv",7000,"gun","Advanced Legal Weapon License","Buy this to be allowed to legally carry advanced approved firearm"];
		};
	};
};

_return;