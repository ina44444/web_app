class WorkController < ApplicationController
  require 'json'
  include WorkImage
  def index
    unless logged_in?
      redirect_to root_path
    end
    @selected_theme = t('.def_select_theme')
    @selected_image_name = ''
    @current_locale = I18n.locale
    session[:current_locale] = @current_locale
  end

  def choose_theme
    @themes = Theme.all
    @name = Theme.current_role(:name)
    respond_to :js
  end

  def display_theme
    current_user_id = current_user.id
    theme = I18n.locale == :ru ? Theme.find(params[:theme_id]).name_ru : Theme.find(params[:theme_id]).name_en

    if params[:theme_id] == '1'
      theme = I18n.locale == :ru ? 'Выберите тему для оценки' : 'Select theme to give your opinion'
      theme_id = 1
      values_qty = Value.all.count.round
      data = { index: 0, name: '', values_qty: values_qty,
               file: 'Expertise.jpg', image_id: 1,
               current_user_id: current_user_id, user_valued: false,
               common_ave_value: 0, value: 0 }
    else
      theme_id = params[:theme_id]
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(theme, data)
    respond_to :js
  end

end


