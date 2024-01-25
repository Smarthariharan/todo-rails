class InvalidTitleError < StandardError;  end
class Todo < ApplicationRecord
    include ActionView::Helpers::SanitizeHelper

    before_validation :set_title
    before_validation :sanitize_and_strip_content

    validates :title, presence: true, allow_nil: false
    before_save :title_format
    before_save :title_nil_check

    private

        def sanitize_and_strip_content
            self.title = sanitize(title).strip
        end

        def set_title
            @title = self.title 
        end

        def title_format
            raise InvalidTitleError, "Please avoid Numreic values and Special characters!" unless @title.match?(/\A[a-zA-Z ]+\z/)
        end

        def title_nil_check
            if @title.nil?
                raise InvalidTitleError, "The Title is Missing?"
            end
        end

    end

