life_fnc_capNotice = compileFinal
"
_zone = _this select 0;
_win = [_this,1,false,[false]] call BIS_fnc_param;
_enemy = [_this,2,"""",[""""]] call BIS_fnc_param;
if(_win) then {
	hint parseText format [""<t align='center'><t color='#FF0000'><t size='2'>Congratulations!</t></t><br/><br/><t color='#ffffff'>You have captured the <t color='#00ff00'>%1</t>!"",_zone];
} else {
	hint parseText format [""<t align='center'><t color='#FF0000'><t size='2'>Attention</t></t><br/><br/><t color='#ffffff'>Your territory zone, <t color='#00ff00'>%1</t>, is being captured by the gang known as %2!"",_zone,_enemy];
};
";