require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "validate presence of content" do
    post = build(:post, content: nil)

    refute post.valid?
  end

  test "validate length of content doesn't exceed 180 chars" do
    post = build(:post, content: "h"*181)

    refute post.valid?
  end
end
