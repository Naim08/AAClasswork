require 'rails_helper'

RSpec.describe Comment, type: :model do
  schema = File.read('db/schema.rb')

  it "table exists" do
    expect { Comment.new }.not_to raise_error(ActiveRecord::StatementInvalid)
  end

  describe "'body' column" do
    it "exists with a type of 'string'" do
      expect(Comment.column_names).to include('body')
      expect(Comment.column_for_attribute('body').type).to eq(:string)
    end

    it "has a 'not null' constraint" do
      expect(Comment.column_for_attribute('body').null).to be(false)
    end
  end

  describe "'video_id' column" do
    it "exists with a type of 'bigint'" do
      expect(Comment.column_names).to include('video_id')
      expect(Comment.column_for_attribute('video_id').sql_type).to eq("bigint")
    end

    it "has a 'not null' constraint" do
      expect(Comment.column_for_attribute('video_id').null).to be(false)
    end

    it "is indexed" do
      expect(ActiveRecord::Base.connection.index_exists?(:comments, :video_id)).to be(true)
    end

    it "has a foreign key constraint" do
      expect(/add_foreign_key \"comments\", \"videos\"/ =~ schema).not_to be(nil)
    end
  end

  describe "'commenter_id' column" do
    it "exists with a type of 'bigint'" do
      expect(Comment.column_names).to include('commenter_id')
      expect(Comment.column_for_attribute('commenter_id').sql_type).to eq("bigint")
    end

    it "has a 'not null' constraint" do
      expect(Comment.column_for_attribute('commenter_id').null).to be(false)
    end

    it "is indexed" do
      expect(ActiveRecord::Base.connection.index_exists?(:comments, :commenter_id)).to be(true)
    end

    it "has a foreign key constraint" do
      # schema = File.read('db/schema.rb')
      expect(/add_foreign_key \"comments\", \"users\", column: \"commenter_id\"/ =~ schema).not_to be(nil)
    end
  end

  describe "'parent_comment_id' column" do
    it "exists with a type of 'bigint'" do
      expect(Comment.column_names).to include('parent_comment_id')
      expect(Comment.column_for_attribute('parent_comment_id').sql_type).to eq("bigint")
    end

    it "does NOT have a not null constraint" do
      expect(Comment.column_for_attribute('parent_comment_id').null).to be(true)
    end

    it "is indexed" do
      expect(ActiveRecord::Base.connection.index_exists?(:comments, :parent_comment_id)).to be(true)
    end

    it "has a foreign key constraint" do
      expect(/add_foreign_key \"comments\", \"comments\", column: \"parent_comment_id\"/ =~ schema).not_to be(nil)
    end
  end

  it 'table has no additional columns (other than timestamps)' do
    expect(Comment.column_names).to contain_exactly(
      'id', 'body', 'video_id', 'commenter_id', 'parent_comment_id', 'created_at', 'updated_at'
    )
  end
end