if(life_karma < 0) exitwith { hint "You're on the naughty list!"; };

if(life_gift_recent) exitwith { hint "You recently got a gift, come back later! (45min CD)"; };

life_gift_recent = true;

"standard" spawn fnc_delivery;
"fastfood" spawn fnc_delivery;

uisleep 2700;

life_gift_recent = false;