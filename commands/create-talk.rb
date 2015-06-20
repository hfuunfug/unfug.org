usage       'create-talk [name] -d [date]'
aliases     :ct, :talk
summary     'Create a new talk'
description 'Create a new talk for the website'

flag :h, :help,  'show help for this command' do |value, cmd|
  puts cmd.help
  exit 0
end

run do |opts, args, cmd|
  stuff = opts[:stuff] || 'generic stuff'
  puts "Doing #{stuff}!"

  if opts[:more]
    puts 'Doing it even more!'
  end

  title = args[0]
  ftitle = title.gsub(" ", "_")

  begin
    Date.parse(args[1])
  rescue ArgumentError
    puts "Failed to parse date. Please provide: <year>-<month>-<date>"
    exit 1
  end
  date = args[1]

  file = "content/talks/#{date}-#{ftitle}.md"
  open(file, "w") do |f|
    f.puts "---"
    f.puts "title: #{title}"
    f.puts "created_at: #{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}"
    f.puts "kind: :talk"
    f.puts "speakers:"
    speakers.each do |speaker|
      f.puts "    - #{speaker}"
    end
    f.puts "author: #{author}"
    f.puts "slides: false"
    f.puts "---"
    f.puts ""
  end
end
