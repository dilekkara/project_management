class Student::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = current_user.group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.leader = current_user # Grubu oluşturan kişi lider olur

    if @group.save
      GroupMembership.create(group: @group, student: current_user) # Lideri otomatik ekleyelim
      redirect_to student_groups_path, notice: "Grup başarıyla oluşturuldu."
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
