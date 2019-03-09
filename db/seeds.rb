Event.destroy_all

6.times do |i|
  Event.create(
    title: "Evento #{i+1}",
    pic:"https://picsum.photos/300/300/?image=#{rand(1..50)}",
    flyer:"https://picsum.photos/350/450/?image=#{rand(1..50)}",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend porta porta. Nam vestibulum augue mollis lacus pulvinar, et mollis elit posuere. Suspendisse feugiat mattis elit, eget pharetra quam placerat a. Aenean ut enim sapien. Proin posuere convallis metus a scelerisque. Praesent enim nibh, condimentum ut faucibus vel, pulvinar vitae quam. Donec sit amet blandit tellus, at volutpat mi. Nam blandit lectus odio. Pellentesque ut lacus eu nibh pulvinar rutrum.",
    datetime: Faker::Date.between(2.days.ago, Date.today),
    latitude: (i+1).to_f,
    longitude: (i+1).to_f,
    user_id: 1,
  )
end
