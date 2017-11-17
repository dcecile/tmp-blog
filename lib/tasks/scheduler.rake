namespace :scheduler do
  desc "Destroy all old database entries to keep the blog fresh"
  task destroy_all_old: :environment do
    ApplicationController::Scheduler.destroy_all_old
  end
end
