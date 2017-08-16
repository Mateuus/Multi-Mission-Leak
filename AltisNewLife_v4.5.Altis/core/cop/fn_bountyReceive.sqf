private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;
if(_val == _total) then
{
	titleText[format["Vous avez eu une prime de %1€ pour avoir arreté un criminel.",[_val] call life_fnc_numberText],"PLAIN"];
}
	else
{
	titleText[format["Vous avez eu une prime de %1€ pour avoir tué un criminel recherché, si vous l'aviez arreté votre prime aurait été de %2€",[_val] call life_fnc_numberText,[_total] call life_fnc_numberText],"PLAIN"];
};
compte_banque = compte_banque + _val;