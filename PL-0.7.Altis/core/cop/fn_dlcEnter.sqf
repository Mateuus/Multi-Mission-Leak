private ["_position","_veh"];
_position = _this select 3;

switch (_position) do
{
        case "driver":
        {
                player moveInDriver vehicle cursorTarget;
        };
};