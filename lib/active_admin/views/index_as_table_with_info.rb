# frozen_string_literal: true

module ActiveAdmin
  module Views
    class IndexAsTableWithInfo < IndexAsTable
      def build(page_presenter, collection)
        @page_presenter = page_presenter

        parent_attributes_table

        super
      end

      def self.index_name
        'table_with_info'
      end

      private

      def parent_attributes_table
        parent_content = @page_presenter[:content_blocks][:parent_content] || []
        parent_content = [parent_content] unless parent_content.is_a? Array
        parent_content.each do |parent_block|
          table_for collection.proxy_association.owner do |t|
            # mimicking table_for usage in IndexAsTable#build so that block has correct scoping/binding
            instance_exec(t, &parent_block)
          end
        end
      end
    end
  end
end
