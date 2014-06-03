module Services
  class Progressable

    def initialize
      @total_number = 1.to_f
      @progressing = 0
      @errors = []
      @initizlied = false
    end

    def initialized?
      @initialized
    end

    def init(total_number)
      if (total_number < 1)
        raise "The tota number must be a positive number greater than zero"
      end
      @total_number = total_number.to_f
      @initialized = true
    end

    def total
      @total_number
    end

    def report
      return @errors unless @errors.blank?
      return yield if block_given?
      percentage
    end

    def make_progress(item = nil)
      @progressing += 1
    end

    def current_progress
      @progressing
    end

    def percentage
      @progressing / @total_number
    end

    def in_progressing?
      @progressing < @total_number && @errors.blank?
    end

    def mark_done_with_errors(item = nil, errors)
      @errors << errors
      @errors.flatten!
    end
  end
end
