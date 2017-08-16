
/*
	fn_gatherausgrabung.sqf
	Author: Don Richter 
	
*/
if (animationState player == "AmovPercMstpSnonWnonDnon_Ease" || animationState player == "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"|| animationState player == "AovrPercMstpSnonWnonDf" ||  player getVariable["surrender",FALSE]) exitWith {}; 
if (player getVariable ["restrained", true]) exitWith {};
if(vehicle player != player) exitWith {};
life_action_gather = true;

private["_items","_random","_anzahl","_item"];



if(life_carryWeight <= 82) then
{
_itemarray = [            
              ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["sand"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["vase"],
			  ["sand"],
			  ["sand"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["muenze"],
			  ["schmuck"],
			  ["schmuck"],
			  ["schmuck"],
			  ["schmuck"]
			  ];


_item = _itemarray select floor random count _itemarray;
_itemname = _item select 0;


titleText["Grabe...","PLAIN"];
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uisleep 3;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uisleep 3;
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
uisleep 3;

//switch (true) do
//{  
  //case 0:
  //{

      
    if(([true,_itemname,1] call life_fnc_handleInv)) then
	{
		if(life_erfahrung<=2400) then {life_erfahrung = life_erfahrung +1;
	systemChat "+1 EXP";};
        _name = [([_itemname,0] call life_fnc_varHandle)] call life_fnc_varToStr;
        titleText[format["Du hast 1x %1 gefunden",_name],"PLAIN"];
	};
 // };

//};
}
else
{
hint "Dein Inventar ist voll!"
}; 
uisleep 3;
life_action_gather = false;
[] call life_fnc_hudUpdate;