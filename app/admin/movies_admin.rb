Trestle.resource(:movies) do
  menu do
    item :movies, icon: "fa fa-video"
  end

  scopes do
    scope :all, default: true
  end

  search do |query|
    query ? collection.pg_search(query) : collection
  end

  table do
    column :image, header: nil, align: :center, class: "poster-column" do |movie|
      admin_link_to(image_tag(movie.image, class: "poster"), movie)
    end
    column :title
    column :year
    column :genre, format: :tags do |movie|
      movie.genres.map(&:name)
    end
    column :is_good, sort: :is_good do |movie|
      status_tag(movie.is_good, { true => :success, false => :danger }[movie.is_good] || :default)
    end
    column :director
    actions
  end

  form do |movie|

    tab :info do
      text_field :title
      text_field :year
      text_field :director

      select :genre_ids, Genre.all, { label: "Genre" }, multiple: true
      select :actor_ids, Actor.all, { label: "Actor" }, multiple: true
      select :track_ids, Track.all, { label: "Track" }, multiple: true
    end

    tab :image do
      text_field :image
    end

    tab :actors, badge: movie.actors.count do
      table ActorsAdmin.table, collection: movie.actors
    end

    tab :track, badge: movie.tracks.count do
      table TracksAdmin.table, collection: movie.tracks
      toolbar(:secondary, clear: true) do |t|
        t.link "Add Tracks", new_tracks_admin_path(movie_id: movie.id)
      end
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
  #   params.require(:movie).permit(:name, ...)
  # end
end
