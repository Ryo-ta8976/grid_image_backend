class Image < ApplicationRecord
    def self.search(label)
        Image.where('label LIKE?', "%#{label}%")
    end
end
