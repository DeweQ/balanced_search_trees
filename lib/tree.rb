require_relative "node"

module DataStructure
  # Balanced binary search tree class
  class Tree
    attr_reader :root

    def initialize(array)
      @root = build_tree(array)
    end

    def build_tree(array)
      prep = array.sort.uniq
      build_tree_root(prep, 0, prep.size - 1)
    end

    def pretty_print(node = @root, prefix = "", is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insert(data)
      insert_recursive(Node.new(data), @root)
    end

    def delete(data)
      node = root
      parent = nil
      until node.data.nil?
        parent = node
        return delete_node(node, parent) if node.data == data

        node = node.data > data ? node.left : node.right
      end
    end

    private

    def build_tree_root(array, left, right)
      return Node.new(array[left]) if left == right

      return nil if (right - left).negative?

      middle = (left + right) / 2
      node = Node.new(array[middle])
      node.left = build_tree_root(array, left, middle - 1)
      node.right = build_tree_root(array, middle + 1, right)
      node
    end

    def insert_recursive(data_node, current_node)
      return if data_node == current_node

      if data_node < current_node
        return current_node.left = data_node if current_node.left.nil?

        insert_recursive(data_node, current_node.left)
      else
        return current_node.right = data_node if current_node.right.nil?

        insert_recursive(data_node, current_node.right)
      end
    end

    def delete_node(node, parent)
      return delete_leaf(node, parent) if node.left.nil? && node.right.nil?

      if node.right.nil?
        predecessor_deletion(node.left, node)
      else
        successor_deletion(node.right, node)
      end
    end

    def predecessor_deletion(start, deletion_node)
      parent = deletion_node
      until start.right.nil?
        parent = start
        start = start.right
      end
      deletion_node.data, start.data = start.data, deletion_node.data
      delete_node(start, parent)
    end

    def successor_deletion(start, deletion_node)
      parent = deletion_node
      until start.left.nil?
        parent = start
        start = start.left
      end
      deletion_node.data, start.data = start.data, deletion_node.data
      delete_node(start, parent)
    end

    def delete_leaf(leaf, parent)
      parent.right = nil if parent.right == leaf
      parent.left = nil if parent.left == leaf
    end
  end
end
