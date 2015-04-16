require 'yaml/store'

def verbose(msg)
  puts msg if $enwrite_verbose
end

def error(msg)
  $stderr.puts msg
end

def config_file
  return "#{ENV['HOME']}/.enwrite.config"
end

def config_store
  return YAML::Store.new(config_file())
end

def config(key, defval=nil)
  store = config_store
  return store.transaction { store.fetch(key, defval) }
end

def setconfig(key, val)
  store = config_store
  return store.transaction { store[key] = val }
end  