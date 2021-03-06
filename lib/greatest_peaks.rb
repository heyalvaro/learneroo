require_relative '../lib/graphs/graph'
module GreatestPeaks
  include Graph

  class KingdomMap < Graph
    attr_reader :peaks
    attr_reader :areas

    def initialize
      @peaks = Array.new
      @areas = Hash.new
    end

    def fromArray(ar,row_quantity,column_quantity)

      rq = row_quantity
      cq = column_quantity

      @nodes = Hash.new
      ar.each_with_index {|n,idx| @nodes[[idx % column_quantity, idx / row_quantity]] = Graph::Node.new(n) }

      #Get the connections
      @nodes.values.each_with_index do |nod,idx|

        x = idx % cq
        y = idx / rq

        nod.connections << @nodes[[x - 1 , y]] unless x == 0
        nod.connections << @nodes[[x + 1 , y]] unless x == cq - 1
        nod.connections << @nodes[[x , y - 1]] unless y == 0
        nod.connections << @nodes[[x , y + 1]] unless y == rq - 1

        nod.connections.sort_by! {|n| n.data }
      end
      getPeaks
      getAreas
    end

    private

    def getPeaks
      @nodes.values.each do |nod|
        @peaks << nod if nod.connections.map{|n|n.data}.select{|n| n > nod.data }.empty?
      end
    end

    def getAreas
      @peaks.each{|p|@areas[p]=[]}
      @nodes.values.each do |nod|
        setNodeDominance(nod)
      end
    end

    def setNodeDominance(node)
      current = node
      while !@peaks.include? current
        current = current.connections.last
      end
      @areas[current] << node
    end

  end

end

