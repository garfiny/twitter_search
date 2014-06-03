module Services
  class ProgressableDb < Progressable

    def init(total_number)
      super
      @progress = Progress.new
      @progress.save(validate: false)
      @initialized = true
    end

    def make_progress(item = nil)
      super
      update_progress(item, 
                      status: self.in_progressing? ? "running" : "done",
                      report: self.report do |progress|
                        if self.in_progressing?
                          "Crawling #{item.nil? ? "" : item}"
                        else
                          "Completed!"
                        end
                      end
                     )
    end

    def mark_done_with_errors(item = nil, errors)
      super
      update_progress(item, report: self.report.join(' '), status: 'failed')
    end

    private
    def update_progress(item, options = {})
      @progress.status = options[:status]
      @progress.report = options[:report]
      @progress.progress = self.percentage
      @progress.save(validate: false)
    end
  end
end
