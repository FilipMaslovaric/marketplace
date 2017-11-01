class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    @shop = Shop.create({name: params[:user][:name], user_id: current_user.id, about: "<h1>About</h1><p>Formula one grand prix the saints, flemington racecourse kath and kim prahran hipsters purple emerald the hawks, spiegeltent spring racing carnival chopper read etihad stadium north melbourne shinboners, the rebels chaddie emerald peacock victory vs heart a macaron connoisseur, lions bar brunswick and brunswick st brunswick st hippy.</p><p>Spencer st station victory vs heart, black is alway in fashion north of the river running the tan collingwood ferals kylie minogue, purple emerald dumplings cumulus inc formula one grand prix north melbourne shinboners, fairy penguins chaddie MSAC movida cookie, richmond tigers south of the river world's most liveable city.</p><p>Flemington racecourse bourke st mall, pellegrini's collingwood ferals frankston bogans warehouse chic rooftop cinema, essendon bombers ticket inspector world's most liveable city hipsters south of the river, richmond tigers the storm the city loop cate blanchette laksa king, avalon is so not melb tullamarine footscray hobos.</p>", logo: 0, background_image: 0})
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(user)

  #   puts "!!!!!!!"
  #   puts @shop.inspect
  #   shop_path(user.shop.id)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
