module Draftsman
  module Validators
    class DraftObjectValidator < ActiveModel::Validator

      def validate(record)
        return if record.object.nil?

        obj = Draftsman.serializer.load(record.object)
        skipped_attributes = record.item.draftsman_options[:skip]
        if (obj.keys & skipped_attributes).any?
          record.errors[:object] << 'Object Contains Skipped Attribute'
        end
      end
    end
  end
end
