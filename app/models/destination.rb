class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.sort_by{|post| post.created_at}.reverse[0..4]
    end
    def most_liked_post
        self.posts.max_by{|post| post.likes}
    end
    def bloggers_avg_age
        a = self.bloggers.uniq.map{|blogger| blogger.age}
        if a.length > 0
            a.sum / a.length
        else
            0
        end
    end
end
