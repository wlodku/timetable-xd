module PlanHelper
	def drawBox(min, max, cards)
		output = ''
		(min..max).each do |num|
			nierysowal = true
			cards.each_with_index do |xd, id|
			if num == xd.period
				nierysowal = false
				unless cards[id-1].nil?
					output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important; padding: #{xd.lesson.group.divisiontag == 0 ? 6 : 0}px;'>" if cards[id-1].period != cards[id].period
				end
				output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important'>" if cards[id-1].nil?
				output += 	"<div class='divided'>" if xd.lesson.group.divisiontag > 0
				output +=  		"<p class='teachername'> #{ xd.lesson.teacher.short }</p>"
				output += 		"<p class='classroom'> #{ xd.classroom.short unless xd.classroom.nil? } </p>"
				output += 		"<p class='subject' class='#{}'> #{ xd.lesson.subject.short } #{xd.lesson.group.divisiontag}</p>"
				output += 	"</div>" if xd.lesson.group.divisiontag > 0
				unless cards[id+1].nil?
					output += "</div>" if cards[id+1].period != cards[id].period
				end
				output += "</div>" if cards[id+1].nil?
			end			
		end
			if nierysowal
			output += "<div class='box' style='width: calc(100% / #{ Setting.max }) !important'></div>"									
			end
		end
		output.html_safe
	end
end
