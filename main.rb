require_relative "lib/tree"

t = DataStructure::Tree.new(Array.new(15) { rand(1..100) })
puts "Is tree balanced: #{t.balanced?}"
t.pretty_print
puts "Preorder:"
p t.preorder
puts "Inorder:"
p t.inorder
puts "Postorder:"
p t.postorder
puts "Unbalancing array..."
puts "Inserting: #{t.insert(rand(100..200)).data}"
puts "Inserting: #{t.insert(rand(100..200)).data}"
puts "Inserting: #{t.insert(rand(100..200)).data}"
puts "Inserting: #{t.insert(rand(100..200)).data}"
t.pretty_print
puts "Is tree balanced: #{t.balanced?}"
puts "Rebalancing tree.."
t.rebalance
t.pretty_print

puts "Deleting random values.."
200.times { t.delete(rand(1..200)) }
t.pretty_print
puts "Is tree balanced: #{t.balanced?}"
t.rebalance unless t.balanced?
t.pretty_print
