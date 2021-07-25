class BadgeService 

  def self.define_badges(test_passage)
    @user = test_passage.user
    @test = test_passage.user

    Badge.all.each do |badge|
      if send("#{badge.rule}".to_sym, badge.value) && !BadgeUser.find_by(user_id: @user.id, badge_id: badge.id)
        @user.badges << badge
      end
    end
  end

  def self.first_atempt?(test_id)
   @user.test_passages.where(test_id: test_id).count == 1
  end

  def self.category_finish?(category_id)
    user_test_by_category = @user.passed_tests.where(category_id: category_id).distinct.size
    caterory_tests = Category.find(category_id).tests.size
    caterory_tests == user_test_by_category
  end

  def self.level_finish?(level)
    user_test_by_level = @user.passed_tests.distinct(:test_id).where(level: level)
    level_tests = Test.where(level: level).size
    level_tests == user_test_by_level
  end

end
