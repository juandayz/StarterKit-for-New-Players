# StarterKit-for-New-Players

ONLY RUN WITH ESSV3 mod


Allow players  (new players on the server) to spawn a customizable crate only one time.

``1-Drop the starterkit folder into the root of your mpmissions\your instance instance\``
-----
``2-At very bottom of your init.sqf paste:

waitUntil {!isNil ("PVDZ_plr_LoginRecord")};
if (PVCDZ_plr_Login2 select 3) then
{

_text = "Claim My Box";
s_player_box = player addAction [format["%1",_text], "dayz_code\external\player_startkit.sqf"];
};	
``
-----
``3-Open your custom variables.sqf (yes you need one) and paste :
s_player_box = -1;

just where your others s_players_  actions are located.``
