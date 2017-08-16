private["_amount","_EXPLevels","_countLevels","_Index","_EXP","_Level","_levelXP","_nextlevelEXP"];
_amount = [_this,0,0] call BIS_fnc_param;
//Add Exp
life_EXPCount = life_EXPCount + _amount;
if(life_EXPCount < 0) then {life_EXPCount = 0;};
_EXP = life_EXPCount;

_EXPLevels = [
	[0,0],
	[1,1000],
	[2,2050],
	[3,3153],
	[4,4310],
	[5,5526],
	[6,6802],
	[7,8142],
	[8,9549],
	[9,11027],
	[10,12578],
	[11,14207],
	[12,15917],
	[13,17713],
	[14,19599],
	[15,21579],
	[16,23657],
	[17,25840],
	[18,28132],
	[19,30539],
	[20,33066],
	[21,35719],
	[22,38505],
	[23,41430],
	[24,44502],
	[25,47727],
	[26,51113],
	[27,54669],
	[28,58403],
	[29,62323],
	[30,66439],
	[31,70761],
	[32,75299],
	[33,80064],
	[34,85067],
	[35,90320],
	[36,95836],
	[37,101628],
	[38,107710],
	[39,114095],
	[40,120800],
	[41,127840],
	[42,135232],
	[43,142993],
	[44,151143],
	[45,159700],
	[46,168685],
	[47,178119],
	[48,188025],
	[49,198427],
	[50,209348],
	[51,220815],
	[52,232856],
	[53,245499],
	[54,258774],
	[55,272713],
	[56,287348],
	[57,302716],
	[58,318851],
	[59,335794],
	[60,353584],
	[61,372263],
	[62,391876],
	[63,412470],
	[64,434093],
	[65,456798],
	[66,480638],
	[67,505670],
	[68,531953],
	[69,559551],
	[70,588529],
	[71,618955],
	[72,650903],
	[73,684448],
	[74,719670],
	[75,756654],
	[76,795486],
	[77,836261],
	[78,879074],
	[79,924027],
	[80,971229],
	[81,1020790],
	[82,1072830],
	[83,1127471],
	[84,1184845],
	[85,1245087],
	[86,1308341],
	[87,1374758],
	[88,1444496],
	[89,1517721],
	[90,1594607],
	[91,1675338],
	[92,1760105],
	[93,1849110],
	[94,1942565],
	[95,2040694],
	[96,2143728],
	[97,2251915],
	[98,2365510],
	[99,2484786],
	[100,2610025]
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

	hint parseText format ["<t color='#FFB124' size='1.5'>Glueckwunsch<br/><br/><t size='1.0' align='left'>Du bist ein Level aufgestiegen! Du bist jetzt Level <t color='#FF0000'>%1.</t></t>",life_EXPLevel];
};
if(life_EXPLevel > _Level) then {
	life_EXPLevel = _Level;

	hint parseText format ["<t color='#FFB124' size='1.5'>Ey, aufpassen!<br/><br/><t size='1.0' align='left'>Du bist ein Level abgestiegen! Du bist jetzt Level <t color='#FF0000'>%1.</t></t>",life_EXPLevel];
};