register_blueprint "paladin_shield_protection"
{
    flags = { EF_NOPICKUP }, 
    text = {
        name = "Paladin Shield",
        desc = "Massive damage resistance until shield is destroyed",
    },
    ui_buff = {
        color     = BLUE,
        priority  = 100,
        style     = 3,
    },
    attributes = {      
    },
}

register_blueprint "paladin_shield"
{
	flags = { EF_ITEM }, 
	text = {
		name      = "paladin shield",		
	},
	ascii     = {
		glyph     = "/",
		color     = WHITE,
	},
	health = {},
	armor = {},
	attributes = {
		health = 40,
		armor = {
			5,
			slash  = 5,
			pierce = -3,
			plasma = -3,
		},
		resist = {
			slash = 100,
			impact = 100,
			pierce = 80,
			fire = 50,
			cold = 50,
		},
	},
	callbacks = {
		on_detach = [=[
			function( self, parent )
				if parent and parent.data and parent.data.shield_buff then
					world:detach( parent.data.shield_buff )
				end
			end
		]=],
	}
}

register_blueprint "paladin_shield2"
{
	flags = { EF_ITEM }, 
	text = {
		name      = "paladin shield",		
	},
	ascii     = {
		glyph     = "/",
		color     = WHITE,
	},
	health = {},
	armor = {},
	attributes = {
		health = 80,
		armor = {
			8,
			slash  = 8,
			pierce = -4,
			plasma = -4,
		},
		resist = {
			slash = 100,
			impact = 100,
			pierce = 80,
			plasma = 80,
			fire = 75,
			cold = 75,
			acid = 25,
		},
	},
	callbacks = {
		on_detach = [=[
			function( self, parent )
				if parent and parent.data and parent.data.shield_buff then
					world:detach( parent.data.shield_buff )
				end
			end
		]=],
	}
}

register_blueprint "paladin_shield3"
{
	flags = { EF_ITEM }, 
	text = {
		name      = "paladin shield",		
	},
	ascii     = {
		glyph     = "/",
		color     = WHITE,
	},
	health = {},
	armor = {},
	attributes = {
		health = 100,
		armor = {
			10,
			slash  = 10,
			pierce = -5,
			plasma = -5,
		},
		resist = {
			slash = 100,
			impact = 100,
			pierce = 100,
			plasma = 100,
			fire = 100,
			cold = 100,
			acid = 50,
		},
	},
	callbacks = {
		on_detach = [=[
			function( self, parent )
				if parent and parent.data and parent.data.shield_buff then
					world:detach( parent.data.shield_buff )
				end
			end
		]=],
	}
}

register_blueprint "human_paladin_machete"
{
	blueprint = "zombie",
	lists = {
		group    = "being",
		{ keywords = { "test" }, weight = 150 },
		-- { { "guard2", "guard2", "human_paladin_machete" }, keywords = { "test" }, weight = 150 },
		{ { "human_paladin_machete", "human_paladin_machete" }, keywords = { "europa", "former", "former2", "civilian" }, weight = 150, },
		{ { "guard2", "guard2", "guard2", "guard2", "human_paladin_machete" }, keywords = { "europa", "former", "former2", "civilian", "pack" }, weight = 150, dmin = 10 },
	},
	text = {
		name      = "corrupted paladin",
		namep     = "corrupted paladins",
	},
	callbacks = {
		on_create = [=[
			function( self, level, tier )
				self:attach( "paladin_shield" )
				self.data.shield_buff = self:attach( "paladin_shield_protection" )
				if tier > 1 then
					make_weapon_entry( self, { "adv_machete", tier = tier - 1 } )
				else
					self:attach( "machete" )
				end	
				if level.level_info.low_light then
					self:attach( "npc_flashlight" )
				end
			end
		]=],
	},
	attributes = {
		speed            = 0.9,
		experience_value = 30,
		accuracy         = 10,
		health           = 40,
		damage_mult      = 0.75,
		resist = {
			slash = 50,
		}
	},
	data = {
		ai = {
			cover = false,
		},		
	},
}

register_blueprint "human_paladin_sword"
{
	blueprint = "zombie",
	lists = {
		group    = "being",
		{ keywords = { "test" }, weight = 150 },
		{ { "human_paladin_sword", "human_paladin_sword" }, keywords = { "io", "former", "former4", "civilian" }, weight = 150, },
		{ { "soldier4", "soldier4", "soldier4", "soldier4", "human_paladin_sword" }, keywords = { "io", "former", "former4", "civilian" }, weight = 150, dmin = 17},
	},
	text = {
		name      = "former CRI paladin",
		namep     = "former CRI paladins",
	},
	callbacks = {
		on_create = [=[
			function( self, level, tier )
				self:attach( "paladin_shield2" )
				self.data.shield_buff = self:attach( "paladin_shield_protection" )
				if tier > 1 then
					make_weapon_entry( self, { "adv_katana", tier = tier - 1 } )
				else
					self:attach( "katana" )
				end
				self:attach( "security_light_armor" )
				if level.level_info.low_light then
					self:attach( "npc_flashlight" )
				end
			end
		]=],
	},
	attributes = {
		speed            = 0.9,
		experience_value = 30,
		accuracy         = 10,
		health           = 45,
		damage_mult      = 0.75,
		resist = {
			slash = 75,			
		},
	},
	data = {
		ai = {
			cover = false,
		},
	},
}

register_blueprint "human_paladin_chainsaw"
{
	blueprint = "zombie",
	lists = {
		group    = "being",
		{ keywords = { "test" }, weight = 150 },
		{ { "human_paladin_chainsaw", "human_paladin_chainsaw" }, keywords = { "io", "beyond", "dante", "former", "former3", "civilian" }, weight = 100, dmin = 19, },	
		{ { "guard3", "guard3", "guard3", "guard3", "human_paladin_chainsaw" }, keywords = { "io", "beyond", "dante", "former", "former3", "civilian", "pack" }, weight = 100, dmin = 21, },		
	},
	text = {
		name      = "hellish paladin",
		namep     = "hellish paladins",
	},
	callbacks = {
		on_create = [=[
			function( self, level, tier )
				self:attach( "paladin_shield3" )
				self.data.shield_buff = self:attach( "paladin_shield_protection" )
				self:attach( "security_heavy_armor" )
				if tier > 1 then
					make_weapon_entry( self, { "adv_chainsaw", tier = tier - 1 } )
				else
					self:attach( "chainsaw" )
				end
				if level.level_info.low_light then
					self:attach( "npc_flashlight" )
				end
			end
		]=],
	},
	attributes = {
		speed            = 0.9,
		experience_value = 30,
		accuracy         = 10,
		health           = 50,
		damage_mult      = 0.75,
		resist = {
			slash = 80,			
		},
	},
	data = {
		ai = {
			cover = false,
		},
	},
}