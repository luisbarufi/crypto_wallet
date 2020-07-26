module ApplicationHelper
  def what_locale(locale)
    I18n.locale == :en ? 'Inglês!' : 'Português!'
  end

  def date_br(date_us)
    date_us.strftime('%d/%m/%Y')
  end

  def environment_rails
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Testes"
    end
  end
end
