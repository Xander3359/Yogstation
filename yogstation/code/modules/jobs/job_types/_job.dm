/datum/job/proc/give_donor_stuff(mob/living/H, mob/M)
	var/client/C = M.client
	if(!C)
		C = H.client
		if(!C)
			return // nice

	if(!is_donator(C))
		return

	if(C.prefs.read_preference(/datum/preference/toggle/purrbation))
		purrbation_toggle_onlyhumans(H)

	var/donor_hat_type = GLOB.donator_gear.item_names[C.prefs.read_preference(/datum/preference/choiced/donor_hat)]
	if(donor_hat_type)
		var/obj/hat = new donor_hat_type()
		if(!H.equip_to_appropriate_slot(hat))
			var/obj/item/storage/backpack/BP = locate(/obj/item/storage/backpack) in H.GetAllContents()
			if(BP)
				hat.forceMove(BP)

	var/obj/item/storage/backpack/BP = locate(/obj/item/storage/backpack) in H.GetAllContents()
	if(BP)
		var/donor_item_type = GLOB.donator_gear.item_names[C.prefs.read_preference(/datum/preference/choiced/donor_item)]
		if (donor_item_type)
			var/obj/item = new donor_item_type()
			if(!H.put_in_hands(item))
				item.forceMove(BP)

	switch(C.prefs.read_preference(/datum/preference/choiced/donor_pda))
		if(PDA_COLOR_TRANSPARENT)
			var/obj/item/modular_computer/tablet/pda/PDA = locate(/obj/item/modular_computer/tablet/pda) in H.GetAllContents()
			if(PDA)
				PDA.finish_color = "glass"
				PDA.update_icon()
		if(PDA_COLOR_PIPBOY)
			var/obj/item/modular_computer/tablet/pda/PDA = locate(/obj/item/modular_computer/tablet/pda) in H.GetAllContents()
			if(PDA)
				PDA.finish_color = "pipboy"
				PDA.slot_flags |= ITEM_SLOT_GLOVES
				PDA.update_icon()
		if(PDA_COLOR_RAINBOW)
			var/obj/item/modular_computer/tablet/pda/PDA = locate(/obj/item/modular_computer/tablet/pda) in H.GetAllContents()
			if(PDA)
				PDA.finish_color = "rainbow"
				PDA.update_icon()

/datum/job/proc/give_cape(mob/living/H, mob/M)
	var/client/C = M.client
	if(!C)
		C = H.client
		if(!C)
			return
	if(issilicon(H) || issilicon(M))
		return

	var/S = C.prefs.skillcape_id
	if(S != "None")
		var/datum/skillcape/A = GLOB.skillcapes[S]
		var/type = A.path
		var/obj/item/clothing/neck/skillcape/B = new type(get_turf(H))
		if(!H.equip_to_appropriate_slot(B))
			H.put_in_hands(B)

/datum/job/proc/give_map_flare(mob/living/H, mob/M)
	var/client/C = M.client
	if(!C)
		C = H.client
		if(!C)
			return
	
	var/spawn_map = C.prefs.read_preference(/datum/preference/toggle/spawn_map)
	var/spawn_flare = C.prefs.read_preference(/datum/preference/toggle/spawn_flare)

	var/obj/item/storage/backpack/BP = locate(/obj/item/storage/backpack) in H.GetAllContents()
	if(BP)
		var/obj/item/storage/box/box = locate(/obj/item/storage/box) in BP
		if(spawn_map)
			var/obj/item/map/station/map = new get_turf(H)
			if(box)
				map.forceMove(box)
			else
				map.forceMove(BP)
		if(spawn_flare)
			var/obj/item/flashlight/flare/emergency/flare = new get_turf(H)
			if(box)
				flare.forceMove(box)
			else
				flare.forceMove(BP)

/datum/job/proc/give_bar_choice(mob/living/H, mob/M)
	try
		var/choice

		var/client/C = M.client
		if(!C)
			C = H.client
			if(!C)
				choice = "Random"

		if(C)
			choice = C.prefs.read_preference(/datum/preference/choiced/bar_choice)

		if(choice != "Random")
			var/bar_sanitize = FALSE
			for(var/A in GLOB.potential_box_bars)
				if(choice == A)
					bar_sanitize = TRUE
					break

			if(!bar_sanitize)
				choice = "Random"
		
		if(choice == "Random")
			choice = pick(GLOB.potential_box_bars)
		
		var/datum/map_template/template = SSmapping.station_room_templates[choice]

		if(!template)
			log_game("BAR FAILED TO LOAD!!! [C.ckey]/([M.name]) attempted to load [choice]. Loading Bar Arcade as backup.")
			message_admins("BAR FAILED TO LOAD!!! [C.ckey]/([M.name]) attempted to load [choice]. Loading Bar Arcade as backup.")
			template = SSmapping.station_room_templates["Bar Arcade"]

		for(var/obj/effect/landmark/stationroom/box/bar/B in GLOB.landmarks_list)
			template.load(B.loc, centered = FALSE)
			qdel(B)
	catch(var/exception/e)
		message_admins("RUNTIME IN GIVE_BAR_CHANCE")
		spawn_bar()
		throw e
