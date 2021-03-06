module SimpleUploader

  module Base
    def self.included(klass)
      klass.extend ClassMethods
    end
      
    module ClassMethods
      def has_attachments(options = {})
        has_many :attachments, :class_name => "SimpleUploader::Attachment", :as => :content
        include SimpleUploader::Base::InstanceMethods
        self.class_eval do
          @attchments_options = options

          def self._attchments_options 
            @attchments_options
          end
        end
      end

      def has_attachment(options = {})
        has_one :attachment, :class_name => "SimpleUploader::Attachment", :as => :content
        include SimpleUploader::Base::InstanceMethods
      end
    end
      
    module InstanceMethods
         
    end
  end

end

::ActiveRecord::Base.send :include, SimpleUploader::Base
