private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Vous n'avez pas choisi les vêtements que vous voulez acheter.","PLAIN"];};
_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;
if(_price > argent_liquide) exitWith {titleText["Désolé mais vous n'avez pas assez d'argent pour acheter ces vêtements","PLAIN"];};
argent_liquide = argent_liquide - _price;
life_clothesPurchased = true;
closeDialog 0;