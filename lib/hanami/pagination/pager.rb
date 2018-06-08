module Hanami
  module Pagination
    class Pager
      attr_reader :pager, :next_page, :prev_page,
                  :total, :total_pages, :current_page

      def initialize(pager)
        @pager = pager
        @next_page = pager.next_page
        @prev_page = pager.prev_page
        @total = pager.total
        @total_pages = pager.total_pages
        @current_page = pager.current_page
      end

      def current_page?(page)
        current_page == page
      end

      def pages_range(delta: 3)
        first = current_page - delta
        first = first > 0 ? first : 1

        last = current_page + delta
        last = last < total_pages ? last : total_pages

        (first..last).to_a
      end

      def all_pages
        (1..total_pages).to_a
      end

      def first_page?
        current_page == 1
      end

      def last_page?
        total < 1 || current_page == total_pages
      end
    end
  end
end
