module CrawlerMonitor
  extend ActiveSupport::Concern

  def progress_reporter(caller_name)
    progressable = Services::Progressable.new do |item|
      @reporter ||= Progress.new
      @reporter.caller = caller_name
      @reporter.status = progressable.in_progressing? ? "running" : "done"
      @reporter.report = progressable.report do |progress|
        @reporter.progress = progress
        if progress < 1.0
          "#{caller_name}'s progress: #{progress}"
        else
          "Completed!"
        end
      end
      @reporter.save(validate: false)
    end
  end

  def monitor_progress
    Progress.in_progress.first || Progress.last || { status: "unknown" }
  end
end
