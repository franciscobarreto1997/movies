Trestle.resource(:actors) do
  menu do
    item :actors, icon: "fa fa-users"
  end

  scopes do
    scope :all, default: true
  end

  search do |query|
    query ? collection.pg_search(query) : collection
  end

  table do
    column :image, header: nil, align: :center, class: "poster-column" do |actor|
      admin_link_to(image_tag(actor.image, class: "poster-actor"), actor)
    end
    column :name, link: true
    column :age
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |actor|
    tab :info do
      text_field :name
      text_field :age
    end

    tab :movies, badge: actor.movies.count do
      table MoviesAdmin.table, collection: actor.movies
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:actor).permit(:name, ...)
  # end
end
