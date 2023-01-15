/obj/structure/chair/e_chair
	name = "electric chair"
	desc = "Looks absolutely SHOCKING!"
	icon_state = "echair0"
	var/obj/item/assembly/shock_kit/part = null
	var/last_time = 1
	item_chair = null

/obj/structure/chair/e_chair/Initialize()
	. = ..()
	add_overlay(mutable_appearance('icons/obj/chairs.dmi', "echair_over", MOB_LAYER + 1))

/obj/structure/chair/e_chair/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_WRENCH)
		var/obj/structure/chair/C = new /obj/structure/chair(loc)
		W.play_tool_sound(src)
		C.setDir(dir)
		part.forceMove(loc)
		part.master = null
		part = null
		qdel(src)

/obj/structure/chair/e_chair/proc/shock()
	if(last_time + 50 > world.time)
		return
	last_time = world.time

	// special power handling
	var/area/A = get_area(src)
	if(!isarea(A))
		return
	if(!A.powered(AREA_USAGE_EQUIP))
		return
	A.use_power(AREA_USAGE_EQUIP, 5000)

	flick("echair_shock", src)
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(12, 1, src)
	s.start()
	if(has_buckled_mobs())
		for(var/m in buckled_mobs)
			var/mob/living/buckled_mob = m
			buckled_mob.electrocute_act(170, src, 1)
			to_chat(buckled_mob, span_userdanger("You feel a deep shock course through your body!"))
			if(buckled_mob.mind && is_revolutionary(buckled_mob) && prob(50))
				var/datum/antagonist/rev/rev = buckled_mob.mind.has_antag_datum(/datum/antagonist/rev)
				if(rev)
					rev.remove_revolutionary(TRUE)
					visible_message("<span class='danger'>The electric shock cleared [buckled_mob]'s brainwashing!'")
	visible_message(span_danger("The electric chair went off!"), span_italics("You hear a deep sharp shock!"))
