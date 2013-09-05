# encoding: utf-8
Dado(/^que não existem perguntas com votos$/) do
	Pergunta.destroy_all
end

Quando(/^eu estou na página de visualizar perguntas por votos$/) do
  visit bem_votadas_perguntas_url
end

Então(/^eu devo ver que não existem perguntas com votos$/) do
  page.should have_content("Não existem perguntas com votos")
end

Dado(/^que existem perguntas com votos$/) do
	@perguntas = [
		Pergunta.create!(titulo: "Como testar conteudo de tabela no Cucumber", votos: 2),
		Pergunta.create!(titulo: "O que e um gemset no RVM ?", votos: 10),
		Pergunta.create!(titulo: "invalid multibyte char (US-ASCII) with Rails and Ruby 1.9", votos: 40)
	]
end

Então(/^eu devo ver as perguntas com sua quantidade de votos$/) do
  @perguntas.each do |pergunta|
  	within_table('perguntas') do
  		page.should have_css("td", text: pergunta.titulo)
  		page.should have_css("td#votos", text: pergunta.votos)
  	end
  end
end

Então(/^eu devo ver as perguntas ordenadas decrescentemente pela quantidade de votos$/) do
  perguntas_votos_decrescente = @perguntas.sort_by {|titulo, votos| votos}.reverse
  perguntas_votos_decrescente.each_with_index do |pergunta, index|
  	within_table('perguntas') do
  		page.find("tr:nth-child(#{index+1})").should have_css("td#votos", text: pergunta.votos)
  	end
  end
end


