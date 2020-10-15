class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts


    validates_uniqueness_of :name
    validates_numericality_of :age, greater_than: 0
    validates_length_of :bio, minimum: 30

    def total_likes
        self.posts.map{|post| post.likes }.sum
    end
    def most_liked_post
        self.posts.max_by{|post| post.likes}
    end
    def most_written_about
        dest = self.destinations.sort_by do |destination|
            destination.posts.select {|post| post.blogger_id == self.id}.length
        end
        dest.uniq[0..4]
    end

end
