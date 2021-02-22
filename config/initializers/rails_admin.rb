RailsAdmin.config do |config|
  config.authorize_with do |controller|
    if current_user.nil?
      redirect_to main_app.new_user_session_path, flash: {error: 'Please Login to Continue..'}
    elsif !current_user.user_role?
      redirect_to main_app.root_path, flash: {error: 'You are not Admin bro!'}
    end
  end
  config.current_user_method(&:current_user)
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model User do
    list do
      filters [:name, :manager]
      # Manually enable/disable per field
      field :name do
        filterable true
      end
      field :manager do
        filterable true
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    create do
      configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :uid do
        hide
      end
      configure :provider do
        hide
      end
      configure :comments do
        hide
      end
      configure :favorites do
        hide
      end
      configure :profiles do
        hide
      end
    end
  end
  config.model 'User' do
    edit do
      configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :uid do
        hide
      end
      configure :provider do
        hide
      end
      configure :comments do
        hide
      end
      configure :favorites do
        hide
      end
      configure :profiles do
        hide
      end
    end
  end
  config.model 'Course' do
    create do
      configure :reset_password_sent_at do
        hide
      end
      configure :credits do
        hide
      end
      configure :payments do
        hide
      end
      configure :comments do
        hide
      end
      configure :favorites do
        hide
      end
    end
  end
  config.model 'Course' do
    edit do
      configure :reset_password_sent_at do
        hide
      end
      configure :credits do
        hide
      end
      configure :payments do
        hide
      end
      configure :comments do
        hide
      end
      configure :favorites do
        hide
      end
    end
  end
  config.model 'Favorite' do
    edit do
      configure :completes do
        hide
      end
      configure :complete_users do
        hide
      end
    end
  end
  config.actions do
    all
    import
  end
  config.model 'User' do
    import do
      field :email
      field :password
      field :names
      field :gender
      field :phone
      field :district
      field :reguratory_body
      field :level
      field :user_role
      field :working_place
      field :last_name
      field :uid
      field :provider

    end
  end
  config.model "Favorite" do
    list do
      field :id
      field :user do
        pretty_value do
          value.names
        end
      end
      field :status
      field :created_at
      field :course do
        pretty_value do
          value.title
        end
      end
    end
  end
end
