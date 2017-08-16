_me=_this select 0;
_initialPos=_this select 1;
_randX= random 50;
_randY= random 50;
_randNX= floor (random 2);
_randNY= floor (random 2);
_negatX=false;
_negatY=false;
_finalPosX= 0;
_finalPosY= 0;
//random Negative
if(_randNX<=0.90)then{
	_negatX=true;
}else{
	_negatX=false;
};
if(_randNY<=0.90)then{
	_negatY=true;
}else{
	_negatY=false;
};
//
if(_negatX)then{
	_finalPosX= -(_randX);
}else{
	_finalPosX= _randX;
};
if(_negatY)then{
	_finalPosY= -(_randY);
}else{
	_finalPosY= _randY;
};
_finalPos=[(_initialPos select 0)+_finalPosX,(_initialPos select 1)+_finalPosY,0];
(_me)domove(_finalPos);
sleep 0.1;
_me setSpeedMode "LIMITED";
sleep 2;
exit