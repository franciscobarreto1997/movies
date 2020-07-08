Trestle.resource(:tracks) do
  # Customize the table columns shown on the index view.
  #

  menu do
    item :tracks, icon: "fa fa-music"
  end

  table do
    column :title
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |track|
    text_field :title

    select :movie_id, Movie.all, { label: "Movie" }
  end

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
