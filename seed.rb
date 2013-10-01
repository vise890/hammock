require './config/environment'

names = %w(stony hardy juicy hairy awesomenut nut_2.0 space_nut)
keywords = %w(fruity fresh cool bowling palmtree oil monkey)
10.times do |n|
  args = {
    name: names.sample,
    juicy: [true, true, false].sample,
    mass: rand(1.0..5.5).round(1),
    keywords: keywords.sample(3)
  }
  Coconut.create(args)
end
