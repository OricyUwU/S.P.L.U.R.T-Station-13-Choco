/datum/interaction/lewd/do_breastfeed
	description = "Breastfeed them."
	require_user_breasts = REQUIRE_EXPOSED
	require_target_mouth = TRUE
	max_distance = 1
	write_log_user = "breastfed"
	write_log_target = "was breastfed by"
	interaction_sound = null

/datum/interaction/lewd/do_breastfeed/display_interaction(mob/living/user, mob/living/target)
	var/message
	var/u_His = user.p_their()
	var/u_He = user.p_they()
	var/t_His = target.p_their()
	var/obj/item/organ/genital/breasts/milkers = user.getorganslot(ORGAN_SLOT_BREASTS)
	var/milktype = milkers?.fluid_id
	var/modifier
	var/list/lines

	if(!milkers || !milktype)
		return

	var/datum/reagent/milk = find_reagent_object_from_type(milktype)

	var/milktext = milk.name

	lines = list(
		"толкает свою грудь напротив ротика <b>[target]</b>, стреляя тёплым [lowertext(milktext)] в [t_His] рот",
		"наполняет ротик <b>[target]</b> тёплым, сладким [lowertext(milktext)], выжимая свои сиськи, задыхаясь от возбуждения",
		"выпускает большой поток [lowertext(milktext)] покрывая стеночки горлышка <b>[target]</b>"
	)

	message = "<span class='lewd'>\The <b>[user]</b> [pick(lines)]</span>"
	user.visible_message(message, ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/oral1.ogg',
						'modular_sand/sound/interactions/oral2.ogg'), 70, 1, -1)

	switch(milkers.size)
		if("c", "d", "e")
			modifier = 2
		if("f", "g", "h")
			modifier = 3
		else
			if(milkers.size in milkers.breast_values)
				modifier = clamp(milkers.breast_values[milkers.size] - 5, 0, INFINITY)
			else
				modifier = 1
	target.reagents.add_reagent(milktype, rand(1,3 * modifier))

/datum/interaction/lewd/titgrope
	description = "Ласкать её грудь."
	require_user_hands = TRUE
	require_target_breasts = REQUIRE_ANY
	write_log_user = "groped"
	write_log_target = "was groped by"
	interaction_sound = null
	max_distance = 1

/datum/interaction/lewd/titgrope/display_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.a_intent == INTENT_HELP)
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> нежно ощупывает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> мягко сжимает грудь <b>[target]</b></span>",
					 "<span class='lewd'><b>[user]</b> сжимает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> проводит несколькими пальцами по груди <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> деликатно дразнит сосок <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> проводит руками по груди <b>[target]</b>.</span>"))
	if(user.a_intent == INTENT_HARM)
		user.visible_message(
				pick("<span class='lewd'><b>[user]</b> агрессивно ощупывает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> хватает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> крепко сжимает грудь <b>[target]</b>.</span>",
					 "<span class='lewd'><b>[user]</b> шлепает \the <b>[target]</b> по груди.</span>",
					 "<span class='lewd'><b>[user]</b> грубо ощупывает грудь <b>[target]</b>.</span>"))
	if(prob(5 + target.get_lust()))
		if(target.a_intent == INTENT_HELP)
			user.visible_message(
				pick("<span class='lewd'><b>[target]</b> дрожит от возбуждения</span>",
					 "<span class='lewd'><b>[target]</b> тихо стонет.</span>",
					 "<span class='lewd'><b>[target]</b> издает тихий стон.</span>",
					 "<span class='lewd'><b>[target]</b> задыхается.</span>",
					 "<span class='lewd'><b>[target]</b> слегка вздрагивает.</span>",
					 "<span class='lewd'><b>[target]</b> дрожит, когда руки <b>[user]</b> пробегают по [t_His] голой коже.</span>"))
			if(target.get_lust() < 5)
				target.set_lust(5)
		if(target.a_intent == INTENT_DISARM)
			if (target.restrained())
				user.visible_message(
					pick("<span class='lewd'><b>[target]</b> игриво дергается за ограничители.</span>",
						 "<span class='lewd'><b>[target]</b> отрывается от руки <b>[user]</b>.</span>",
						 "<span class='lewd'><b>[target]</b> отскакивает от блуждающей руки <b>[user]</b>.</span>",
						 "<span class='lewd'><b>[target]</b> протягивает обнаженную грудь вперед в руки <b>[user]</b>.</span>"))
			else
				user.visible_message(
					pick("<span class='lewd'>\The <b>[target]</b> игриво бьет по руке <b>[user]</b>.</span>",
						 "<span class='lewd'>\The <b>[target]</b> избегает руки <b>[user]</b>.</span>",
						 "<span class='lewd'>\The <b>[target]</b> проводит рукой по голой груди <b>[user]</b></span>"))
			if(target.get_lust() < 10)
				target.add_lust(1)
	if(target.a_intent == INTENT_GRAB)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> крепко сжимает запястье <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> вонзает ногти в руку <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> на секунду хватает <b>[user]</b> за запястье.</span>"))
	if(target.a_intent == INTENT_HARM)
		user.adjustBruteLoss(1)
		user.visible_message(
				pick("<span class='lewd'><b>[target]</b> грубо отталкивает <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> сердито вонзает ногти в руку <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> яростно борется с <b>[user]</b>.</span>",
				 "<span class='lewd'><b>[target]</b> вцепляется когтями в предплечье <b>[user]</b>, пуская кровь.</span>",
				 "<span class='lewd'><b>[target]</b> отбивает руку <b>[user]</b> от руки.</span>"))
	return
