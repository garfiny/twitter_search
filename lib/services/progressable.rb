module Services
  class Progressable

    def initialize(&block)
      @total_number = 1.to_f
      @progressing = 0
      @errors = []
      @block = block
    end

    def init(total_number)
      if (total_number < 1)
        raise "The tota number must be a positive number greater than zero"
      end
      @total_number = total_number.to_f
    end

    def total
      @total_number
    end

    def report
      if (@errors.blank?)
        @progressing ||= 0
        @total_number ||= 1.to_f
        @progressing / @total_number
      else
        @errors
      end
    end

    def make_progress
      @progressing += 1
      @block.call unless @block.nil?
    end

    def in_progressing?
      @progressing < @total_number && @errors.blank?
    end

    def mark_done_with_errors(errors)
      @errors << errors
      @errors.flatten!
    end
  end
end
