/mob/living/simple_animal/verb/toggle_gender()
	set name = "Set Gender"
	set desc = "Allows you to set your gender."
	set category = "IC"

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("Both", "Male", "Female", "None"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = TRUE
		if("Male")
			has_penis = TRUE
			has_balls = TRUE
			has_vagina = FALSE
		if("Female")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = TRUE
		if("None")
			has_penis = FALSE
			has_balls = FALSE
			has_vagina = FALSE
