require 'securerandom'
require 'fileutils'

Array.new(200) do |idx|
  name = SecureRandom.alphanumeric(SecureRandom.random_number(6..10))
  suffix = %w[txt sh md].sample
  dir = case idx % 5
             when 0
               "app/models/a/b/c/"
             when 1
               "prog1/a/b/c"
             when 2
               "src/lib/a/b/c"
             when 3
               "house/repl/a/b/c"
             when 4
               "foo/bara/b/c/"
             end
  FileUtils.mkdir_p(dir)
  File.write("#{dir}/#{name}.#{suffix}", <<~DATA)
    ## File #{name}.#{suffix}

    #{SecureRandom.alphanumeric(SecureRandom.random_number(6..10))}

    OK?
  DATA
end
