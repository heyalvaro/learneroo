require_relative '../../lib/graphs/graph'

describe "Tree.preOrder" do

  let(:tree){Graph::Tree.new}

  it "returns an array with the tree elements in preOrder" do
    tree.fromArray([1,7,5,2,6,0,9,3,7,5,11,0,0,4,0])
    expect(tree.preOrder).to match_array([3,7,2,5,11,6,7,4,9,5,1])
  end
end

describe "Tree.isBalanced?" do

  let(:tree){Graph::Tree.new}

  it "returns true if the tree is height-balanced" do
    tree.fromArray([1,2,3,4,5,6,7])
    expect(tree.isBalanced?).to be(true)
  end

  it "returns false if the tree isn't height-balanced" do
    tree.fromArray([1,2,3,4,0,0,5,6,0,0,0,0,0,0,7])
    expect(tree.isBalanced?).to be(false)
  end
end