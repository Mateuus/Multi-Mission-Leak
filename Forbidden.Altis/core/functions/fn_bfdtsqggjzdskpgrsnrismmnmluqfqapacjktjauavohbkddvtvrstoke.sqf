
#include <macro.h>
 private["_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheub","_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplus","_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn","_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn"]; _pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheub = [_this,0,"",[""]] call BIS_fnc_param; _xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplus = [_this,1,"",[""]] call BIS_fnc_param; _pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn = [_this,2,false,[false]] call BIS_fnc_param; _xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn = [_this,3,false,[false]] call BIS_fnc_param;  if(_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn) then {_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn = "Inne"} else {_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn = "Ute"}; if(_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn) then {_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn = "Inne"} else {_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn = "Ute"};  if(((call life_adminlevel) > 0) OR (playerSide == west)) then { 	hint parseText format[localize "STR_m_KilledSafeZone",_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheub,_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplus,_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn,_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIN]; 	[0,format["%1 blev slaktad av %2 i Kavala safezone (%1 %3, %2 %4)",_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheub,_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplus,_pvqzeuonbakmectvgkeakzvdqlfmwvqsgffiyqvwmccnteetpdrzduwxdlgoppkdoxheubIn,_xrzlorlqixcbstvotqwxuppcxspyfeedqrrurhpirnencephprxpixhsfplusIn]] call life_fnc_broadcast; }; 