require 'telegram/bot'

TOKEN = '540196328:AAHY7GI0I0k4Y7IHKNnOnthciAKNCj3vufk'

ANSWERS = [
	'У меня все хорошо',
	'Да',
	'Нет',
	'Может быть',
	'Попробуй',
	'Да, конечно'
]

def answer(message)
	message = message.text
	case message
	when '/start' then "Привет, #{message.from.first_name}!"
	when 'На каком языке ты написан?' then 'На Ruby'
	when 'Кто твой автор?' then 'Это конфиденциальная информация'
	when 'Сколько времени?' then "Сейчас #{Time.new.strftime("%H:%M:%S")}"
	when 'Какой сегодня день недели?' then "Сегодня #{Time.new.strftime("%A")}. Ничего, что я с Вами по-английски?"
	when 'Сколько времени будет через час?' then "Через час будет #{(Time.new + 3600).strftime("%H:%M:%S")}"
	else
		ANSWERS.sample
	end
end

# def answer(message)
# 	if message.text == '/start'
# 		"Hello, #{message.from.first_name}!"
# 	elsif message.text == 'На каком языке ты написан?'
# 		'На Ruby'
# 	elsif message.text == 'Кто твой автор?'
# 		'Это конфиденциальная информация'
# 	elsif message.text == 'Сколько времени?'
# 		"Сейчас #{Time.new.strftime("%H:%M:%S")}"	
# 	elsif message.text == 'Какой сегодня день недели?'
# 		"Сегодня #{Time.new.strftime("%A")}. Ничего, что я с Вами по-английски?"
# 	elsif message.text == 'Сколько времени будет через час?'
# 		"Через час будет #{(Time.new + 3600).strftime("%H:%M:%S")}"
# 	else
# 		ANSWERS.sample
# 	end
# end

			
Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		puts message.from
		bot.api.send_message(
			chat_id: message.chat.id,
			text: answer(message)
			)
	end
end
