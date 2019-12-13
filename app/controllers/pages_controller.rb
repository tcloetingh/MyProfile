class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @talents = Skill.all
  end

  def about
  end

  def contact
  end
end
