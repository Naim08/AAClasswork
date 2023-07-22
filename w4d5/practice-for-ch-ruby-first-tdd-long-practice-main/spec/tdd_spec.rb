require "rspec"
require "tdd"

describe Array do
  let(:array) { Array.new }

  describe "#uniq" do
    it "checks if my_uniq exists" do
      expect(array).to respond_to(:my_uniq)
    end

    it "should return a distinct array" do
      array = [1, 2, 1, 3, 3]
      array.my_uniq
      expect(array.my_uniq).to eq([1, 2, 3])
    end

    it "should not mutate the array" do
      array = [1, 2, 1, 3, 3]
      arr_id = array.object_id
      array.my_uniq
      expect(arr_id).to eq(array.object_id)
    end
  end

  describe "#two_sum" do
    it "checks if two_sum exists" do
      expect(array).to respond_to(:two_sum)
    end

    it "should return an array of pairs" do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should return pairs in order" do
      array = [-1, 0, 2, -2, 1]
      expect(array.two_sum).to_not eq([[2, 3], [0, 4]])
    end

    it "should return an empty array if no pairs are found" do
      array = [1, 2, 3, 4, 5]
      expect(array.two_sum).to eq([])
    end

    it "should not mutate the array" do
      array = [-1, 0, 2, -2, 1]
      arr_id = array.object_id
      array.two_sum
      expect(arr_id).to eq(array.object_id)
    end
  end

  describe "#my_transpose" do
    it "checks if my_transpose exists" do
      expect(array).to respond_to(:my_transpose)
    end

    it "should return a transposed array" do
      array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      expect(array.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it "should not mutate the array" do
      array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      arr_id = array.object_id
      array.my_transpose
      expect(arr_id).to eq(array.object_id)
    end

    it "should return an empty array if the array is empty" do
      array = []
      expect(array.my_transpose).to eq([])
    end
  end
end

describe "#stock_picker" do
  it "should return the most profitable pair of days" do
    array = [1, 2, 3, 4, 5]
    expect(stock_picker(array)).to eq([0, 4])
  end

  it "should return an empty array if no pairs are found" do
    array = [5, 4, 3, 2, 1]
    expect(stock_picker(array)).to eq([])
  end

  it "should not mutate the array" do
    array = [1, 2, 3, 4, 5]
    arr_id = array.object_id
    stock_picker(array)
    expect(arr_id).to eq(array.object_id)
  end
end

describe "#towers of Hanoi" do
  it "should return the number of moves" do
    expect(towers_of_hanoi).to eq(7)
  end

  it "should not mutate the array" do
    arr_id = array.object_id
    towers_of_hanoi
    expect(arr_id).to eq(array.object_id)
  end

  it "should not allow a larger disk to be placed on a smaller disk" do
    expect(towers_of_hanoi).to raise_error("Cannot place a larger disk on a smaller disk")
  end
end
