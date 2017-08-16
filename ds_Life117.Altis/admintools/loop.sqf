while {true} do
{
  waitUntil {alive player};
execVM "admintools\activate.sqf";


  waitUntil {!alive player};
};