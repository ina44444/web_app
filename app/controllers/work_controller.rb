class WorkController < ApplicationController
  require 'json'
  include WorkImage
  include WorkHelper
  def index
    #   unless logged_in?
    # redirect_to root_path
    #end
    @selected_theme = t('.def_select_theme')
    @selected_image_name = 'Start theme'
    @current_locale = I18n.locale
    session[:current_locale] = @current_locale
    @themes = Theme.all.pluck(:name)
  end

  def choose_theme
    @themes = Theme.all
    @name = Theme.find_by_name(:name)
    #respond_to :js
  end

  def display_theme
    current_user_id = current_user.id
    @image_data = {}
    I18n.locale = session[:current_locale]
    #current_user_id = 1
    if params[:theme] == "-----"
      #theme = "Select theme to leave your answer"
      #theme = '.select_theme'
      theme_id = 1
      values_qty = Value.all.count.round
      data = { index: 0, name: 'Defoult theme', values_qty: values_qty,
               file: 'Expertise.jpg', image_id: 1,
               current_user_id: current_user_id, user_valued: false,
               common_ave_value: 0, value: 0 }
    else
      theme = params[:theme]
      theme_id = Theme.find_theme_id(theme)
      #theme_id = params[:selected_theme_id]
      logger.info "In work controller:  theme_id = #{theme_id.inspect} "

      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id
    image_data(:theme, data)
    #respond_to :js
  end

end


