module UsersHelper
  def find_user
    @user = User.find(params[:id])
  end
  def correct_user_or_admin
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user) || current_user.admin?
  end
  def only_correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  def signed_in_user_redirect
    if signed_in?
      redirect_to root_path
    end
  end
end
