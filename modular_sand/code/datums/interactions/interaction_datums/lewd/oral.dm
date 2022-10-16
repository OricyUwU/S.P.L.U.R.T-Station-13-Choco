/datum/interaction/lewd/oral
	description = "Поиграть язычком с её киской."
	require_user_mouth = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	interaction_sound = null
	max_distance = 1
	var/fucktarget = "vagina"

/datum/interaction/lewd/oral/blowjob
	description = "Suck them off."
	require_target_vagina = null
	require_target_penis = REQUIRE_EXPOSED
	fucktarget = "penis"

/datum/interaction/lewd/oral/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = NORMAL_LUST
	var/u_His = user.p_their()
	var/u_He = user.p_they()
	var/u_Were = user.p_theyre()

	if(partner.is_fucking(user, CUM_TARGET_MOUTH))
		if(prob(partner.get_sexual_potency()))
			user.adjustOxyLoss(3)
			message = "глубоко входит в <b>[partner]</b>"
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(partner.has_vagina())
						message = pick(
							"лижет киску <b>[partner]</b>.",
							"проводит языком по краям киски <b>[partner]</b>.",
							"следует языком по щели <b>[partner]</b>.",
							"проводит кончиком языка вокруг клитора <b>[partner]</b>",
							"медленно приближается к <b>[partner]</b>.",
							"целует <b>[partner]</b> в нежные складки.",
							"пробует киску <b>[partner]</b>.",
						)
					else
						improv = TRUE
				if("penis")
					if(partner.has_penis() || partner.has_strapon())
						var/genital_name = partner.get_penetrating_genital_name()
						message = pick(
							"отсасывает у <b>[partner]</b>.",
							"запускает язык вверх по форме [genital_name] <b>[partner]</b> .",
							"следует за <b>[partner]</b> [genital_name] своим языком.",
							"проводит кончиком языка вокруг кончика [genital_name] <b>[partner]</b> ",
							"медленно скользит по стволу <b>[partner]</b>.",
							"целует основание члена <b>[partner]</b>.",
							"берёт <b>[partner]</b> глубже в свой рот.",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"облизывает <b>[partner]</b>.",
					"выглядит немного неуверенно, куда лижет <b>[partner]</b>.",
					"проводит языком между ног <b>[partner]</b>.",
					"целует бедро <b>[partner]</b>.",
					"старается лучше всего с <b>[partner]</b>.",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(partner.has_vagina())
					message = pick(
						"зарывается лицом в киску <b>[partner]</b>.",
						"тыкается носом в мокрую киску <b>[partner]</b>.",
						"зажимается между ляжками <b>[partner]</b>.",
						"становится на колени между ножек <b>[partner]</b>.",
						"хватается за ножки <b>[partner]</b>, и раздвигает их.",
						"засовывает лицо между ляжками <b>[partner]</b>",
					)
				else
					improv = TRUE
			if("penis")
				if(partner.has_penis() || partner.has_strapon())
					var/genital_name = partner.get_penetrating_genital_name()
					message = pick(
						"берет [genital_name] <b>[partner]</b> в рот.",
						"обхватывает губами <b>[partner]</b> [genital_name]",
						"зажимается личиком между ляжками <b>[partner]</b>.",
						"становится на колени между ног <b>[partner]</b>.",
						"сжимает руками ноги <b>[partner]</b>, целуя кончик [genital_name].",
						"налягает на <b>[partner]</b>, прижимаясь всем тельцем.",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"начинает лизать <b>[partner]</b>.",
				"начинает целовать бедро <b>[partner]</b>.",
				"опускается между бёдер <b>[partner]</b>.",
				"ненадолго бросает озадаченный взгляд между ног <b>[partner]</b>.",
				"выглядит неуверенно, как справиться с отсутствием гениталий у <b>[partner]</b>.",
				"похоже, что [u_He] [u_Were] ожидали, что у <b>[partner]</b> будет член, или киска, или... что-то в этом роде.",
			)
			genital = null
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		partner.set_is_fucking(user, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bj1.ogg',
									'modular_sand/sound/interactions/bj2.ogg',
									'modular_sand/sound/interactions/bj3.ogg',
									'modular_sand/sound/interactions/bj4.ogg',
									'modular_sand/sound/interactions/bj5.ogg',
									'modular_sand/sound/interactions/bj6.ogg',
									'modular_sand/sound/interactions/bj7.ogg',
									'modular_sand/sound/interactions/bj8.ogg',
									'modular_sand/sound/interactions/bj9.ogg',
									'modular_sand/sound/interactions/bj10.ogg',
									'modular_sand/sound/interactions/bj11.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>[user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(fucktarget != "penis" || partner.can_penetrating_genital_cum())
		partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, user)
