require 'securerandom'
require 'fileutils'

Array.new(600) do |idx|
  name = SecureRandom.alphanumeric(SecureRandom.random_number(6..10))
  suffix = %w[txt sh md].sample
  dir = case idx % 5
             when 0
               "app/models"
             when 1
               "prog1/"
             when 2
               "src/lib/"
             when 3
               "house/repl/"
             when 4
               "foo/bar"
             end
  FileUtils.mkdir_p(dir)
  File.write("#{dir}/#{name}.#{suffix}", <<~DATA)
    ## File #{name}.#{suffix}

    #{SecureRandom.alphanumeric(SecureRandom.random_number(6..10))}

    OK?
  DATA
end
