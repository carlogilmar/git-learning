require 'digest/sha1'
require 'zlib'

# Github File
# Content
# Header
# blob content-length\0content\n


# Content
blob_content = "hello world"
#Header
blob_header = "blob #{blob_content.length}\0"
# Content + header = blob
blob_store = blob_header + blob_content + '\n'
# Creating the hash as identifier
blob_hash = Digest::SHA1.hexdigest(blob_store)
# Compress the file Zlib store
zlib_blob_store = Zlib::Deflate.deflate(blob_store)
# The file needs a folder, we have to create the directory
Dir.mkdir(".git/objects/#{blob_hash[0,2]}")
# We have to store the file into the new directory
File.open(".git/objects/#{blob_hash[0,2]}/#{blob_hash[2,38]}", "w") do |f|
  f.write zlib_blob_store
end

# We have a .git/objects/3b/iuyvo37vd

# We have to create a tree
# tree <legth>\0<mode><name>\0<sha>
tree_content = "100644 "+"README.md"+"\0"+"#{[blob_hash].pack('H*')}"
tree_header = "tree #{tree_content.length}" + "\0"
tree_store = tree_header + tree_content
tree_hash = Digest::SHA1.hexdigest(tree_store)
zlib_tree_store = Zlib::Deflate.deflate(tree_store)
Dir.mkdir(".git/objects/#{tree_hash[0,2]}")
# We have to store the file into the new directory
File.open(".git/objects/#{tree_hash[0,2]}/#{tree_hash[2,38]}", "w") do |f|
  f.write zlib_tree_store
end

# Create the commit content
commit_content = "tree #{tree_hash}\nauthor carlogilmar <carlogilmar12@gmail.com> #{Time.now.to_i} +0100\ncommitter carlogilmar <carlogilamr12@gmail.com> #{Time.now.to_i} +0100\n\ncreated readme file\n"
commit_header = "commit #{commit_content.length}" + '\0'
commit_store = commit_header + commit_content
commit_hash = Digest::SHA1.hexdigest(commit_store)
zlib_commit_store = Zlib::Deflate.deflate(commit_store)
Dir.mkdir(".git/objects/#{commit_hash[0,2]}")
# We have to store the file into the new directory
File.open(".git/objects/#{commit_hash[0,2]}/#{commit_hash[2,38]}", "w") do |f|
  f.write zlib_commit_store
end

# Add refs
#

# mkdir -p .git/refs/heads
# echo hash > .git/refs/heads/master
# echo 'ref: refs/heads/master' > .git/HEAD






