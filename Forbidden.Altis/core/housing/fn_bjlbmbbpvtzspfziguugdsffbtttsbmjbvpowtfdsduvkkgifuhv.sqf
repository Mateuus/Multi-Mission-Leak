
#include <macro.h>
 _price = SEL(_this,0); _unit = SEL(_this,1); if(_unit != player) exitWith {}; ADD(BANK,_price); 