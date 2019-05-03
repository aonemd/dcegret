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

  test "#liked_by? returns true if a post is liked by account" do
    account = mock
    post    = create(:post)
    account.stubs(:id).returns(1)

    post.likes.create(account_id: account.id)

    assert post.liked_by?(account)
  end

  test "#liked_by? returns false if a post is not liked by account" do
    account = mock
    post    = create(:post)
    account.stubs(:id).returns(1)

    refute post.liked_by?(account)
  end
end
