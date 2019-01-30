private ["_mypos","_dir","_crate","_inVehicle","_flypos","_msg","_lootOption","_loot_lists","_loot"];
 
 
_inVehicle = (vehicle player != player);
if (_inVehicle) exitWith {systemchat "<PREVENTION>:Cannot Do it in vehicles";};
_flypos = ((getPosATL (vehicle player)) select 2);
 
if (_flypos > 3) exitWith {systemchat "<PREVENTION>:you must be in the ground";}; //Prevention for HALO SPAWNS since i notice that youre runnig ESSV3
 
 
player removeAction s_player_box;
s_player_box -1;
 
 
 
//=========USER CONFIG============\\
_lootOption = 0; //1 randomize loot //0 allways same loot
_msg = 0; //0 uses hint //1 uses systemchat
_crateType = "USOrdnanceBox_EP1";
//=========USER CONFIG============\\
 
 
 
if (_msg != 1) then {hint "<SERVER>:GIFT FOR FRESH SPAWNS";}else{systemchat ">SERVER<: GIFT FOR FRESH SPAWNS";};
 
_mypos = getposATL player;
_dir = getdir player;
_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
_crate  = createVehicle [_crateType,_mypos,[], 0, "CAN_COLLIDE"];
_crate setDir _dir;
_crate setposATL _mypos;
 
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
 
//////FILL THE CRATE
 
 
if (_lootOption !=1) then {
  //=============================IF URE USING _lootOption = 0; customize below the loot==========\\
//weapons && tools below
_crate addWeaponCargoGlobal ["ItemToolbox", 2];
_crate addWeaponCargoGlobal ["ItemEtool", 2];
_crate addWeaponCargoGlobal ["ItemCompass", 2];
_crate addWeaponCargoGlobal ["Binocular", 2];
 
// items below
_crate addMagazineCargoGlobal ["full_cinder_wall_kit", 6];
_crate addMagazineCargoGlobal ["metal_panel_kit", 4];
_crate addMagazineCargoGlobal ["metal_floor_kit", 16];
_crate addMagazineCargoGlobal "plot_pole_kit";
_crate addMagazineCargoGlobal "cinder_door_kit";
_crate addMagazineCargoGlobal "cinder_garage_kit";
_crate addMagazineCargoGlobal "ItemVault";
  //=============================IF URE USING _lootOption = 0; customize above the loot==========\\
}else{
 
 
  //=============================IF URE USING _lootOption = 1; customize below the loot==========\\
_loot_lists = [
[
["ChainSawR","ItemSledge","ItemPickaxe"],
["CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","PartGeneric"]
],
[
["ItemKeyKit"],
["ItemAntibiotic","ItemBandage","equip_herb_box","ItemGoldBar10oz"]
],
[
["ItemHatchet","ItemMachete","ItemPickaxe","ItemSledge"],
["ItemRuby","ItemMixOil","plot_pole_kit"]
],
[
["ChainSaw"],
["ItemDesertTent","ItemGenerator","equip_brick"]
],
[
["MP5_DZ"],
["ItemComboLock","ItemVault","ItemLockBox"]
]
];
               //=============================IF URE USING _lootOption = 1; customize above the loot==========\\
_loot = _loot_lists call BIS_fnc_selectRandom;
{
_crate addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_crate addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
};    
 waitUntil {(player distance _crate) > 20};
deleteVehicle _crate;