// 7.62x38mmR (Nagant Revolver)

/obj/item/projectile/bullet/n762
	name = "7.62x38mmR bullet"
	damage = 50     //Skyrat edit: Weaker than .357 but still very effective
	wound_bonus = -70

// .50AE (Desert Eagle)

/obj/item/projectile/bullet/a50AE
	name = ".50AE bullet"
	damage = 65
	armour_penetration = 30     //Skyrat edit: It's .50 AE, seriously? Why did it have no AP?

// .38 (Detective's Gun)

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 25
	ricochets_max = 2
	ricochet_chance = 50
	ricochet_auto_aim_angle = 10
	ricochet_auto_aim_range = 3
	wound_bonus = -30
	bare_wound_bonus = 10
	embedding = list(embed_chance=15, fall_chance=2, jostle_chance=2, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=5, rip_time=10)
	sharpness = TRUE

/obj/item/projectile/bullet/c38/match
	name = ".38 Match bullet"
	ricochets_max = 4
	ricochet_chance = 100
	ricochet_auto_aim_angle = 40
	ricochet_auto_aim_range = 5
	ricochet_incidence_leeway = 50
	ricochet_decay_chance = 1
	ricochet_decay_damage = 1
	sharpness = SHARP_NONE
	embedding = null

/obj/item/projectile/bullet/c38/match/bouncy
	name = ".38 Rubber bullet"
	damage = 10
	stamina = 30
	armour_penetration = -30
	ricochets_max = 6
	ricochet_incidence_leeway = 70
	ricochet_chance = 130
	ricochet_decay_damage = 0.8
	shrapnel_type = NONE

// premium .38 ammo from cargo, weak against armor, lower base damage, but excellent at embedding and causing slice wounds at close range
/obj/item/projectile/bullet/c38/dumdum
	name = ".38 DumDum bullet"
	damage = 15
	armour_penetration = -30
	ricochets_max = 0
	sharpness = SHARP_EDGED
	wound_bonus = 20
	bare_wound_bonus = 20
	embedding = list(embed_chance=75, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)
	wound_falloff_tile = -5
	embed_falloff_tile = -15

/obj/item/projectile/bullet/c38/rubber
	name = ".38 rubber bullet"
	damage = 12      //Skyrat edit: A rubber pistol bullet of this caliber should NOT deal 15 brute.
	stamina = 48
	embedding = EMBED_NONE

/obj/item/projectile/bullet/c38/trac
	name = ".38 TRAC bullet"
	damage = 10
	ricochets_max = 0

/obj/item/projectile/bullet/c38/trac/on_hit(atom/target, blocked = FALSE)
	. = ..()
	var/mob/living/carbon/M = target
	var/obj/item/implant/tracking/c38/imp
	for(var/obj/item/implant/tracking/c38/TI in M.implants) //checks if the target already contains a tracking implant
		imp = TI
		return
	if(!imp)
		imp = new /obj/item/implant/tracking/c38(M)
		imp.implant(M)

/obj/item/projectile/bullet/c38/hotshot //similar to incendiary bullets, but do not leave a flaming trail
	name = ".38 Hot Shot bullet"
	damage = 20
	ricochets_max = 0

/obj/item/projectile/bullet/c38/hotshot/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(6)
		M.IgniteMob()

/obj/item/projectile/bullet/c38/iceblox //see /obj/item/projectile/temp for the original code
	name = ".38 Iceblox bullet"
	damage = 20
	var/temperature = 100
	ricochets_max = 0

/obj/item/projectile/bullet/c38/iceblox/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_bodytemperature(((100-blocked)/100)*(temperature - M.bodytemperature))


// .357 (Syndie Revolver)

/obj/item/projectile/bullet/a357
	name = ".357 bullet"
	damage = 58  //Skyrat edit: Now it's 116 brute in 2 shots instead of a 2-shot critical, this lets the .357 round be outstanding against slightly injured targets but not 2-shot a fullhealth guy.
	wound_bonus = -50

/obj/item/projectile/bullet/a357/ap
	name = ".357 armor-piercing bullet"
	damage = 45
	armour_penetration = 45
  
  
// admin only really, for ocelot memes
/obj/item/projectile/bullet/a357/match
	name = ".357 match bullet"
	ricochets_max = 5
	ricochet_chance = 140
	ricochet_auto_aim_angle = 50
	ricochet_auto_aim_range = 6
	ricochet_incidence_leeway = 80
	ricochet_decay_chance = 1