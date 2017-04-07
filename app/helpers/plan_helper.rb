module PlanHelper
	# def drawBox(min, max, cards)
	# 	output = ''
	# 	(min..max).each do |num|
	# 		nierysowal = true
	# 		cards.each_with_index do |xd, id|
	# 		if num == xd.period
	# 			nierysowal = false
	# 			unless cards[id-1].nil?
	# 				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; padding: #{xd.lesson.group.divisiontag == 0 ? 6 : 0}px; background-color: #{ xd.lesson.teacher.color } !important;'>" if cards[id-1].period != cards[id].period
	# 			end
	# 			output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; background-color: #{xd.lesson.teacher.color} !important;'>" if cards[id-1].nil?
	# 			output += 	"<div class='divided'>" if xd.lesson.group.divisiontag > 0
	# 			output +=  		"<p class='teachername'> #{ xd.lesson.teacher.short }</p>"
	# 			output += 		"<p class='classroom'> #{ xd.classroom.short unless xd.classroom.nil? } </p>"
	# 			output += 		"<p class='subject'> #{ xd.lesson.subject.short }</p>" if xd.lesson.group.divisiontag == 0
	# 			output += 		"<p class='subjecthalf' style='padding-top: #{xd.lesson.group.divisiontag > 3 ? 5 : 12}px !important'> #{ xd.lesson.subject.short }</p>" if xd.lesson.group.divisiontag > 0
	# 			# output +=		"<p class='group'> #{ xd.lesson.group.name } </p>" if xd.lesson.group.divisiontag > 0
	# 			output += 	"</div>" if xd.lesson.group.divisiontag > 0
	# 			unless cards[id+1].nil?
	# 				output += "</div>" if cards[id+1].period != cards[id].period
	# 			end
	# 			output += "</div>" if cards[id+1].nil?
	# 		end			
	# 	end
	# 		if nierysowal
	# 		output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important'></div>"	

	# 		end
	# 	end
	# 	output.html_safe
	# end

	def drawBox(min, max, cards)
		output = ''
		(min..max).each do |num|
			if cards.any? {|c| c.period == num}
				card = cards.fromperiod(num)
				# subjects = card.collect {|c| c.lesson.subject.short }
				subject = card.first.lesson.subject.short
				squads = card.first.lesson.squads.collect {|s| s.short}
				classroom = card.first.classroom.short unless card.first.classroom.nil?
				color = card.first.lesson.teacher.color
				group = card.first.lesson.group.name
				teachers = card.first.lesson.teacher.short
				divisiontag = card.first.lesson.group.divisiontag
				#poprawic divided
			 	output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; background-color: #{ color } !important'>"
			 	output += 	"<div class='divided'>" if divisiontag > 0
			 	output += 		"<p class='subject'> #{subject} </p>"
			 	output +=  		"<p class='teachername'> #{ teachers }</p>"
			 	output += 		"<p class='classroom'> #{ classroom } </p>"
			 	output +=		"<p class='group'> #{ group } </p>"
			 	output +=	"</div>" if divisiontag > 0
			 	output += "</div>" 
			 else
			 	output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important;'></div>"

			end
		end
		output.html_safe
	end



	# def drawBoxTeacher(min, max, cards)
	# 	output = ''
	# 	(min..max).each do |num|
	# 		nierysowal = true
	# 		cards.each_with_index do |xd, id|
	# 			if num == xd.period
	# 				nierysowal = false
	# 				unless cards[id-1].nil?
	# 					output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; padding: #{xd.lesson.group.divisiontag == 0 ? 6 : 0}px; background-color: #{ xd.lesson.teacher.color } !important;'>" if cards[id-1].period != cards[id].period
	# 				end
	# 				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; padding: #{xd.lesson.group.divisiontag == 0 ? 6 : 0}px !important; background-color: #{xd.lesson.teacher.color} !important;'>" if cards[id-1].nil?
	# 				output += 	"<div class='divided' style='background-color: #{xd.lesson.teacher.color} !important;'>" if xd.lesson.group.divisiontag > 0
	# 				output += 		"<p class='teachername'> #{ xd.lesson.subject.short } </p>"
	# 				output +=		"<p class='subject'> #{ xd.lesson.squads[0].short} #{ xd.lesson.squads[1].nil? ? "" : xd.lesson.squads[1].short }</p>#{id}" if xd.lesson.group.divisiontag == 0
	# 				output +=		"<p class='subjecthalf'> #{ xd.lesson.squads[0].short} #{ xd.lesson.squads[1].nil? ? "" : xd.lesson.squads[1].short }</p>#{id}" if xd.lesson.group.divisiontag > 0
	# 				output +=		"<p class='group'> #{ xd.lesson.group.name } </p>"
	# 				output += 	"</div>" if xd.lesson.group.divisiontag > 0				
	# 				unless cards[id+1].nil?
	# 					output += "</div>" if cards[id+1].period != cards[id].period 
	# 				end
	# 				output += "</div>" if cards[id+1].nil?
	# 			end
	# 		end
	# 		if nierysowal
	# 			output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important'></div>"
	# 		end
	# 	end
	# 	output.html_safe
	# end

	def drawBoxTeacher(min, max, cards)
		output = ''
		(min..max).each do |num|
			if cards.any? { |c| c.period == num }
				card = cards.fromperiod(num)
				subjects = card.collect {|c| c.lesson.subject.short }
				squads = card.first.lesson.squads.collect {|s| s.short}
				classroom = card.first.classroom.short unless card.first.classroom.nil?
				color = card.first.lesson.teacher.color
				group = card.first.lesson.group.name
				
				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; background-color: #{ color } !important'>"
				output += 	"<p class='subject'> #{squads.join(" ") unless squads.nil? }"
				output += 	"<br>"+subjects.join(" ")+"</p>"
				output +=	"<p class='classroom'> #{ classroom unless classroom.nil? }</p>"
				output +=	"<p class='group'> #{ group }</p>"
				output += "</div>"
			else
				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important;'></div>"
			end
			
		end
		
		output.html_safe

	end

	def drawBoxRoom(min, max, cards)
		output = ''
		(min..max).each do |num|
			if cards.any? { |c| c.period == num }
				card = cards.fromperiod(num)
				subjects = card.collect {|c| c.lesson.subject.short }
				squads = card.first.lesson.squads.collect {|s| s.short}
				color = card.first.lesson.teacher.color
				group = card.first.lesson.group.name
				teacher = card.first.lesson.teacher.short

				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; background-color: #{ color } !important'>"
				output += 	"<p class='subject'> #{squads.join(" ") unless squads.nil? }"
				output += 	"<br>"+teacher+"</p>"
				output +=	"<p class='classroom'> #{  }</p>"
				output +=	"<p class='group'> #{ group }</p>"
				output += "</div>"
			else
				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important;'></div>"
			end
		end

		output.html_safe

	end
	
end