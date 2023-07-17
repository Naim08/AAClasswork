require 'rspec'
require 'knight'

describe KnightPathFinder do
  describe "#initialize" do
    it "sets the start position and builds the move tree" do
      kpf = KnightPathFinder.new([0, 0])
      expect(kpf.start_pos).to eq([0, 0])
      expect(kpf.root_node.value).to eq([0, 0])
    end
  end

  describe "#find_path" do
    it "returns the shortest path to the end position" do
      kpf = KnightPathFinder.new([0, 0])
      expect(kpf.find_path([2, 1])).to eq([[0, 0], [2, 1]])
      expect(kpf.find_path([3, 3])).to eq([[0, 0], [2, 1], [3, 3]])
    end
  end
end
