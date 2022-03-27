admin = FactoryBot.create(:user, password: 'admin123', role: :admin)

10.times do
  FactoryBot.create(:user)
end

15.times do
  FactoryBot.create(:post)
end

20.times do
  FactoryBot.create(:cast_crew)
end

5.times do
  FactoryBot.create(:post_rating)
  FactoryBot.create(:post_report)
end

10.times do
  FactoryBot.create(:comment)
  FactoryBot.create(:report)
end
