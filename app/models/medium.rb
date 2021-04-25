class Medium < ApplicationRecord
    has_one :genre
    has_one :artist
    has_one :album
    has_one :song
end
