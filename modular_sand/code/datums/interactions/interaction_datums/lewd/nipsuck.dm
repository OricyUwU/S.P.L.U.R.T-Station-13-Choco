/datum/interaction/lewd/nipsuck
	description = "Suck their nipples."
	require_target_breasts = REQUIRE_EXPOSED
	require_user_mouth = TRUE
	write_log_user = "sucked nipples"
	write_log_target = "had their nipples sucked by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/nipsuck/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if((user.a_intent == INTENT_HELP) || (user.a_intent == INTENT_DISARM))
		user.visible_message(
			pick("<span class='lewd'><b>[user]</b> нежно посасывает <b>[target]</b> [pick("сосок", "соски")].</span>",
				"<span class='lewd'><b>[user]</b> нежно покусывает [pick("сосок", "соски")] <b>[target]</b>.</span>",
				"<span class='lewd'><b>[user]</b> облизывает [pick("сосок", "соски")] <b>[target]</b>.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,2 * modifier))

	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> кусает [pick("сосок", "соски")] <b>[target]</b>.</span>",
					"<span class='lewd'><b>[user]</b> агрессивно сосет [pick("сосок", "соски")] <b>[target]</b>.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(user.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'>The <b>[user]</b> sucks the <b>[target]</b>'s [pick("nipple", "nipples")] intently.</span>",
					"<span class='lewd'><b>[user]</b> угощается [pick("сосочком", "сосками")] <b>[target]</b>.</span>",
					"<span class='lewd'><b>[user]</b> обхатывает губами [pick("левый", "правый")] сосок <b>[target]</b>.</span>"))
		if(target.has_breasts(REQUIRE_EXPOSED))
			var/modifier = 1
			var/obj/item/organ/genital/breasts/B = target.getorganslot(ORGAN_SLOT_BREASTS)
			switch(B.size)
				if("c", "d", "e")
					modifier = 2
				if("f", "g", "h")
					modifier = 3
				else
					if(B.size in B.breast_values)
						modifier = clamp(B.breast_values[B.size] - 5, 0, INFINITY)
					else
						modifier = 1
			if(B.fluid_id)
				user.reagents.add_reagent(B.fluid_id, rand(1,3 * modifier)) //aggressive sucking leads to high rewards

	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			if(!target.has_breasts())
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> дрожит от возбуждения</span>",
						"<span class='lewd'><b>[target]</b> тихо стонет.</span>",
						"<span class='lewd'><b>[target]</b> издает тихий стон.</span>",
						"<span class='lewd'><b>[target]</b> задыхается.</span>",
						"<span class='lewd'><b>[target]</b> слегка вздрагивает.</span>",
						"<span class='lewd'><b>[target]</b> дрожит от прикосновений к своей груди.</span>",
						"<span class='lewd'><b>[target]</b> дрожит от приставаний к своей груди.</span>"))
			else
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> дрожит от возбуждения.</span>",
						"<span class='lewd'><b>[target]</b> тихо стонет.</span>",
						"<span class='lewd'><b>[target]</b> издает тихий стон.</span>",
						"<span class='lewd'><b>[target]</b> задыхается.</span>",
						"<span class='lewd'><b>[target]</b> слегка вздрагивает.</span>",
						"<span class='lewd'><b>[target]</b> дрожит от прикосновений к своей груди.</span>",
						"<span class='lewd'><b>[target]</b> дрожит от возбуждения, когда <b>[user]</b> наслаждается молочком.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
		if(target.a_intent == INTENT_DISARM)
			if (target.restrained())
				if(!target.has_breasts())
					user.visible_message(
						pick("<span class='lewd'><b>[target]</b> игриво извивается против ограничений.</span>",
							"<span class='lewd'><b>[target]</b> отодвигается от рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> соскальзывает изо рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> засовывает свою оголённую грудь в ротик <b>[user]</b>.</span>"))
				else
					user.visible_message(
						pick("<span class='lewd'><b>[target]</b> игриво извивается против ограничений.</span>",
							"<span class='lewd'><b>[target]</b> отодвигается от рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> соскальзывает изо рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> засовывает свою оголённую грудь в ротик <b>[user]</b>.</span>"))
			else
				if(!target.has_breasts())
					user.visible_message(
						pick("<span class='lewd'><b>[target]</b> игриво отталкивает голову <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> отодвигается от рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> прижимает голову <b>[user]</b> к своей груди.</span>",
							"<span class='lewd'><b>[target]</b> дразняще гладит <b>[user]</b> по шее.</span>"))
				else
					user.visible_message(
					pick("<span class='lewd'><b>[target]</b> игриво отталкивает голову <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> отодвигается от рта <b>[user]</b>.</span>",
							"<span class='lewd'><b>[target]</b> прижимает голову <b>[user]</b> к своей груди.</span>",
							"<span class='lewd'><b>[target]</b> дразняще гладит <b>[user]</b> по шее.</span>",
							"<span class='lewd'><b>[target]</b> трется грудью о голову <b>[user]</b>.</span>"))
			if(target.get_lust() < 10)
				target.add_lust(1)
	if(target.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> крепко сжимает голову <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> вонзает ногти в кожу <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> хватает и отталкивает голову <b>[user]</b>.</span>"))
	if(target.a_intent == INTENT_HARM)
		user.adjustBruteLoss(1)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> шлепает <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> царапает лицо <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> яростно борется с <b>[user]</b>.</span>",
				 "<span class='lewd'>Когтями <b>[target]</b> впиваются в лицо <b>[user]</b>, до крови.</span>",
				 "<span class='lewd'><b>[target]</b> отталкивает <b>[user]</b> рот локтем.</span>"))
	target.dir = get_dir(target, user)
	user.dir = get_dir(user, target)
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)
	return
