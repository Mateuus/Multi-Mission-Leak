broadcast_serv00211 = 0;
while {true} do
{
waituntil{broadcast_serv00211 == 1};
if (broadcast_serv00211 == 1) then
	{
	diag_log servermessage;
	broadcast_serv00211 = 0;
	};
};