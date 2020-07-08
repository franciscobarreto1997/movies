Trestle.resource(:tracks) do

  table do
    column :title
    actions
  end


  form dialog: true do |track|
    row do
      col(sm: 12) { text_field :title }
      col(sm: 6) {
        hidden_field :movie_id, value: params[:movie_id]
      }
    end
  end

  # controller do
  #   def create
  #     movie = Movie.find(params[:movie_id])
  #     track.movie = movie
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:track).permit(:name, ...)
  # end
end
