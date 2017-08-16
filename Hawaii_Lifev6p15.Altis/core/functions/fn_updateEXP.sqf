private["_amount","_EXPLevels","_countLevels","_Index","_EXP","_Level","_levelXP","_nextlevelEXP"];
_amount = [_this,0,0] call BIS_fnc_param;
//Add Exp
life_EXPCount = life_EXPCount + _amount;
if(life_EXPCount <= 1000) then {life_EXPCount = 1000;};
_EXP = life_EXPCount;

_EXPLevels = [
	[1,1000],
	[2,2010],
	[3,3030],
	[4,4060],
	[5,5101],
	[6,6152],
	[7,7213],
	[8,8285],
	[9,9368],
	[10,10462],
	[11,11566],
	[12,12682],
	[13,13809],
	[14,14947],
	[15,16096],
	[16,17257],
	[17,18430],
	[18,19614],
	[19,20810],
	[20,22019],
	[21,23239],
	[22,24471],
	[23,25716],
	[24,26973],
	[25,28243],
	[26,29525],
	[27,30820],
	[28,32129],
	[29,33450],
	[30,34784],
	[31,36132],
	[32,37494],
	[33,38869],
	[34,40257],
	[35,41660],
	[36,43076],
	[37,44507],
	[38,45952],
	[39,47412],
	[40,48886],
	[41,50375],
	[42,51878],
	[43,53397],
	[44,54931],
	[45,56481],
	[46,58045],
	[47,59626],
	[48,61222],
	[49,62834],
	[50,64463],
	[51,66107],
	[52,67768],
	[53,69446],
	[54,71141],
	[55,72852],
	[56,74580],
	[57,76326],
	[58,78090],
	[59,79870],
	[60,81669],
	[61,83486],
	[62,85321],
	[63,87174],
	[64,89046],
	[65,90936],
	[66,92846],
	[67,94774],
	[68,96722],
	[69,98689],
	[70,100676],
	[71,102683],
	[72,104709],
	[73,106757],
	[74,108824],
	[75,110912],
	[76,113021],
	[77,115152],
	[78,117303],
	[79,119476],
	[80,121671],
	[81,123888],
	[82,126127],
	[83,128388],
	[84,130672],
	[85,132978],
	[86,135308],
	[87,137661],
	[88,140038],
	[89,142438],
	[90,144863],
	[91,147311],
	[92,149785],
	[93,152282],
	[94,154805],
	[95,157353],
	[96,159927],
	[97,162526],
	[98,165151],
	[99,167803],
	[100,170481]
];

_countLevels = count _EXPLevels;
for "_i" from 0 to _countLevels do 
{
	_Index = (_countLevels-_i);
    if(_EXP >=  (_EXPLevels select _Index) select 1) exitWith
	{
		_Level = (_EXPLevels select _Index) select 0;
		_nextlevelEXP = (_EXPLevels select (_Index+1)) select 1;
	};
};

life_EXPnext = _nextlevelEXP;
if(life_EXPLevel < _Level) then {
	life_EXPLevel = _Level;

	hint parseText format ["<t size='1.5'>Glückwunsch<br/><br/><t size='1.0' align='left'>Du bist ein Level aufgestiegen und bist nun Level %1.</t>",life_EXPLevel];
};
if(life_EXPLevel > _Level) then {
	life_EXPLevel = _Level;

	hint parseText format ["<t size='1.5'>Ey, aufpassen!<br/><br/><t size='1.0' align='left'>Du bist ein Level abgestiegen und bist nun Level %1.</t>",life_EXPLevel];
};