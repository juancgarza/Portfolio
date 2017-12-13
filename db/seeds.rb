3.times do |topic|
  Topic.create!(
    title:"Topic #{topic}"
  )
end
10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body:"Nulla est mi, lacinia in nibh sit amet, venenatis rhoncus nulla. Donec ullamcorper leo at diam congue, eget congue mauris fringilla. Nunc at egestas quam. Nulla facilisi. Aliquam feugiat ut nisl vel pulvinar. Cras lobortis magna vel sapien commodo, mattis varius lorem lobortis. Fusce vitae fermentum mauris, sit amet bibendum quam. In egestas tellus nec augue dapibus, in posuere nibh faucibus. Vivamus ut posuere sem. Mauris luctus gravida risus vel tincidunt. Donec non mauris ultricies, convallis dui sed, molestie sem.",
    topic_id: Topic.last.id
  )
end

puts "10 blogs created"

5.times do |skill|
  Skill.create!(
    title:"Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

9.times do |project|
  Project.create!(
    title:"My Project #{project}",
    subtitle:"Ruby On Rails",
    body:"In at ligula molestie nisl mattis iaculis. Duis porttitor, est nec facilisis auctor, ante turpis dictum magna, sed feugiat eros nibh sed mi. Etiam orci diam, maximus vel quam in, pellentesque tincidunt tellus. Donec id ante porttitor, volutpat lacus at, lobortis ipsum. Aliquam volutpat scelerisque lorem eu scelerisque. Etiam sed convallis odio. Nullam hendrerit at lectus nec porttitor. Donec consectetur faucibus mi, sed suscipit massa dapibus eu. Cras laoreet fringilla augue, vitae tempor orci commodo sed.",
    main_image:"http://via.placeholder.com/600x400" ,
    thumb_image:"http://via.placeholder.com/100x100"
  )
end
1.times do |project|
  Project.create!(
    title:"My Project #{project}",
    subtitle:"Angular",
    body:"In at ligula molestie nisl mattis iaculis. Duis porttitor, est nec facilisis auctor, ante turpis dictum magna, sed feugiat eros nibh sed mi. Etiam orci diam, maximus vel quam in, pellentesque tincidunt tellus. Donec id ante porttitor, volutpat lacus at, lobortis ipsum. Aliquam volutpat scelerisque lorem eu scelerisque. Etiam sed convallis odio. Nullam hendrerit at lectus nec porttitor. Donec consectetur faucibus mi, sed suscipit massa dapibus eu. Cras laoreet fringilla augue, vitae tempor orci commodo sed.",
    main_image:"http://via.placeholder.com/600x400" ,
    thumb_image:"http://via.placeholder.com/100x100"
  )
end

3.times do | technology |
  Project.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"
