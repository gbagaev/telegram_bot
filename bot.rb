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
	if message.text == '/start'
		"Hello, #{message.from.first_name}!"
	elsif message.text == 'На каком языке ты написан?'
		'На Ruby'
	elsif message.text == 'Кто твой автор?'
		'Это конфиденциальная информация'
	elsif message.text == 'Сколько времени?'
		"Сейчас #{Time.now}"
	elsif message.text == 'Какой сегодня день недели?'
		Date.mday
	elsif message.text == 'Сколько времени будет через час?'
		Date.mday
	else
		ANSWERS.sample
	end
end

Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		puts message.from
		bot.api.send_message(
			chat_id: message.chat.id,
			text: answer(message)
			)
	end
end
