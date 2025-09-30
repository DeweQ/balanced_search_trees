require_relative "node"

module DataStructure
  # Balanced binary search tree class
  class Tree
    def initialize(array)
      @root = build_tree(array)
    end

    def build_tree(array)
      prep = array.sort.uniq
      build_tree_root(prep, 0, prep.size - 1)
    end

    def build_tree_root(array, left, right)
      return Node.new(array[left]) if left == right

      return nil if (right - left).negative?

      middle = (left + right) / 2
      node = Node.new(array[middle])
      node.left = build_tree_root(array, left, middle - 1)
      node.right = build_tree_root(array, middle + 1, right)
      node
    end
  end
end
