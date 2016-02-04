class BlogpostsController < ApplicationController
  respond_to :json

  def create
    user = User.post_owner create_post_params[:login]
    @post = Blogpost.create(build_blogpost_params(user))
    respond_with @post
  end

  private

    def build_blogpost_params(user)
      create_post_params.merge(user: user).reject { |k, _| k == 'login' }
    end

    def create_post_params
      params.require(:blogpost).permit(:subj, :content, :autor_ip, :login)
    end
end
