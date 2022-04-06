admin = FactoryBot.create(:user, email: 'admin1@gmail.com', password: 'admin123', role: :admin)
admin_2 = FactoryBot.create(:user, email: 'admin2@gmail.com', password: 'admin1234', role: :admin)
10.times do
  FactoryBot.create(:user)
end

15.times do
  FactoryBot.create(:post)
end

5.times do
  FactoryBot.create(:post_rating)
  FactoryBot.create(:post_report)
end

10.times do
  FactoryBot.create(:comment)
end
