namespace :import do
  desc "Import people"
  task people: :environment do
    words_path = '/usr/share/dict/words'
    fail unless File.exists?(words_path)
    two_words = []
    File.readlines(words_path).each do |line|
      two_words << line.strip
      if two_words.size > 1
        # http://blog.honeybadger.io/ruby-splat-array-manipulation-destructuring/
        PersonCreatorWorker.perform_async(*two_words)
        two_words = []
      end
    end
  end
end
