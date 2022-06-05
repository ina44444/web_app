# @note: this method should save value diag for one image
#   then - start to calculate average value
def save_value
  value = params[:value].to_i
  new_value_data = { user_id: current_user.id, image_id: params[:image_id].to_i, value: value }
  valued_image_data = Image.update(new_value_data)

  respond_to do |format|
    if value.blank?
      format.html { render nothing: true, status: :unprocessable_entity }
    else
      format.json { render json:  {
        user_value:       value,
        values_qty:       valued_image_data[:values_qty],
        image_id:         valued_image_data[:image_id],
        user_valued:      valued_image_data[:user_valued],
        common_ave_value: valued_image_data[:common_ave_value],
        value:            valued_image_data[:value],
        status:           :successfully,
        notice:           'Successfully saved'}
      }
    end
  end
end

