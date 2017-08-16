private["_value","_unit","_cop"];
_value = [_this,0,5,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_cop = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO
compte_banque = compte_banque + _value;