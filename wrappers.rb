def list
  `gdrive sync list`
end

def contents(folder_id)
  `gdrive sync content #{folder_id}`
end

def delete_file(file_id)
  `gdrive delete #{file_id}`
end

def upload_dir(remote_folder_id, local_dir)
  `gdrive sync upload #{local_dir}/ #{remote_folder_id}`
end

def remote_file_ids_to_remove(remote_folder_id, local_dir)
  remote_files = file_id_hash(remote_folder_id)
  local_files = Dir["#{local_dir}/*"].map { |f| File.basename f }
  (remote_files.keys - local_files).map { |name| remote_files[name] }
end

CONTENTS_REGEX = /(\w+) +([^ ]+)/

def folder_id_by_name(name)
  lines = list.split("\n")
  headers = lines.shift.match CONTENTS_REGEX
  lines.map { |l| l.match(CONTENTS_REGEX) }.find { |r| r[2] == name }[1]
end

def file_id_hash(folder_id)
  lines = contents(folder_id).split("\n")
  headers = lines.shift.match CONTENTS_REGEX
  {}.tap do |h|
    lines.each do |l|
      m = l.match(CONTENTS_REGEX)
      h[m[2]] = m[1]
    end
  end
end
