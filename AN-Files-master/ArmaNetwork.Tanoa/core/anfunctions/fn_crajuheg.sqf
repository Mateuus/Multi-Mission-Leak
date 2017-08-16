//Credit - KBW
_zone = _this select 0;
_win = param [1,false,[false]];
_enemy = param [2,"",[""]];
if(_win) then {
	hint parseText format ["<t align='center'><t color='#FF0000'><t size='2'>Congratulations!</t></t><br/><br/><t color='#ffffff'>You have captured the <t color='#00ff00'>%1</t>!",_zone];
} else {
	hint parseText format ["<t align='center'><t color='#FF0000'><t size='2'>Attention</t></t><br/><br/><t color='#ffffff'>Your territory zone, <t color='#00ff00'>%1</t>, is being captured by the gang known as %2!",_zone,_enemy];
};
