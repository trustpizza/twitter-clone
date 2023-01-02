namespace :counters do
  desc "This will cleanup and update the counters of follows_count"
  task update: :environment do
    User.find_each do |user|
      User.reset_counters(user.id, :followers)
    end
    puts "Counters updated"
  end
end
