class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
    def all
      @alls = Post.all.page(params[:page]).per(6)
    end

    def new
        @post = Post.new
    end

    def spring
      @springs = Post.where(season: 1)
      @springs= Post.where(season: 1).page(params[:page]).per(6)
    end
    def summer
      @summers= Post.where(season: 2)
      @summers= Post.where(season: 2).page(params[:page]).per(6)
    end
    def autumn
      @autumns= Post.where(season: 3)
      @autumns= Post.where(season: 3).page(params[:page]).per(6)
    end
    def winter
      @winters= Post.where(season: 4)
      @winters= Post.where(season: 4).page(params[:page]).per(6)
    end
   
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save and @post.season == 1
        redirect_to :action => "spring"
    elsif @post.save and @post.season == 2
        redirect_to :action => "summer"
    elsif @post.save and @post.season == 3
        redirect_to :action => "autumn"
    elsif @post.save and @post.season == 4
        redirect_to :action => "winter"    
    else
        redirect_to :action => "index"
    end
end


def result
  @nA = 0
  @nB = 0
  @nC = 0
  @nD = 0
  for i in 1..11 do
    if params[:"r#{i}"] == "A"
      @nA = @nA + 1
    elsif params[:"r#{i}"] == "B"
      @nB = @nB + 1
    elsif params[:"r#{i}"] == "C"
      @nC = @nC + 1
    elsif params[:"r#{i}"] == "D"
      @nD = @nD + 1
    end
  end
  render action:"result"
end
          


      def show
        @post = Post.find(params[:id])
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to :action => "show", :id => @post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
         post = Post.find(params[:id])
         post.destroy
          redirect_to action: :all
      end
    
      private
      def post_params
        params.require(:post).permit(:user_name,:body,:color,:image,:season)
      end
end
