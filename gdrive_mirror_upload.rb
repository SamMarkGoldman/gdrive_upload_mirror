require_relative 'wrappers'

remote_folder_name = ARGV[0]
local_folder_name  = ARGV[1]
remote_folder_id = folder_id_by_name(remote_folder_name)

needing_removal = remote_file_ids_to_remove(remote_folder_id, local_folder_name)

puts "Removing #{needing_removal.count} files from cloud."
needing_removal.each { |f| puts delete_file f }

puts 'Uploading...'
puts upload_dir(remote_folder_id, local_folder_name)