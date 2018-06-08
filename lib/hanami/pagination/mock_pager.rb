module Hanami
  module Pagination
    class MockPager
      attr_reader :current_page, :total_pages, :total,
                  :next_page, :prev_page

      def initialize(current_page, total_pages)
        @current_page = current_page
        @total_pages = total_pages
        @total = total_pages
        @next_page = [current_page + 1, total_pages].min
        @prev_page = [current_page - 1, 1].max
      end

      def first_page?
        current_page == 1
      end

      def last_page?
        current_page == total_pages
      end
    end
  end
end
