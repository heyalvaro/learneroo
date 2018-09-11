require_relative '../../lib/hashes/hashSet'

describe "primes_in" do
  let(:tests){[[2, 3, 5, 6, 9],[121, 17, 21, 29, 11, 341, 407, 19, 119, 352],[7, 6, 7, 3, 77, 14, 28, 35, 42],[55, 11, 33, 25, 15, 66, 35, 44, 16, 9, 22],[8035, 6759, 6113, 8721, 5595, 5985, 4643, 849, 629, 8933, 3659, 6086, 4337, 4589, 9119, 8049, 9337, 3407, 28, 6771, 1069, 3500, 8549, 9251, 2131, 5425, 2471, 11, 8173, 5277],[6358, 8623, 2345, 1385, 6037, 9161, 796, 8125, 8829, 9747, 2834, 3579, 1043, 1880, 3508, 9822, 8739, 2372, 7723, 5049, 2661, 5982, 9692, 9427, 562, 6617, 3756, 396, 7009, 3907, 6920, 3766, 6139, 6310, 7011, 650, 4758, 5153, 6200, 3146],[1817, 2231, 217, 371, 155, 943, 1219, 553, 679, 1057, 485, 253, 287, 299, 437, 713, 3473],[1817, 41, 2231, 217, 3631, 371, 155, 943, 1219, 553, 8803, 679, 1057, 485, 253, 287, 299, 437, 713, 3473]]}
  let(:results){[3,4,3,1,10,6,0,3]}
  it "gives a list of prime numers in an array" do
    tests.each_with_index do |t,idx|
      expect(primes_in(t).length).to eq results[idx]
    end
  end
end